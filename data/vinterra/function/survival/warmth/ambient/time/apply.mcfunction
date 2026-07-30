# vinterra:survival/warmth/ambient/time/apply
# Calculate's the player's current time warmth contribution

# The time system only affects only the overworld
execute unless dimension minecraft:overworld run return 0

execute if function vinterra:world/time/api/is_day run return run scoreboard players operation @s vin.warmth_ambient += #time_day vin.warmth_meta
execute if function vinterra:world/time/api/is_dusk run return run scoreboard players operation @s vin.warmth_ambient += #time_dusk vin.warmth_meta
execute if function vinterra:world/time/api/is_night run return run scoreboard players operation @s vin.warmth_ambient += #time_night vin.warmth_meta
execute if function vinterra:world/time/api/is_dawn run return run scoreboard players operation @s vin.warmth_ambient += #time_dawn vin.warmth_meta

return 0