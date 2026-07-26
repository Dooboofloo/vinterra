# vinterra:survival/warmth/block/cold/accumulate/shell_3
# Adds the distance-reduced cold value of a cold block in shell 3
# Must be executed as the player

execute if block ~ ~ ~ #vinterra:cold_tier/1 run return run scoreboard players add @s vin.block_cold_raw 1
execute if block ~ ~ ~ #vinterra:cold_tier/2 run return run scoreboard players add @s vin.block_cold_raw 2
execute if block ~ ~ ~ #vinterra:cold_tier/3 run return run scoreboard players add @s vin.block_cold_raw 4

# Unlit copper bulbs are treated like normal metal blocks (T1 cold)
execute if block ~ ~ ~ #vinterra:copper/bulbs[lit=false] run return run scoreboard players add @s vin.block_cold_raw 1