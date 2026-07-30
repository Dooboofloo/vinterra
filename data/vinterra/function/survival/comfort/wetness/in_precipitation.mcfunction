# vinterra:survival/comfort/wetness/in_precipitation
# Slowly add wetness from getting rained on

# TODO: Differentiate between rain, normal snowfall, and blizzards.
# They should add the following:
# - If the player is in rain, add 2/tick (#wetness_rain_gain)
# - If the player is in snow and it is not blizzarding, add none
# - If the player is in snow and it is blizzarding, add 1/tick (#wetness_blizzard_gain)

# To determine whether it is visually rain or snow, we will have to check the biome the player is in
# and their Y level. Unfortunately, without the ability to sample minecraft's world generation
# noisemaps, we can't do this exactly.

# For now, just assume all precipitation is rain when it's not blizzarding.
# This has the side effect of visual rain applying less wetness while blizzarding,
# so keep this in mind while testing.

# RAIN: Each tick add 2 wetness (max wetness after 800 ticks = 40s)
execute if function vinterra:world/weather/api/is_snowfall run scoreboard players operation @s vin.comfort_tmp = #wetness_rain_gain vin.comfort_meta

# BLIZZARD: Each tick add 1 wetness (max wetness after 1600 ticks = 80s)
# is_blizzard should always return true if we've made it this far, but check for safety
execute if function vinterra:world/weather/api/is_blizzard run scoreboard players operation @s vin.comfort_tmp = #wetness_blizzard_gain vin.comfort_meta

# Apply wetness gain and clamp to max (1600)
scoreboard players operation @s vin.wetness += @s vin.comfort_tmp
execute if score @s vin.wetness > #wetness_max vin.comfort_meta run scoreboard players operation @s vin.wetness = #wetness_max vin.comfort_meta