# vinterra:survival/warmth/block/cold/accumulate/shell_2
# Adds the distance-reduced cold value of a cold block in shell 2
# Must be executed as the player

execute if block ~ ~ ~ #vinterra:cold_tier/1 run scoreboard players add @s vin.block_cold_raw 4
execute if block ~ ~ ~ #vinterra:cold_tier/2 run scoreboard players add @s vin.block_cold_raw 8
execute if block ~ ~ ~ #vinterra:cold_tier/3 run scoreboard players add @s vin.block_cold_raw 16

# State-dependent cold sources
execute if block ~ ~ ~ #vinterra:cold_tier/special run function vinterra:survival/warmth/block/cold/accumulate/special_macro {shell:2}