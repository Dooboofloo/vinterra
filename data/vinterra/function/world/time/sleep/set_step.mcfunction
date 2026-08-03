# vinterra:world/time/sleep/set_step
# Sets the accelerated time step without crossing the next Vinterra day boundary

scoreboard players operation #time_step vin.time_meta = #sleep_speed vin.time_meta

# Remaining Vinterra ticks until the next day
scoreboard players operation #sleep_remaining vin.time_meta = #72000 vin.time_meta
scoreboard players operation #sleep_remaining vin.time_meta -= #time_mod vin.time

# Land exactly on the next day boundary
execute if score #sleep_remaining vin.time_meta < #time_step vin.time_meta run scoreboard players operation #time_step vin.time_meta = #sleep_remaining vin.time_meta

return 1