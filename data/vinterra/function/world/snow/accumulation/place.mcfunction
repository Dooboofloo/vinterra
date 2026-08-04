# vinterra:world/snow/accumulation/place
# Attempts to add one unit of persistent snow to the selected surface column
# Must be executed as the snow probe immediately above the world surface

# The current Vinterra preset treats every non-dry biome as snowfall-capable
execute unless predicate vinterra:location/precipitating_biome run return 0

# Increment an existing snow-layer stack
execute if block ~ ~-1 ~ minecraft:snow[layers=1] run return run setblock ~ ~-1 ~ minecraft:snow[layers=2]
execute if block ~ ~-1 ~ minecraft:snow[layers=2] run return run setblock ~ ~-1 ~ minecraft:snow[layers=3]
execute if block ~ ~-1 ~ minecraft:snow[layers=3] run return run setblock ~ ~-1 ~ minecraft:snow[layers=4]
execute if block ~ ~-1 ~ minecraft:snow[layers=4] run return run setblock ~ ~-1 ~ minecraft:snow[layers=5]
execute if block ~ ~-1 ~ minecraft:snow[layers=5] run return run setblock ~ ~-1 ~ minecraft:snow[layers=6]
execute if block ~ ~-1 ~ minecraft:snow[layers=6] run return run setblock ~ ~-1 ~ minecraft:snow[layers=7]
execute if block ~ ~-1 ~ minecraft:snow[layers=7] run return run setblock ~ ~-1 ~ minecraft:snow[layers=8]

# Promote a completed layer stack into a full block
execute if block ~ ~-1 ~ minecraft:snow[layers=8] run return run setblock ~ ~-1 ~ minecraft:snow_block

# A new stack requires an empty target and some form of support below it
execute unless block ~ ~ ~ #minecraft:air run return 0
execute if block ~ ~-1 ~ #minecraft:air run return 0
execute if block ~ ~-1 ~ #vinterra:snow/cannot_accumulate_on run return 0

# Common state-sensitive partial blocks only support snow when they present a top surface
execute if block ~ ~-1 ~ #minecraft:slabs[type=bottom] run return 0
execute if block ~ ~-1 ~ #minecraft:stairs[half=bottom] run return 0
execute if block ~ ~-1 ~ #minecraft:trapdoors[open=true] run return 0
execute if block ~ ~-1 ~ #minecraft:trapdoors[half=bottom] run return 0

# Place the first layer, then verify that it survived the resulting block updates
setblock ~ ~ ~ minecraft:snow[layers=1] keep
execute if block ~ ~ ~ minecraft:snow[layers=1] run return 1

return 0