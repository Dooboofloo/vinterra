# vinterra:world/weather/roll_duration
# Selects the duration of the current weather state
# Durations are measured in ticks

# Clear: 10-20 minutes
execute if score #state vin.weather matches 0 store result score #duration vin.weather run random value 12000..24000

# Snowfall: 5-10 minutes
execute if score #state vin.weather matches 1 store result score #duration vin.weather run random value 6000..12000

# Blizzard: 2.5-5 minutes
execute if score #state vin.weather matches 2 store result score #duration vin.weather run random value 3000..6000

return 1