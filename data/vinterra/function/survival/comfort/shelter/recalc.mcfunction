# vinterra:survival/comfort/shelter/recalc

# Default is unsheltered
tag @s remove vin.player_sheltered

# If exposed to sky, can't be sheltered
execute if predicate vinterra:player/exposed_to_sky run return 0

# TODO: Ceiling floodfill

# The player is sheltered
tag @s add vin.player_sheltered