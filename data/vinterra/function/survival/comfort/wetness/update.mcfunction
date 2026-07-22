# vinterra:survival/comfort/wetness/update

# If immersed in water, become wet quickly
execute if predicate vinterra:wetness/in_water run return run function vinterra:survival/comfort/wetness/in_wet_block

# Else if exposed to rain, get wet slower
execute if predicate vinterra:wetness/exposed_to_precipitation run return run function vinterra:survival/comfort/wetness/in_precipitation

# Else slowly become dryer passively
execute if score @s vin.wetness matches 1.. run return run function vinterra:survival/comfort/wetness/become_dryer

return 0