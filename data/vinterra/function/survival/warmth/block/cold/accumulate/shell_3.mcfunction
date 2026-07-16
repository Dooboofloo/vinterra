# vinterra:survival/warmth/block/cold/accumulate/shell_3
# Adds the distance-reduced cold value of a cold block in shell 3
# Must be executed as the player

execute if block ~ ~ ~ #vinterra:cold_tier/1 run scoreboard players add @s vin.block_cold_raw 1
execute if block ~ ~ ~ #vinterra:cold_tier/2 run scoreboard players add @s vin.block_cold_raw 2
execute if block ~ ~ ~ #vinterra:cold_tier/3 run scoreboard players add @s vin.block_cold_raw 4

# State-dependent cold sources
execute if block ~ ~ ~ #vinterra:cold_tier/special run function vinterra:survival/warmth/block/cold/accumulate/special_macro {shell:3}