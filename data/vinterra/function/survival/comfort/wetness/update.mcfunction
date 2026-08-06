# vinterra:survival/comfort/wetness/update
# Must be executed as and at the player

# Debug lock
execute if entity @s[tag=vin.test_lock_wetness] run return 0

# If immersed in water, become wet quickly (regardless of dimension or biome)
execute if predicate vinterra:player/in_water run return run function vinterra:survival/comfort/wetness/in_wet_block

# Ordinary snowfall does not add Wetness
# Direct blizzard exposure slowly wets clothing
execute if dimension minecraft:overworld if predicate vinterra:location/precipitating_biome unless entity @s[tag=vin.player_covered] if function vinterra:world/weather/api/is_blizzard run return run function vinterra:survival/comfort/wetness/in_blizzard

# TODO: When custom biomes are implemented, add dry ones (Permafrost Wastes, Prismatic Springs) to the biome/dry tag
# In the future, I may decide that I want Prismatic Springs to have rain, in which case I would add back in the 2/tick rain
# wetness gain and detect that biome (and possibly others) through tags (biome/rains?) as well. We retain "vinterra:world/weather/is_precipitating" for this reason

# Else slowly become dryer passively
execute if score @s vin.wetness matches 1.. run return run function vinterra:survival/comfort/wetness/become_dryer

return 0