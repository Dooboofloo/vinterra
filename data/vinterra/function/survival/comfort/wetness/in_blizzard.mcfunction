# vinterra:survival/comfort/wetness/in_blizzard
# Slowly add wetness from getting rained on

# There is no rain in a Vinterra world. Each biome either has snowfall or no precipitation.

# Add 1 wetness/tick (max wetness after 1600 ticks = 80s) then clamp
scoreboard players operation @s vin.wetness += #wetness_blizzard_gain vin.comfort_meta
execute if score @s vin.wetness > #wetness_max vin.comfort_meta run scoreboard players operation @s vin.wetness = #wetness_max vin.comfort_meta

return 1