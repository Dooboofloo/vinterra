# vinterra:survival/warmth/ambient/shelter/apply
# Scales environmental ambient warmth according to player-local shelter
# Must be executed as the player
#
# No shelter retains 100% of outside ambient conditions.
# Max shelter retains 0% of outside ambient conditions.

# Shelter provides nonlinear environmental isolation:
# Final Ambient = Raw Ambient × (1 - Shelter^2 / Max Shelter^2)

# Calculate the portion of raw ambient warmth blocked by shelter
scoreboard players operation @s vin.warmth_tmp = @s vin.warmth_ambient
scoreboard players operation @s vin.warmth_tmp *= @s vin.shelter
scoreboard players operation @s vin.warmth_tmp *= @s vin.shelter
scoreboard players operation @s vin.warmth_tmp /= #shelter_max vin.comfort_meta
scoreboard players operation @s vin.warmth_tmp /= #shelter_max vin.comfort_meta

# Remove the blocked portion from the raw ambient contribution
scoreboard players operation @s vin.warmth_ambient -= @s vin.warmth_tmp

return 1