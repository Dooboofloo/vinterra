# vinterra:survival/comfort/wetness/update
# Must be executed as and at the player

# TODO: Eventually, this will be owned by player/initialize
execute unless score @s vin.wetness matches -2147483648..2147483647 run scoreboard players set @s vin.wetness 0

# If immersed in water, become wet quickly
execute if predicate vinterra:wetness/in_water run return run function vinterra:survival/comfort/wetness/in_wet_block

# Else if exposed to rain, get wet slower
execute if predicate vinterra:wetness/exposed_to_precipitation run return run function vinterra:survival/comfort/wetness/in_precipitation

# Else slowly become dryer passively
execute if score @s vin.wetness matches 1.. run return run function vinterra:survival/comfort/wetness/become_dryer

return 0