# vinterra:survival/comfort/wetness/in_precipitation
# Slowly add wetness from getting rained on

# Each tick add 2 wetness, clamped to 1600 (max wetness after 800 ticks = 40s)
scoreboard players operation @s vin.wetness += #wetness_rain_gain vin.comfort_meta
execute if score @s vin.wetness > #wetness_max vin.comfort_meta run scoreboard players operation @s vin.wetness = #wetness_max vin.comfort_meta

# TODO: Differentiate between rain and snow. Snow shouldn't contribute much (if any) wetness unless it's a blizzard