# vinterra:survival/warmth/target/recalc
# Combines each warmth category into a single target value

# TODO: Implement other flat bonuses here (progression unlocks, etc.)

# Start at ambient temperature (dependent on biome, weather, etc. Will more than likely be negative)
scoreboard players operation @s vin.warmth_target = @s vin.warmth_ambient

# Add local block conditions
scoreboard players operation @s vin.warmth_target += @s vin.warmth_block

# Add worn equipment
scoreboard players operation @s vin.warmth_target += @s vin.warmth_equipment