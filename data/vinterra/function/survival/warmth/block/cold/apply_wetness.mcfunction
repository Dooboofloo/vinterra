# vinterra:survival/warmth/block/cold/apply_wetness
# Amplifies nearby block cold according to Wetness
# Must be executed as the player

# Guard clause
execute unless score @s vin.block_cold_total matches 1.. run return 0

# Block Cold = Base Block Cold * (1 + Wetness / 3200) (100% to 150%)
scoreboard players operation @s vin.warmth_tmp = @s vin.block_cold_total
scoreboard players operation @s vin.warmth_tmp *= @s vin.wetness
scoreboard players operation @s vin.warmth_tmp /= #wetness_cold_scale vin.comfort_meta
scoreboard players operation @s vin.block_cold_total += @s vin.warmth_tmp

return 1