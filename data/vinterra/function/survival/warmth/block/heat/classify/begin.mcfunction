# vinterra:survival/warmth/block/heat/classify/begin
# Assigns heat value to one discovered heat probe
# Must be executed as and at the probe

scoreboard players set @s vin.heat_val 0

# Static heat tiers
execute if block ~ ~ ~ #vinterra:heat_tier/1 run return run scoreboard players operation @s vin.heat_val = #heat_tier_1 vin.warmth_meta
execute if block ~ ~ ~ #vinterra:heat_tier/2 run return run scoreboard players operation @s vin.heat_val = #heat_tier_2 vin.warmth_meta
execute if block ~ ~ ~ #vinterra:heat_tier/3 run return run scoreboard players operation @s vin.heat_val = #heat_tier_3 vin.warmth_meta
execute if block ~ ~ ~ #vinterra:heat_tier/4 run return run scoreboard players operation @s vin.heat_val = #heat_tier_4 vin.warmth_meta

# Special block-state-dependent values
function vinterra:survival/warmth/block/heat/classify/special