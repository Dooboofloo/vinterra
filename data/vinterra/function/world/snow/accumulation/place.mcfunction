# vinterra:world/snow/accumulation/place
# Attempts to add one unit of persistent snow to the selected surface column
# Must be executed at the world-surface block

# The current Vinterra preset treats every non-dry biome as snowfall-capable
execute unless predicate vinterra:location/precipitating_biome run return 0

# Snow interactions
execute if block ~ ~ ~ #vinterra:snow/interactable run return run function vinterra:world/snow/accumulation/interact

# Special case burying
execute if block ~ ~ ~ minecraft:pitcher_crop[half=upper] if block ~ ~-1 ~ minecraft:pitcher_crop[half=lower] unless block ~ ~-2 ~ #vinterra:snow/cannot_accumulate_on run return run function vinterra:world/snow/accumulation/bury_tall

# Bury and destroy a buryable blocks
execute if block ~ ~ ~ #vinterra:snow/tall_buryable if block ~ ~-1 ~ #vinterra:snow/tall_buryable unless block ~ ~-2 ~ #vinterra:snow/cannot_accumulate_on run return run function vinterra:world/snow/accumulation/bury_tall
execute if block ~ ~ ~ #vinterra:snow/buryable unless block ~ ~-1 ~ #vinterra:snow/cannot_accumulate_on run return run function vinterra:world/snow/accumulation/bury

# Increment an existing snow-layer stack
execute if block ~ ~ ~ minecraft:snow[layers=1] run return run setblock ~ ~ ~ minecraft:snow[layers=2]
execute if block ~ ~ ~ minecraft:snow[layers=2] run return run setblock ~ ~ ~ minecraft:snow[layers=3]
execute if block ~ ~ ~ minecraft:snow[layers=3] run return run setblock ~ ~ ~ minecraft:snow[layers=4]
execute if block ~ ~ ~ minecraft:snow[layers=4] run return run setblock ~ ~ ~ minecraft:snow[layers=5]
execute if block ~ ~ ~ minecraft:snow[layers=5] run return run setblock ~ ~ ~ minecraft:snow[layers=6]
execute if block ~ ~ ~ minecraft:snow[layers=6] run return run setblock ~ ~ ~ minecraft:snow[layers=7]
execute if block ~ ~ ~ minecraft:snow[layers=7] run return run setblock ~ ~ ~ minecraft:snow[layers=8]

# Promote a completed layer stack into a full block
execute if block ~ ~ ~ minecraft:snow[layers=8] run return run setblock ~ ~ ~ minecraft:snow_block

# A new stack requires an empty target and some form of support below it
execute unless block ~ ~1 ~ #minecraft:air run return 0
execute if block ~ ~ ~ #minecraft:air run return 0
execute if block ~ ~ ~ #vinterra:snow/cannot_accumulate_on run return 0

# Common state-sensitive partial blocks only support snow when they present a top surface
execute if block ~ ~ ~ #minecraft:slabs[type=bottom] run return 0
execute if block ~ ~ ~ #minecraft:stairs[half=bottom] run return 0
execute if block ~ ~ ~ #minecraft:trapdoors[open=true] run return 0
execute if block ~ ~ ~ #minecraft:trapdoors[half=bottom] run return 0

# Place the first layer, then verify that it survived the resulting block updates
setblock ~ ~1 ~ minecraft:snow[layers=1] keep
execute if block ~ ~1 ~ minecraft:snow[layers=1] run return 1

return 0