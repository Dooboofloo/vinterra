# vinterra:world/snow/accumulation/bury_tall
# Must be executed at the upper half of a two-block buryable plant

setblock ~ ~ ~ minecraft:air destroy
setblock ~ ~-1 ~ minecraft:snow destroy

execute if block ~ ~-1 ~ minecraft:snow run return 1
return 0