# vinterra:survival/warmth/equipment/apply_wetness
# Applies wetness debuff to raw equipment warmth value

# Wetness decreases the effectiveness of equipment warmth linearly


# Calculate remaining insulation from 0–1600
scoreboard players operation @s vin.warmth_tmp = #wetness_max vin.comfort_meta
scoreboard players operation @s vin.warmth_tmp -= @s vin.wetness

# Clamp defensively
execute if score @s vin.warmth_tmp matches ..-1 run scoreboard players set @s vin.warmth_tmp 0

# Apply retained insulation
scoreboard players operation @s vin.warmth_equipment *= @s vin.warmth_tmp
scoreboard players operation @s vin.warmth_equipment /= #wetness_max vin.comfort_meta