# vinterra:survival/comfort/load
# Load entry point for the survival/comfort submodule

### ===== GENERIC COMFORT =====
scoreboard objectives add vin.comfort_meta dummy
scoreboard objectives add vin.comfort_tmp dummy

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

scoreboard players set #wetness_dry_loss vin.comfort_meta 1
scoreboard players set #drying_scale vin.comfort_meta 25