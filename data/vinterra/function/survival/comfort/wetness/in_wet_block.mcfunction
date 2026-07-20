# vinterra:survival/comfort/wetness/become_wet
# Manages players who are currently becoming wet

# Each tick add 16 wetness, clamped to 1600 (max wetness after 100 ticks = 5s)
scoreboard players operation @s vin.wetness += #wetness_water_gain vin.comfort_meta
execute if score @s vin.wetness > #wetness_max vin.comfort_meta run scoreboard players operation @s vin.wetness = #wetness_max vin.comfort_meta