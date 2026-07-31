# vinterra:survival/warmth/ambient/wetness/apply
# Amplifies negative environmental ambient warmth according to Wetness
# Must be executed as the player

# Positive or neutral ambient conditions are unaffected
execute unless score @s vin.warmth_ambient matches ..-1 run return 0

# Ambient Warmth = Base Ambient Warmth * (1 + Wetness / 3200) (100% to 150%)

# Convert the negative ambient value into a positive cold magnitude for consistent division behavior
scoreboard players operation @s vin.warmth_tmp = @s vin.warmth_ambient
scoreboard players operation @s vin.warmth_tmp *= #-1 vin.warmth_meta

# Calculate additional cold caused by Wetness
scoreboard players operation @s vin.warmth_tmp *= @s vin.wetness
scoreboard players operation @s vin.warmth_tmp /= #wetness_cold_scale vin.comfort_meta

# Increase the negative ambient magnitude
scoreboard players operation @s vin.warmth_ambient -= @s vin.warmth_tmp

return 1