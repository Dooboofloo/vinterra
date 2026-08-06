# vinterra:debug/load

scoreboard objectives add vin.debug_covered dummy

# Debug profiling
scoreboard objectives add vin.debug_profile_meta dummy
scoreboard objectives add vin.debug_profile_timer dummy
scoreboard objectives add vin.debug_profile_time_mod dummy

execute unless score #interval vin.debug_profile_meta matches -2147483648..2147483647 run scoreboard players set #interval vin.debug_profile_meta 20
execute unless score #duration vin.debug_profile_meta matches -2147483648..2147483647 run scoreboard players set #duration vin.debug_profile_meta 1200

execute unless data storage vinterra:debug profile.archive run data modify storage vinterra:debug profile.archive set value []
execute unless data storage vinterra:debug profile.schema run data modify storage vinterra:debug profile.schema set value 1