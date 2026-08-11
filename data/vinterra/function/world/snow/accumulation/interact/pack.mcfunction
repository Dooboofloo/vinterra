# vinterra:world/snow/accumulation/interact/pack

execute store result score #roll vin.snow run random value 0..999

# When ticked, an ice block has a 12.5% chance to promote into the next packed stage
execute unless score #roll vin.snow matches 0..124 run return 0

# Pack!
execute if block ~ ~ ~ minecraft:ice run return run setblock ~ ~ ~ minecraft:packed_ice replace
execute if block ~ ~ ~ minecraft:packed_ice run return run setblock ~ ~ ~ minecraft:blue_ice replace

return 0