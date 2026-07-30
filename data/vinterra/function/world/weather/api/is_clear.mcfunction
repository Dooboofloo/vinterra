# vinterra:world/weather/api/is_clear
# Returns 1 when the temporary weather state is clear

execute if score #state vin.weather matches 0 run return 1

return 0