# vinterra:debug/gamerule/toggle_advance_weather
# Toggles the advancement of weather

# Toggle Off -> On
execute if score #advance_weather vin.weather matches 0 run tellraw @s "Weather is advancing."
execute if score #advance_waether vin.weather matches 0 run return run scoreboard players set #advance_weather vin.weather 1

# Toggle On -> Off
tellraw @s "Weather is NOT advancing."
return run scoreboard players set #advance_weather vin.weather 0