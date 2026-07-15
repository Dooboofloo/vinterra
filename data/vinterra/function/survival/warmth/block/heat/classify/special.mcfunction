# vinterra:survival/warmth/block/heat/classify/special
# Runs as and at one visible heat probe

execute if block ~ ~ ~ minecraft:campfire[lit=true] run scoreboard players operation @s vin.heat_val = #heat_tier_3 vin.heat_meta
execute if block ~ ~ ~ minecraft:soul_campfire[lit=true] run scoreboard players operation @s vin.heat_val = #heat_tier_4 vin.heat_meta

execute if block ~ ~ ~ minecraft:furnace[lit=true] run scoreboard players operation @s vin.heat_val = #heat_tier_2 vin.heat_meta
execute if block ~ ~ ~ minecraft:smoker[lit=true] run scoreboard players operation @s vin.heat_val = #heat_tier_2 vin.heat_meta
execute if block ~ ~ ~ minecraft:blast_furnace[lit=true] run scoreboard players operation @s vin.heat_val = #heat_tier_3 vin.heat_meta

# TODO: More special heat blocks. Candles, redstone components, etc.