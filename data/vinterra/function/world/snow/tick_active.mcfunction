# vinterra:world/snow/tick_active
# Active tick entry point for persistent snow simulation
# Active tick functions (including this one) are only run if there is at least one player online

# Accumulation advances only during ordinary snowfall or a blizzard
execute if function vinterra:world/weather/api/is_precipitating run return run function vinterra:world/snow/tick_precipitating

# Do not carry partial pulse progress across clear-weather periods
scoreboard players set #pulse_clock vin.snow 0

return 0