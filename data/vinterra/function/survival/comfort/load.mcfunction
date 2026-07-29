# vinterra:survival/comfort/load
# Load entry point for the survival/comfort submodule

### ===== GENERIC COMFORT =====
scoreboard objectives add vin.comfort_meta dummy
scoreboard objectives add vin.comfort_tmp dummy

### ===== COVERAGE =====

# Whether precipitation is vertically blocked above the player
# Stored as the per-player tag vin.player_covered

### ===== SHELTER =====

# Player local environmental isolation provided by surrounding structure
# Range: 0 (fully exposed) to 100 (fully sheltered)
scoreboard objectives add vin.shelter dummy

# Maximum shelter value
scoreboard players set #shelter_max vin.comfort_meta 100

# Maximum number of connected passable cells that may form a sheltered volume
scoreboard players set #shelter_volume_limit vin.comfort_meta 128

# TODO: Currently, the shelter system is essentially binary (either 0 OR 100).
# In the future, it will be more continuous

### ===== WETNESS =====

# A player's total wetness ([0, #wetness_max])
scoreboard objectives add vin.wetness dummy

# Wetness Constants
scoreboard players set #wetness_water_gain vin.comfort_meta 50
scoreboard players set #wetness_rain_gain vin.comfort_meta 2
scoreboard players set #wetness_max vin.comfort_meta 1600

scoreboard players set #wetness_dry_loss vin.comfort_meta 1
scoreboard players set #drying_scale vin.comfort_meta 25


### ===== DEBUG =====
scoreboard objectives add vin.debug_covered dummy