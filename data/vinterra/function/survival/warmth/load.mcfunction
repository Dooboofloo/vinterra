# vinterra:survival/warmth/load
# Load entry point for the survival/warmth submodule

### ===== FINAL BLOCK CONTRIBUTION =====

scoreboard objectives add vin.warmth_block_contribution dummy

### ===== BLOCK HEAT =====

# Scoreboard objectives for survival/warmth/block/heat
scoreboard objectives add vin.heat_tmp dummy
scoreboard objectives add vin.heat_val dummy
scoreboard objectives add vin.heat_meta dummy

# Final block heat contribution for each player
scoreboard objectives add vin.block_heat_total dummy

# Scoreboard tracking the number of found heat landmarks
execute unless score #found vin.heat_tmp matches -2147483648..2147483647 run scoreboard players set #found vin.heat_tmp 0

# Heat raycast constants
scoreboard players set #raycast_limit vin.heat_meta 16
scoreboard players set #ray_step_limit vin.heat_meta 80

# Heat value constants
scoreboard players set #heat_tier_1 vin.heat_meta 2
scoreboard players set #heat_tier_2 vin.heat_meta 24
scoreboard players set #heat_tier_3 vin.heat_meta 72
scoreboard players set #heat_tier_4 vin.heat_meta 108

# Aggregation constants
scoreboard players set #aggregate_limit vin.heat_meta 4
scoreboard players set #2 vin.heat_meta 2
scoreboard players set #4 vin.heat_meta 4
scoreboard players set #8 vin.heat_meta 8


### ===== BLOCK COLD =====

# Scoreboard objectives for survival/warmth/block/cold
scoreboard objectives add vin.cold_meta dummy

# Block cold contribution for each player
scoreboard objectives add vin.block_cold_raw dummy
scoreboard objectives add vin.block_cold_total dummy

# Cold calculation constants
scoreboard players set #cold_scale vin.cold_meta 8

# Special cold-source constants
scoreboard players set #snow_layer_shell_1 vin.cold_meta 2
scoreboard players set #snow_layer_shell_2 vin.cold_meta 1
scoreboard players set #snow_layer_shell_3 vin.cold_meta 0