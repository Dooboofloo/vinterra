# vinterra:world/snow/tick_precipitating
# Advances the accumulation pulse clock while precipitation is active

scoreboard players add #pulse_clock vin.snow 1
execute if score #pulse_clock vin.snow < #pulse_interval vin.snow run return 0

scoreboard players set #pulse_clock vin.snow 0

# Ordinary snowfall is the default precipitating rate
scoreboard players operation #attempts_remaining vin.snow = #snowfall_attempts vin.snow

# Blizzards use the higher accumulation rate
execute if function vinterra:world/weather/api/is_blizzard run scoreboard players operation #attempts_remaining vin.snow = #blizzard_attempts vin.snow

return run function vinterra:world/snow/accumulation/pulse