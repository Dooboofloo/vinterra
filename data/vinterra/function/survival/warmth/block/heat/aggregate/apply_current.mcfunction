# vinterra:survival/warmth/block/heat/aggregate/apply_current
# Applies the current probe using the multiplier for its aggregation rank
# Must be executed as and at the player

# Copy the selected probe's full value
scoreboard players operation #agg_value vin.heat_tmp = @e[type=marker,tag=vin.heat_probe_aggregate_current,sort=nearest,limit=1] vin.heat_val

# Diminishing returns by rank
execute if score #agg_rank vin.heat_tmp matches 2 run scoreboard players operation #agg_value vin.heat_tmp /= #2 vin.heat_meta
execute if score #agg_rank vin.heat_tmp matches 3 run scoreboard players operation #agg_value vin.heat_tmp /= #4 vin.heat_meta
execute if score #agg_rank vin.heat_tmp matches 4 run scoreboard players operation #agg_value vin.heat_tmp /= #8 vin.heat_meta

# Add the adjusted value to the player
scoreboard players operation @s vin.block_heat_total += #agg_value vin.heat_tmp

# Consume the selected probe
tag @e[type=marker,tag=vin.heat_probe_aggregate_current,sort=nearest,limit=1] add vin.heat_probe_aggregated

scoreboard players add #agg_rank vin.heat_tmp 1

function vinterra:survival/warmth/block/heat/aggregate/cleanup

return 1