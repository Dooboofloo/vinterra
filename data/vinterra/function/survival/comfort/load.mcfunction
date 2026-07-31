# vinterra:survival/comfort/load
# Load entry point for the survival/comfort submodule

### ===== COMFORT =====

# Final Comfort
scoreboard objectives add vin.comfort dummy

scoreboard objectives add vin.comfort_meta dummy
scoreboard objectives add vin.comfort_tmp dummy

# Final Comfort is stored as whole points from 0 to 16
scoreboard players set #comfort_max vin.comfort_meta 16

# Raw Comfort sources are accumulated as quarter-points
scoreboard players set #comfort_scale vin.comfort_meta 4

# Comfort contribution categories
scoreboard objectives add vin.comfort_blocks dummy
scoreboard objectives add vin.comfort_equipment dummy

## Block Comfort Category Contributions and Maximums (in quarter-points)
scoreboard players set #campfire_comfort vin.comfort_meta 8
scoreboard players set #campfire_max vin.comfort_meta 16

scoreboard players set #bedding_comfort vin.comfort_meta 4
scoreboard players set #bedding_max vin.comfort_meta 8

scoreboard players set #softness_comfort vin.comfort_meta 1
scoreboard players set #softness_max vin.comfort_meta 8

scoreboard players set #decoration_comfort vin.comfort_meta 1
scoreboard players set #decoration_max vin.comfort_meta 8

scoreboard players set #banner_comfort vin.comfort_meta 2
scoreboard players set #banner_max vin.comfort_meta 8

### ===== COVERAGE =====

# Whether precipitation is vertically blocked above the player
# Stored as the per-player tag vin.player_covered

### ===== SHELTER =====

# Player environmental isolation provided by surrounding structure
# Range: 0 (fully exposed) to #shelter_max (fully sheltered)
scoreboard objectives add vin.shelter dummy

# Active raycast shelter scale (sum of all possible weighted rays)
scoreboard players set #shelter_max vin.comfort_meta 1024

# Raycast distance: 16 half-block steps = 8 blocks
scoreboard players set #shelter_ray_step_limit vin.comfort_meta 16

# Ray transmission scale
# Currently binary: 16 for fully transmissive or 0 for blocked
# Future block state detectors may apply intermediate values
scoreboard players set #shelter_transmission_max vin.comfort_meta 16

### ===== WETNESS =====

# A player's total wetness ([0, #wetness_max])
scoreboard objectives add vin.wetness dummy

# Wetness Constants
scoreboard players set #wetness_water_gain vin.comfort_meta 50
scoreboard players set #wetness_rain_gain vin.comfort_meta 2
scoreboard players set #wetness_blizzard_gain vin.comfort_meta 1
scoreboard players set #wetness_max vin.comfort_meta 1600

# The additional amount by which ambient and block cold are increased when wet.
# 1600 / 3200 = 0.5 -> 50% increased cold gained from ambience and blocks while at max wetness
scoreboard players set #wetness_cold_scale vin.comfort_meta 3200

scoreboard players set #wetness_dry_loss vin.comfort_meta 1
scoreboard players set #drying_scale vin.comfort_meta 25