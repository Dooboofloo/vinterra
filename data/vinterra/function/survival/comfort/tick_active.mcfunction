# vinterra:survival/comfort/tick_active
# Active tick entry point the for survival/comfort submodule
# Active tick functions (including this one) are only run if there is at least one player online

execute as @a[tag=vin.player_initialized,predicate=!vinterra:player/currently_dead] at @s run function vinterra:survival/comfort/wetness/update
