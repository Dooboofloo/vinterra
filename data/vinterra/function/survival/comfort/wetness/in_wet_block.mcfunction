# vinterra:survival/comfort/wetness/in_wet_block
# Manages players who are currently becoming wet

# Each tick add 50 wetness, clamped to 1600 (max wetness after 32 ticks = 1.6s)
scoreboard players operation @s vin.wetness += #wetness_water_gain vin.comfort_meta
execute if score @s vin.wetness > #wetness_max vin.comfort_meta run scoreboard players operation @s vin.wetness = #wetness_max vin.comfort_meta