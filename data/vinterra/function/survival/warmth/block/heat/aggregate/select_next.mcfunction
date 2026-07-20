# vinterra:survival/warmth/block/heat/aggregate/select_next
# Selects the strongest remaining visible probe
# Ties are resolved by proximity to the player
# Must be executed as and at the player

# Stop after the configured number of contributing sources
execute if score #agg_rank vin.heat_tmp > #aggregate_limit vin.heat_meta run return 1

# Remove stale transient selection tags
function vinterra:survival/warmth/block/heat/aggregate/cleanup

# Find the highest remaining positive value
scoreboard players set #agg_max vin.heat_tmp 0
scoreboard players operation #agg_max vin.heat_tmp > @e[type=marker,tag=vin.heat_probe,tag=vin.heat_probe_visible,tag=!vin.heat_probe_aggregated] vin.heat_val

# No positive sources remain
execute if score #agg_max vin.heat_tmp matches 0 run return 1

# Mark every remaining probe tied for the highest value
execute as @e[type=marker,tag=vin.heat_probe,tag=vin.heat_probe_visible,tag=!vin.heat_probe_aggregated] if score @s vin.heat_val = #agg_max vin.heat_tmp run tag @s add vin.heat_probe_aggregate_candidate

# Resolve ties by choosing the candidate nearest to the player
tag @e[type=marker,tag=vin.heat_probe_aggregate_candidate,sort=nearest,limit=1] add vin.heat_probe_aggregate_current

execute unless entity @e[type=marker,tag=vin.heat_probe_aggregate_current,limit=1] run return 0

function vinterra:survival/warmth/block/heat/aggregate/apply_current

# Continue with the next strongest source
return run function vinterra:survival/warmth/block/heat/aggregate/select_next