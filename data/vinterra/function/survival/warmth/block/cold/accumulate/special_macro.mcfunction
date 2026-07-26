# vinterra:survival/warmth/block/cold/accumulate/special_macro
# Accumulates state-dependent cold from the block at the current position
# Macro arguments: {shell:1}, {shell:2}, or {shell:3}
# Must be executed as the player at the block being checked

scoreboard players set #special_cold vin.block_cold_raw 0

# Unlit copper bulbs are treated like normal metal blocks (T1 cold)
execute if block ~ ~ ~ #vinterra:copper/bulbs[lit=false] run scoreboard players set #special_cold vin.block_cold_raw 8

# Snow layers
execute if block ~ ~ ~ minecraft:snow[layers=1] run scoreboard players set #special_cold vin.block_cold_raw 1
execute if block ~ ~ ~ minecraft:snow[layers=2] run scoreboard players set #special_cold vin.block_cold_raw 2
execute if block ~ ~ ~ minecraft:snow[layers=3] run scoreboard players set #special_cold vin.block_cold_raw 3
execute if block ~ ~ ~ minecraft:snow[layers=4] run scoreboard players set #special_cold vin.block_cold_raw 4
execute if block ~ ~ ~ minecraft:snow[layers=5] run scoreboard players set #special_cold vin.block_cold_raw 5
execute if block ~ ~ ~ minecraft:snow[layers=6] run scoreboard players set #special_cold vin.block_cold_raw 6
execute if block ~ ~ ~ minecraft:snow[layers=7] run scoreboard players set #special_cold vin.block_cold_raw 7
execute if block ~ ~ ~ minecraft:snow[layers=8] run scoreboard players set #special_cold vin.block_cold_raw 8

# Apply the shell-specific value per layer
$scoreboard players operation #special_cold vin.block_cold_raw *= #special_shell_$(shell) vin.warmth_meta

# Add the resulting value to the player's ambient block cold
scoreboard players operation @s vin.block_cold_raw += #special_cold vin.block_cold_raw

return 1