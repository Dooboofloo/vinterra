# vinterra:survival/warmth/ambient/climate/apply
# Calculate's the player's current biome's warmth contribution

# TODO: Update biome tags with new biomes once they exist
# TODO: Consider other dimensions here, though nether dimensions could also just be thrown in these tags. Nether should be colder

execute if biome ~ ~ ~ #vinterra:climate/mild run return run scoreboard players operation @s vin.warmth_ambient += #climate_mild vin.warmth_meta
execute if biome ~ ~ ~ #vinterra:climate/cold run return run scoreboard players operation @s vin.warmth_ambient += #climate_cold vin.warmth_meta
execute if biome ~ ~ ~ #vinterra:climate/severe run return run scoreboard players operation @s vin.warmth_ambient += #climate_severe vin.warmth_meta
execute if biome ~ ~ ~ #vinterra:climate/extreme run return run scoreboard players operation @s vin.warmth_ambient += #climate_extreme vin.warmth_meta

# Default fallback to cold biome value
scoreboard players operation @s vin.warmth_ambient += #climate_cold vin.warmth_meta

# Optionally include debug error here

return 0