# vinterra:survival/warmth/cold_exposure/update_all
# Updates cold exposure for every initialized living player

scoreboard players set #exposure_clock vin.warmth_meta 0

execute as @a[tag=vin.player_initialized,predicate=!vinterra:player/currently_dead] run function vinterra:survival/warmth/cold_exposure/update