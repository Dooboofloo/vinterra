# vinterra:survival/warmth/block/heat/classify/static
# Runs as and at one visible heat probe

# Static heat tiers
execute if block ~ ~ ~ #vinterra:heat_tier/1 run scoreboard players operation @s vin.heat_val = #heat_tier_1 vin.heat_meta
execute if block ~ ~ ~ #vinterra:heat_tier/2 run scoreboard players operation @s vin.heat_val = #heat_tier_2 vin.heat_meta
execute if block ~ ~ ~ #vinterra:heat_tier/3 run scoreboard players operation @s vin.heat_val = #heat_tier_3 vin.heat_meta
execute if block ~ ~ ~ #vinterra:heat_tier/4 run scoreboard players operation @s vin.heat_val = #heat_tier_4 vin.heat_meta

# Special block-state-dependent values
function vinterra:survival/warmth/block/heat/classify/special