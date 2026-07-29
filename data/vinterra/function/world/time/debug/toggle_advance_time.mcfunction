# vinterra:world/time/debug/toggle_advance_time
# Toggles the advancement of time

# Toggle Off -> On
execute if score #advance_time vin.time_meta matches 0 run tellraw @s "Time is advancing."
execute if score #advance_time vin.time_meta matches 0 run return run scoreboard players set #advance_time vin.time_meta 1

# Toggle On -> Off
tellraw @s "Time is NOT advancing."
return run scoreboard players set #advance_time vin.time_meta 0