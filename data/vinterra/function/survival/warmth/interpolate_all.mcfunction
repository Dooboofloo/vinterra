# vinterra:survival/warmth/interpolate_all
# Advances effective warmth and updates warmth bands for all living players

scoreboard players set #interpolate_clock vin.warmth_meta 0

execute as @a[tag=vin.player_initialized,predicate=!vinterra:player/currently_dead] run function vinterra:survival/warmth/interpolate

execute as @a[tag=vin.player_initialized,predicate=!vinterra:player/currently_dead] run function vinterra:survival/warmth/band/update