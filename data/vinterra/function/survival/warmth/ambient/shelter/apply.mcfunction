# vinterra:survival/warmth/ambient/shelter/apply
# Scales environmental ambient warmth according to player-local shelter
# Must be executed as the player
#
# No shelter retains 100% of outside ambient conditions.
# Max shelter retains 0% of outside ambient conditions.

# Calculate the percentage of exterior conditions that still reaches the player
scoreboard players operation @s vin.warmth_tmp = #shelter_max vin.comfort_meta
scoreboard players operation @s vin.warmth_tmp -= @s vin.shelter

# Scale the complete ambient contribution once to minimize rounding loss
scoreboard players operation @s vin.warmth_ambient *= @s vin.warmth_tmp
scoreboard players operation @s vin.warmth_ambient /= #shelter_max vin.comfort_meta

return 1