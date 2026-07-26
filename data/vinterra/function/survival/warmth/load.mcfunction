# vinterra:survival/warmth/load
# Load entry point for the survival/warmth submodule

### ===== FINAL WARMTH STATE =====

# Sampled warmth produced by the player's current circumstances
scoreboard objectives add vin.warmth_target dummy

# Player's current interpolated warmth
scoreboard objectives add vin.warmth_effective dummy

# Per-tick interpolation math
scoreboard objectives add vin.warmth_step dummy

# Final contribution categories
scoreboard objectives add vin.warmth_ambient dummy
scoreboard objectives add vin.warmth_equipment dummy
scoreboard objectives add vin.warmth_block dummy

# Warmth helpers
scoreboard objectives add vin.warmth_meta dummy
scoreboard objectives add vin.warmth_tmp dummy

scoreboard players set #warmth_smoothing vin.warmth_meta 18

# Temp value for testing purposes. Used to initialize players
# Player initialization will eventually be owned by its own module, which will also allow
# for urgent requests to recalculate warmth (still through scheduler, but skipping queue)
scoreboard players set #warmth_default vin.warmth_meta -25


### ===== AMBIENT CONTRIBUTION =====

# Biome climate category warmth values
scoreboard players set #climate_mild vin.warmth_meta -15
scoreboard players set #climate_cold vin.warmth_meta -25
scoreboard players set #climate_severe vin.warmth_meta -40
scoreboard players set #climate_extreme vin.warmth_meta -55


# Time of Day category warmth values (only applies when player is exposed)
scoreboard players set #time_day vin.warmth_meta 5
scoreboard players set #time_dusk vin.warmth_meta 0
scoreboard players set #time_night vin.warmth_meta -10
scoreboard players set #time_dawn vin.warmth_meta -5


# Weather category warmth values (only applies when player is exposed)
# warmth clear = 0
scoreboard players set #weather_rain vin.warmth_meta -5
scoreboard players set #weather_snow vin.warmth_meta -8
scoreboard players set #weather_blizzard vin.warmth_meta -15
# even more for blizzard?


### ===== BLOCK CONTRIBUTION =====

## BLOCK HEAT

# Scoreboard objectives for survival/warmth/block/heat
scoreboard objectives add vin.heat_val dummy

# Final block heat contribution for each player
scoreboard objectives add vin.block_heat_total dummy

# Scoreboard tracking the number of found heat landmarks
execute unless score #found vin.warmth_tmp matches -2147483648..2147483647 run scoreboard players set #found vin.warmth_tmp 0

# Heat raycast constants
scoreboard players set #raycast_limit vin.warmth_meta 16
scoreboard players set #ray_step_limit vin.warmth_meta 80

# Heat value constants
scoreboard players set #heat_tier_1 vin.warmth_meta 27
scoreboard players set #heat_tier_2 vin.warmth_meta 54
scoreboard players set #heat_tier_3 vin.warmth_meta 80
scoreboard players set #heat_tier_4 vin.warmth_meta 108

# Aggregation constants
scoreboard players set #aggregate_limit vin.warmth_meta 4

# Number constants
scoreboard players set #2 vin.warmth_meta 2
scoreboard players set #3 vin.warmth_meta 3
scoreboard players set #4 vin.warmth_meta 4
scoreboard players set #8 vin.warmth_meta 8


## BLOCK COLD

# Block cold contribution for each player
scoreboard objectives add vin.block_cold_raw dummy
scoreboard objectives add vin.block_cold_total dummy

# Cold calculation constants
scoreboard players set #cold_scale vin.warmth_meta 16

# Special cold-source constants
scoreboard players set #special_shell_1 vin.warmth_meta 2
scoreboard players set #special_shell_2 vin.warmth_meta 1
scoreboard players set #special_shell_3 vin.warmth_meta 0


### ===== EQUIPMENT CONTRIBUTION =====

scoreboard objectives add vin.warmth_equipment_raw dummy

### ===== MISC PLAYER ATTRIBUTES =====

scoreboard objectives add vin.over_edge dummy