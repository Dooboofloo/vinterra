# vinterra:survival/comfort/load
# Load entry point for the survival/comfort submodule

### ===== GENERIC COMFORT =====
scoreboard objectives add vin.comfort_meta dummy
scoreboard objectives add vin.comfort_tmp dummy

### ===== SHELTER =====

# Per-player shelter info is a tag (vin.player_sheltered)

### ===== WETNESS =====

# A player's total wetness ([0, #wetness_max])
scoreboard objectives add vin.wetness dummy

# Wetness Constants
scoreboard players set #wetness_water_gain vin.comfort_meta 50
scoreboard players set #wetness_rain_gain vin.comfort_meta 2
scoreboard players set #wetness_max vin.comfort_meta 1600

scoreboard players set #wetness_dry_loss vin.comfort_meta 1
scoreboard players set #drying_scale vin.comfort_meta 25