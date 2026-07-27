# vinterra:survival/warmth/band/initialize
# Initializes the player's band from their current effective warmth

function vinterra:survival/warmth/band/classify
scoreboard players operation @s vin.warmth_band = @s vin.warmth_tmp

# Maximum-health application will eventually occur here