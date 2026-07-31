# vinterra:survival/comfort/finalize
# Combines all Comfort sources and clamps the player's final Comfort
# Must be executed as the player

scoreboard players operation @s vin.comfort = @s vin.comfort_blocks
scoreboard players operation @s vin.comfort += @s vin.comfort_equipment

# Quantize accumulated quarter-points to whole Comfort levels from 0 to 16
scoreboard players operation @s vin.comfort /= #comfort_scale vin.comfort_meta

execute if score @s vin.comfort matches ..-1 run scoreboard players set @s vin.comfort 0
execute if score @s vin.comfort > #comfort_max vin.comfort_meta run scoreboard players operation @s vin.comfort = #comfort_max vin.comfort_meta

return 1