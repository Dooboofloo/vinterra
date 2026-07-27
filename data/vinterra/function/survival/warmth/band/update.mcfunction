# vinterra:survival/warmth/band/update

# Handles new players, existing-world migration, and respawns
execute unless score @s vin.warmth_band matches -3..3 run return run function vinterra:survival/warmth/band/initialize

# Classify
function vinterra:survival/warmth/band/classify

# No transition
execute if score @s vin.warmth_band = @s vin.warmth_tmp run return 0

# Transition
return run function vinterra:survival/warmth/band/change