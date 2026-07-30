# vinterra:world/weather/api/is_precipitating
# Returns 1 during either snowfall or a blizzard

execute if score #state vin.weather matches 1..2 run return 1

return 0