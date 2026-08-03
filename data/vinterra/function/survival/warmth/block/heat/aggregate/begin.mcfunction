# vinterra:survival/warmth/block/heat/aggregate/begin
# Aggregates the strongest visible heat probes into the executing player's heat total
# Must be executed as and at the player

# Reset the player's landmark heat total
scoreboard players set @s vin.block_heat_raw 0

# Reset aggregation state
scoreboard players set #agg_rank vin.warmth_tmp 1
scoreboard players set #agg_max vin.warmth_tmp 0
scoreboard players set #agg_value vin.warmth_tmp 0

function vinterra:survival/warmth/block/heat/aggregate/cleanup

tag @e[type=marker,tag=vin.heat_probe] remove vin.heat_probe_aggregated

# Select and apply the strongest probes
function vinterra:survival/warmth/block/heat/aggregate/select_next

# Defensive cleanup
function vinterra:survival/warmth/block/heat/aggregate/cleanup

return 1