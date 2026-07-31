# vinterra:world/weather/tick_active
# Advances the temporary weather cycle while at least one player is online

execute unless score #advance_weather vin.weather matches 0 run scoreboard players add #timer vin.weather 1

execute if score #timer vin.weather >= #duration vin.weather run return run function vinterra:world/weather/advance

return 0