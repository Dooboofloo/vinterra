# vinterra:world/snow/accumulation/bury
# Must be executed at a buryable block

setblock ~ ~ ~ minecraft:snow destroy

execute if block ~ ~ ~ minecraft:snow run return 1
return 0