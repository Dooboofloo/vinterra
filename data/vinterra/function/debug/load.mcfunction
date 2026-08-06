# vinterra:debug/load

scoreboard objectives add vin.debug_covered dummy

# Debug profiling
scoreboard objectives add vin.debug_profile_timer dummy

execute unless data storage vinterra:debug profile.archive run data modify storage vinterra:debug profile.archive set value []
execute unless data storage vinterra:debug profile.schema run data modify storage vinterra:debug profile.schema set value 1