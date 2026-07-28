# vinterra:survival/warmth/load
# Load entry point for the survival/warmth submodule

### ===== WARMTH =====

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

# Different smoothing values for cooling vs warming (smaller value = faster)
# -> Warming takes a little longer than cooling down
scoreboard players set #cooling_smoothing vin.warmth_meta 16
scoreboard players set #warming_smoothing vin.warmth_meta 20

# Number of ticks between effective warmth interpolation steps
scoreboard players set #interpolate_interval vin.warmth_meta 5
scoreboard players set #interpolate_clock vin.warmth_meta 0

# Number constants
scoreboard players set #-1 vin.warmth_meta -1
scoreboard players set #2 vin.warmth_meta 2
scoreboard players set #3 vin.warmth_meta 3
scoreboard players set #4 vin.warmth_meta 4
scoreboard players set #8 vin.warmth_meta 8


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

scoreboard players set #found_limit vin.warmth_meta 32

# Heat value constants
scoreboard players set #heat_tier_1 vin.warmth_meta 27
scoreboard players set #heat_tier_2 vin.warmth_meta 54
scoreboard players set #heat_tier_3 vin.warmth_meta 80
scoreboard players set #heat_tier_4 vin.warmth_meta 108

# Aggregation constants
# The max number of heat sources allowed to apply to the player
# Sorted from highest to lowest
scoreboard players set #aggregate_limit vin.warmth_meta 4

## BLOCK COLD

# Block cold contribution for each player
scoreboard objectives add vin.block_cold_raw dummy
scoreboard objectives add vin.block_cold_total dummy

# Cold calculation constants
scoreboard players set #cold_scale vin.warmth_meta 16

# Special cold-source constants
scoreboard players set #snow_layer_shell_1 vin.warmth_meta 2
scoreboard players set #snow_layer_shell_2 vin.warmth_meta 1


### ===== EQUIPMENT CONTRIBUTION =====

# Each piece of equipment has the following:
# - An insulation value, which provides warmth but is reduced linearly with wetness
# - A cold value which reduces warmth
# Either value can be omitted from a piece of equipment
scoreboard objectives add vin.equip_insulation dummy
scoreboard objectives add vin.equip_cold dummy

## Default Equipment Values
scoreboard players set #leather_head vin.warmth_meta 4
scoreboard players set #leather_chest vin.warmth_meta 12
scoreboard players set #leather_legs vin.warmth_meta 8
scoreboard players set #leather_feet vin.warmth_meta 4

scoreboard players set #cold_armor_head vin.warmth_meta 1
scoreboard players set #cold_armor_chest vin.warmth_meta 3
scoreboard players set #cold_armor_legs vin.warmth_meta 2
scoreboard players set #cold_armor_feet vin.warmth_meta 1

### ===== WARMTH BANDS ======

# Current Classified Warmth Bands:
# -3: Freezing
# -2: Frigid
# -1: Cold
#  0: Warm
#  1: Hot
#  2: Scorching
#  3: Scalding

scoreboard objectives add vin.warmth_band dummy

# Inclusive lower bounds (TODO: Balance these values)
scoreboard players set #band_frigid_min vin.warmth_meta -54
scoreboard players set #band_cold_min vin.warmth_meta -27
scoreboard players set #band_warm_min vin.warmth_meta 0
scoreboard players set #band_hot_min vin.warmth_meta 27
scoreboard players set #band_scorching_min vin.warmth_meta 54
scoreboard players set #band_scalding_min vin.warmth_meta 80

# Recovery (cold -> warm) transition hysteresis
scoreboard players set #band_recovery_threshold vin.warmth_meta 5

# Derived recovery boundaries from the base boundaries
scoreboard players operation #band_frigid_recover vin.warmth_meta = #band_frigid_min vin.warmth_meta
scoreboard players operation #band_frigid_recover vin.warmth_meta += #band_recovery_threshold vin.warmth_meta

scoreboard players operation #band_cold_recover vin.warmth_meta = #band_cold_min vin.warmth_meta
scoreboard players operation #band_cold_recover vin.warmth_meta += #band_recovery_threshold vin.warmth_meta

scoreboard players operation #band_warm_recover vin.warmth_meta = #band_warm_min vin.warmth_meta
scoreboard players operation #band_warm_recover vin.warmth_meta += #band_recovery_threshold vin.warmth_meta

scoreboard players operation #band_hot_recover vin.warmth_meta = #band_hot_min vin.warmth_meta
scoreboard players operation #band_hot_recover vin.warmth_meta += #band_recovery_threshold vin.warmth_meta

scoreboard players operation #band_scorching_recover vin.warmth_meta = #band_scorching_min vin.warmth_meta
scoreboard players operation #band_scorching_recover vin.warmth_meta += #band_recovery_threshold vin.warmth_meta

scoreboard players operation #band_scalding_recover vin.warmth_meta = #band_scalding_min vin.warmth_meta
scoreboard players operation #band_scalding_recover vin.warmth_meta += #band_recovery_threshold vin.warmth_meta


### ===== COLD EXPOSURE =====

# Accumulated cold exposure
scoreboard objectives add vin.cold_exposure dummy

# Current cold exposure stage and max health penalty stage: 0-3
scoreboard objectives add vin.cold_stage dummy

# Exposure is updated independently of body-warmth interpolation
scoreboard players set #exposure_interval vin.warmth_meta 5
scoreboard players set #exposure_clock vin.warmth_meta 0

## Band equilibrium values
scoreboard players set #exposure_target_safe vin.warmth_meta 0
scoreboard players set #exposure_target_cold vin.warmth_meta 150
scoreboard players set #exposure_target_frigid vin.warmth_meta 250
scoreboard players set #exposure_target_freezing vin.warmth_meta 350

## Cold band accumulation rates
scoreboard players set #exposure_gain_cold vin.warmth_meta 1
scoreboard players set #exposure_gain_frigid vin.warmth_meta 2
scoreboard players set #exposure_gain_freezing vin.warmth_meta 4

## Recovery rates
scoreboard players set #exposure_recovery_cold vin.warmth_meta 1
scoreboard players set #exposure_recovery_warm vin.warmth_meta 1
scoreboard players set #exposure_recovery_hot vin.warmth_meta 2
scoreboard players set #exposure_recovery_scorching vin.warmth_meta 4
scoreboard players set #exposure_recovery_scalding vin.warmth_meta 8

## Stage boundaries
scoreboard players set #exposure_stage_1_min vin.warmth_meta 100
scoreboard players set #exposure_stage_2_min vin.warmth_meta 200
scoreboard players set #exposure_stage_3_min vin.warmth_meta 300


### ===== MISC PLAYER ATTRIBUTES =====

scoreboard objectives add vin.over_edge dummy