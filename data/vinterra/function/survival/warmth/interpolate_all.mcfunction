# vinterra:survival/warmth/interpolate_all
# Advances effective warmth and updates warmth bands for all living players

scoreboard players set #interpolate_clock vin.warmth_meta 0

execute as @a[tag=vin.player_initialized,predicate=!vinterra:player/currently_dead] run function vinterra:survival/warmth/interpolate

execute as @a[tag=vin.player_initialized,predicate=!vinterra:player/currently_dead] run function vinterra:survival/warmth/band/update

execute as @a[tag=vin.player_initialized,predicate=!vinterra:player/currently_dead] run function vinterra:survival/warmth/cold_exposure/update

# execute as @a[tag=vin.debug_viewer] run tellraw @s [{text:"[Interpolate All] Band: "},{score:{name:"@s", objective:"vin.warmth_band"}},{text:"\n               Exposure: "},{score:{name:"@s", objective:"vin.cold_exposure"}},{text:"\n                    Stage: "},{score:{name:"@s", objective:"vin.cold_stage"}}]