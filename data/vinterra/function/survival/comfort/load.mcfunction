# vinterra:survival/comfort/load
# Load entry point for the survival/comfort submodule

### ===== GENERIC COMFORT =====
scoreboard objectives add vin.comfort_meta dummy

### ===== WETNESS =====

scoreboard objectives add vin.wetness dummy

# Wetness Constants
scoreboard players set #wetness_water_gain vin.comfort_meta 16
scoreboard players set #wetness_rain_gain vin.comfort_meta 1
scoreboard players set #wetness_dry_loss vin.comfort_meta 1
scoreboard players set #wetness_max vin.comfort_meta 1600