# vinterra:world/weather/api/is_snowfall
# Returns 1 during ordinary snowfall, excluding blizzards

execute if score #state vin.weather matches 1 run return 1

return 0