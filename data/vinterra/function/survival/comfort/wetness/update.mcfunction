# vinterra:survival/comfort/wetness/update
# Must be executed as and at the player

# If immersed in water, become wet quickly (regardless of dimension)
execute if predicate vinterra:player/in_water run return run function vinterra:survival/comfort/wetness/in_wet_block

# Ordinary snowfall does not add Wetness
# Direct blizzard exposure slowly wets clothing
execute if dimension minecraft:overworld unless entity @s[tag=vin.player_covered] if function vinterra:world/weather/api/is_blizzard run return run function vinterra:survival/comfort/wetness/in_blizzard

# Else slowly become dryer passively
execute if score @s vin.wetness matches 1.. run return run function vinterra:survival/comfort/wetness/become_dryer

return 0