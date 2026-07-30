# vinterra:world/weather/load
# Load entry point for the temporary global weather system

# Disable natural time progression
gamerule advance_weather false

# Global weather state
# 0: Clear
# 1: Snowfall
# 2: Blizzard
scoreboard objectives add vin.weather dummy

# Initialize persistent state only when missing or invalid
execute unless score #state vin.weather matches -2147483648..2147483647 run scoreboard players set #state vin.weather 0
execute unless score #timer vin.weather matches -2147483648..2147483647 run scoreboard players set #timer vin.weather 0
execute unless score #duration vin.weather matches -2147483648..2147483647 run function vinterra:world/weather/roll_duration

# Restore vanilla visuals after reload
function vinterra:world/weather/apply_current

return 1