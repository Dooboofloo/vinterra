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

# Update current world time
function vinterra:world/time/update_phase
function vinterra:world/time/apply_current