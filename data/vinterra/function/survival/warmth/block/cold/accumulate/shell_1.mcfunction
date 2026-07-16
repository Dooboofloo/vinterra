# vinterra:survival/warmth/block/cold/accumulate/shell_1
# Adds the cold value of the block at the current execution position
# Must be executed as the player

execute if block ~ ~ ~ #vinterra:cold_tier/1 run scoreboard players add @s vin.block_cold_raw 8
execute if block ~ ~ ~ #vinterra:cold_tier/2 run scoreboard players add @s vin.block_cold_raw 16
execute if block ~ ~ ~ #vinterra:cold_tier/3 run scoreboard players add @s vin.block_cold_raw 32

# State-dependent cold sources
execute if block ~ ~ ~ #vinterra:cold_tier/special run function vinterra:survival/warmth/block/cold/accumulate/special_macro {shell:1}