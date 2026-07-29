# vinterra:survival/comfort/load
# Load entry point for the survival/comfort submodule

### ===== GENERIC COMFORT =====
scoreboard objectives add vin.comfort_meta dummy
scoreboard objectives add vin.comfort_tmp dummy

### ===== COVERAGE =====

# Whether precipitation is vertically blocked above the player
# Stored as the per-player tag vin.player_covered

### ===== SHELTER =====

# Whether the player is beneath a locally contained overhead ceiling basin
# Stored as the per-player tag vin.player_sheltered

# Horizontal BFS distance stored on temporary shelter nodes
scoreboard objectives add vin.shelter_depth dummy

# Maximum number of blocks searched upward for a ceiling
scoreboard players set #shelter_ceiling_limit vin.comfort_meta 24

# Maximum horizontal graph distance from the initial ceiling node
scoreboard players set #shelter_radius vin.comfort_meta 3

# Hard limit on temporary shelter nodes
scoreboard players set #shelter_node_limit vin.comfort_meta 64

### ===== WETNESS =====

# A player's total wetness ([0, #wetness_max])
scoreboard objectives add vin.wetness dummy

# Wetness Constants
scoreboard players set #wetness_water_gain vin.comfort_meta 50
scoreboard players set #wetness_rain_gain vin.comfort_meta 2
scoreboard players set #wetness_max vin.comfort_meta 1600

scoreboard players set #wetness_dry_loss vin.comfort_meta 1
scoreboard players set #drying_scale vin.comfort_meta 25