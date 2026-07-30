# vinterra:world/weather/api/is_blizzard
# Returns 1 during a blizzard

execute if score #state vin.weather matches 2 run return 1

return 0