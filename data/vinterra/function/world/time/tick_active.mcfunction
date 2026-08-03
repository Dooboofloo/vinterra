# vinterra:world/time/tick_active
# Active tick entry point the for world/time submodule
# Active tick functions (including this one) are only run if there is at least one player online

# Determine whether all eligible Overworld players are sleeping
function vinterra:world/time/sleep/update

# Time is paused by default, advances normally when enabled, or rapidly while everyone sleeps
scoreboard players set #time_step vin.time_meta 0
execute unless score #advance_time vin.time_meta matches 0 run scoreboard players set #time_step vin.time_meta 1
execute if score #sleep_active vin.time_meta matches 1 run function vinterra:world/time/sleep/set_step

# Advance the authoritative Vinterra clock
scoreboard players operation #time vin.time += #time_step vin.time_meta

# Recompute time state and apply it
function vinterra:world/time/synchronize