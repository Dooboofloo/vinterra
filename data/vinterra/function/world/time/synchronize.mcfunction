# vinterra:world/time/synchronize
# Recomputes all derived time values and applies the current Vinterra time to the Overworld

# Compute the modulo'd time for use in cycle calculations
scoreboard players operation #time_mod vin.time = #time vin.time
scoreboard players operation #time_mod vin.time %= #72000 vin.time_meta

# Compute the current day for use in final sky calculation
scoreboard players operation #day vin.time = #time vin.time
scoreboard players operation #day vin.time /= #72000 vin.time_meta

# Update current world time
function vinterra:world/time/update_phase
function vinterra:world/time/apply_current

return 1
