# vinterra:survival/warmth/equipment/apply_wetness
# Reduces equipment insulation according to player Wetness
# Equipment cold is applied separately and is not reduced

# Calculate remaining insulation from 0–1600
scoreboard players operation @s vin.warmth_tmp = #wetness_max vin.comfort_meta
scoreboard players operation @s vin.warmth_tmp -= @s vin.wetness

# Clamp defensively
execute if score @s vin.warmth_tmp matches ..-1 run scoreboard players set @s vin.warmth_tmp 0

# Apply retained insulation
scoreboard players operation @s vin.equip_insulation *= @s vin.warmth_tmp
scoreboard players operation @s vin.equip_insulation /= #wetness_max vin.comfort_meta