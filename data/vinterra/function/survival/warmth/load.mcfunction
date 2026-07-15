# vinterra:survival/warmth/load
# Load entry point for the survival/warmth submodule

# Scoreboard objectives for survival/warmth/block/heat
scoreboard objectives add vin.heat_tmp dummy
scoreboard objectives add vin.heat_val dummy
scoreboard objectives add vin.heat_meta dummy

execute unless score #found vin.heat_tmp matches -2147483648..2147483647 run scoreboard players set #found vin.heat_tmp 0

# Heat raycast constants
scoreboard players set #raycast_limit vin.heat_meta 16
scoreboard players set #ray_step_limit vin.heat_meta 80

# Heat value constants
scoreboard players set #heat_tier_1 vin.heat_meta 2
scoreboard players set #heat_tier_2 vin.heat_meta 24
scoreboard players set #heat_tier_3 vin.heat_meta 72
scoreboard players set #heat_tier_4 vin.heat_meta 108