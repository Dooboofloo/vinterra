# vinterra:survival/warmth/band/update
# Update player's warmth band with asymmetric hysteresis
# Must be executed as a player

# Handle uninitialized players
execute unless score @s vin.warmth_band matches -3..3 run return run function vinterra:survival/warmth/band/initialize

# Determine the band without hysteresis
function vinterra:survival/warmth/band/classify

# No transition
execute if score @s vin.warmth_band = @s vin.warmth_tmp run return 0

## Becoming colder uses exact boundary
execute if score @s vin.warmth_band > @s vin.warmth_tmp run return run function vinterra:survival/warmth/band/change

## Getting warmer uses the recovery boundaries
function vinterra:survival/warmth/band/classify_recover

# The required recovery boundary has not been reached
execute unless score @s vin.warmth_band < @s vin.warmth_tmp run return 0

# Transition upward
return run function vinterra:survival/warmth/band/change