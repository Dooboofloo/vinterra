# vinterra:world/weather/advance
# Selects the next temporary weather state

# Invalid state fallback
execute unless score #state vin.weather matches 0..2 run return run function vinterra:world/weather/set/clear

# Clear always develops into snowfall
execute if score #state vin.weather matches 0 run return run function vinterra:world/weather/set/snowfall

# A blizzard weakens into ordinary snowfall
execute if score #state vin.weather matches 2 run return run function vinterra:world/weather/set/snowfall

# Snowfall has a 25% chance to intensify into a blizzard
# TODO: Balance this random chance and timing values
execute store result score #roll vin.weather run random value 0..99
execute if score #roll vin.weather matches 0..24 run return run function vinterra:world/weather/set/blizzard

# Otherwise, snowfall ends in clear weather
return run function vinterra:world/weather/set/clear