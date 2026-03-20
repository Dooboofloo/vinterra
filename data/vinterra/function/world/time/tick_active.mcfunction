# vinterra:world/time/tick_active
# Active tick entry point the for world/time submodule
# Active tick functions (including this one) are only run if there is at least one player online

# Increment the current time
scoreboard players add #time vin.time 1

# Compute the modulo'd time for use in cycle calculations
scoreboard players operation #time_mod vin.time = #time vin.time
scoreboard players operation #time_mod vin.time %= #72000 vin.time_const

# Compute the current day for use in final sky calculation
scoreboard players operation #day vin.time = #time vin.time
scoreboard players operation #day vin.time /= #72000 vin.time_const

# Update current world time
function vinterra:world/time/update_phase
function vinterra:world/time/apply_current