# vinterra:survival/warmth/block/heat/classify/special
# Runs as and at one visible heat probe

### SPECIAL

# Lit candles (each candle adds 1/4 of a tier 1 heat source)
execute if block ~ ~ ~ #minecraft:candles[lit=true] run scoreboard players operation @s vin.heat_val = #heat_tier_1 vin.warmth_meta

execute if block ~ ~ ~ #minecraft:candles[lit=true,candles=2] run scoreboard players operation @s vin.heat_val *= #2 vin.warmth_meta
execute if block ~ ~ ~ #minecraft:candles[lit=true,candles=3] run scoreboard players operation @s vin.heat_val *= #3 vin.warmth_meta
execute if block ~ ~ ~ #minecraft:candles[lit=true,candles=4] run scoreboard players operation @s vin.heat_val *= #4 vin.warmth_meta

execute if block ~ ~ ~ #minecraft:candles[lit=true] run return run scoreboard players operation @s vin.heat_val /= #4 vin.warmth_meta


# Copper lanterns (normally a T2 source, but degrades with oxidization)

execute if block ~ ~ ~ #vinterra:copper/lanterns run scoreboard players operation @s vin.heat_val = #heat_tier_2 vin.warmth_meta

execute if block ~ ~ ~ minecraft:weathered_copper_lantern run scoreboard players operation @s vin.heat_val *= #2 vin.warmth_meta
execute if block ~ ~ ~ minecraft:waxed_weathered_copper_lantern run scoreboard players operation @s vin.heat_val *= #2 vin.warmth_meta

execute if block ~ ~ ~ minecraft:exposed_copper_lantern run scoreboard players operation @s vin.heat_val *= #3 vin.warmth_meta
execute if block ~ ~ ~ minecraft:waxed_exposed_copper_lantern run scoreboard players operation @s vin.heat_val *= #3 vin.warmth_meta

execute if block ~ ~ ~ minecraft:copper_lantern run scoreboard players operation @s vin.heat_val *= #4 vin.warmth_meta
execute if block ~ ~ ~ minecraft:waxed_copper_lantern run scoreboard players operation @s vin.heat_val *= #4 vin.warmth_meta

execute if block ~ ~ ~ #vinterra:copper/lanterns run return run scoreboard players operation @s vin.heat_val /= #4 vin.warmth_meta


# Lit copper bulbs (normally a T3 source, but degrades with oxidization) (unlit copper bulbs are cold)

execute if block ~ ~ ~ #vinterra:copper/bulbs[lit=true] run scoreboard players operation @s vin.heat_val = #heat_tier_3 vin.warmth_meta

execute if block ~ ~ ~ minecraft:weathered_copper_bulb[lit=true] run scoreboard players operation @s vin.heat_val *= #2 vin.warmth_meta
execute if block ~ ~ ~ minecraft:waxed_weathered_copper_bulb[lit=true] run scoreboard players operation @s vin.heat_val *= #2 vin.warmth_meta

execute if block ~ ~ ~ minecraft:exposed_copper_bulb[lit=true] run scoreboard players operation @s vin.heat_val *= #3 vin.warmth_meta
execute if block ~ ~ ~ minecraft:waxed_exposed_copper_bulb[lit=true] run scoreboard players operation @s vin.heat_val *= #3 vin.warmth_meta

execute if block ~ ~ ~ minecraft:copper_bulb[lit=true] run scoreboard players operation @s vin.heat_val *= #4 vin.warmth_meta
execute if block ~ ~ ~ minecraft:waxed_copper_bulb[lit=true] run scoreboard players operation @s vin.heat_val *= #4 vin.warmth_meta

execute if block ~ ~ ~ #vinterra:copper/bulbs[lit=true] run return run scoreboard players operation @s vin.heat_val /= #4 vin.warmth_meta

### TIER 1

# None yet!

### TIER 2

# Lit Furnace / Smoker
execute if block ~ ~ ~ minecraft:furnace[lit=true] run return run scoreboard players operation @s vin.heat_val = #heat_tier_2 vin.warmth_meta
execute if block ~ ~ ~ minecraft:smoker[lit=true] run return run scoreboard players operation @s vin.heat_val = #heat_tier_2 vin.warmth_meta

# Lit Brewing Stand
execute if block ~ ~ ~ minecraft:brewing_stand unless data block ~ ~ ~ {BrewTime:0s} run return run scoreboard players operation @s vin.heat_val = #heat_tier_2 vin.warmth_meta

# Lit Campfire
execute if block ~ ~ ~ minecraft:campfire[lit=true] run return run scoreboard players operation @s vin.heat_val = #heat_tier_2 vin.warmth_meta

### TIER 3

# Lit Blast Furnace
execute if block ~ ~ ~ minecraft:blast_furnace[lit=true] run return run scoreboard players operation @s vin.heat_val = #heat_tier_3 vin.warmth_meta

### TIER 4

# Lit Soul Campfire
execute if block ~ ~ ~ minecraft:soul_campfire[lit=true] run return run scoreboard players operation @s vin.heat_val = #heat_tier_4 vin.warmth_meta

### Failure
return 0
