# vinterra:survival/warmth/band/change
# Applies a warmth-band transition
# vin.warmth_tmp contains the new band
# Must be executed as the player

# Produce feedback while both old and new values are available
execute if score @s vin.warmth_band > @s vin.warmth_tmp run function vinterra:feedback/event/warmth/band/colder
execute if score @s vin.warmth_band < @s vin.warmth_tmp run function vinterra:feedback/event/warmth/band/warmer

scoreboard players operation @s vin.warmth_band = @s vin.warmth_tmp

return 1