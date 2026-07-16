# vinterra:survival/warmth/block/cold/recalc
# Calculates ambient cold produced by nearby cold blocks
# Must be executed as and at the player

scoreboard players set @s vin.block_cold_raw 0
scoreboard players set @s vin.block_cold_total 0

# Scan shells for cold blocks
function vinterra:survival/warmth/block/cold/scan_generated/shell_1
function vinterra:survival/warmth/block/cold/scan_generated/shell_2
function vinterra:survival/warmth/block/cold/scan_generated/shell_3

# Convert quarter-points into final cold
scoreboard players operation @s vin.block_cold_total = @s vin.block_cold_raw
scoreboard players operation @s vin.block_cold_total /= #cold_scale vin.cold_meta

tellraw @s ["",{"text":"Block Cold Total: ","color":"aqua"},{"score":{"name":"@s","objective":"vin.block_cold_total"},"color":"aqua"},{"text":" (Raw ","color":"gray"},{"score":{"name":"@s","objective":"vin.block_cold_raw"},"color":"gray"},{"text":")","color":"gray"}]