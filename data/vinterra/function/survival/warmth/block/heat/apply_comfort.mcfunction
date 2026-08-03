# vinterra:survival/warmth/block/heat/apply_comfort
# Amplifies positive block heat according to local Comfort
# Must be executed as the player

# Retain raw block heat for wetness calculation
scoreboard players operation @s vin.block_heat_total = @s vin.block_heat_raw

execute unless score @s vin.block_heat_total matches 1.. run return 0
execute unless score @s vin.comfort matches 1.. run return 0

# Block Heat = Base Block Heat * (1 + Comfort / #comfort_max) (100%-200%)
scoreboard players operation @s vin.warmth_tmp = @s vin.block_heat_total
scoreboard players operation @s vin.warmth_tmp *= @s vin.comfort
scoreboard players operation @s vin.warmth_tmp /= #comfort_max vin.comfort_meta
scoreboard players operation @s vin.block_heat_total += @s vin.warmth_tmp

return 1