# vinterra:world/snow/load
# Load entry point for the persistent snow submodule

# Allow vanilla snowfall to accumulate a complete eight-layer stack
gamerule max_snow_accumulation_height 8

# Shared snow state, runtime values, and tuning constants
scoreboard objectives add vin.snow dummy

# Run one accumulation pulse every 10 ticks while precipitation is active
scoreboard players set #pulse_interval vin.snow 10
scoreboard players set #pulse_clock vin.snow 0

# Server-wide accumulation attempts performed during each pulse
scoreboard players set #snowfall_attempts vin.snow 2
scoreboard players set #blizzard_attempts vin.snow 8

# Shared runtime values
scoreboard players set #attempts_remaining vin.snow 0
scoreboard players set #attempt_result vin.snow 0
scoreboard players set #spread_success vin.snow 0
scoreboard players set #pulse_successes vin.snow 0

# Remove transient state left by an interrupted execution or reload
function vinterra:world/snow/accumulation/cleanup

return 1