# vinterra:world/time/load
# Load entry point for the world/time submodule

# Disable natural time progression
gamerule advance_time false

# Initialize scoreboard objectives
scoreboard objectives add vin.time dummy
scoreboard objectives add vin.time_meta dummy

# Initialize default scoreboard values (only first time)
execute unless score #time vin.time matches -2147483648..2147483647 run scoreboard players set #time vin.time 0
execute unless score #time_mod vin.time matches -2147483648..2147483647 run scoreboard players set #time_mod vin.time 0
execute unless score #day vin.time matches -2147483648..2147483647 run scoreboard players set #day vin.time 0
execute unless score #sky_cycle vin.time matches -2147483648..2147483647 run scoreboard players set #sky_cycle vin.time 0
execute unless score #sky vin.time matches -2147483648..2147483647 run scoreboard players set #sky vin.time 0
execute unless score #phase vin.time matches -2147483648..2147483647 run scoreboard players set #phase vin.time 0
execute unless score #tmp vin.time_meta matches -2147483648..2147483647 run scoreboard players set #tmp vin.time_meta 0

execute unless score #advance_time vin.time_meta matches -2147483648..2147483647 run scoreboard players set #advance_time vin.time_meta 1

# Initialize scoreboard constants
scoreboard players set #1000 vin.time_meta 1000
scoreboard players set #6000 vin.time_meta 6000
scoreboard players set #10000 vin.time_meta 10000
scoreboard players set #12000 vin.time_meta 12000
scoreboard players set #13000 vin.time_meta 13000
scoreboard players set #18000 vin.time_meta 18000
scoreboard players set #23000 vin.time_meta 23000
scoreboard players set #24000 vin.time_meta 24000
scoreboard players set #48000 vin.time_meta 48000
scoreboard players set #66000 vin.time_meta 66000
scoreboard players set #72000 vin.time_meta 72000

### ===== SLEEP =====

# Prevent vanilla from independently skipping the night (which doesn't work anyway)
gamerule minecraft:players_sleeping_percentage 101

# Number of Vinterra ticks advanced per server tick while everyone sleeps
# NOTE: Only astronomical time speeds up. All other systems remain on their own schedules
scoreboard players set #sleep_speed vin.time_meta 120

# Global sleep state and scratch values
scoreboard players set #sleep_active vin.time_meta 0
scoreboard players set #sleep_was_active vin.time_meta 0
scoreboard players set #sleep_eligible vin.time_meta 0
scoreboard players set #sleeping vin.time_meta 0
scoreboard players set #sleep_remaining vin.time_meta 0
scoreboard players set #time_step vin.time_meta 1

# Earliest natural wake threshold: clear-weather sky time 23460
# Dawn maps 66000..71999 onto 23000..23999, so this corresponds to Vinterra time 68760
scoreboard players set #sleep_commit_time vin.time_meta 68760

### ===== Apply =====
# Update current world time
function vinterra:world/time/synchronize