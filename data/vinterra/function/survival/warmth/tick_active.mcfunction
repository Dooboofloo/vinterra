# vinterra:survival/warmth/tick_active
# Active tick entry point the for survival/warmth submodule
# Active tick functions (including this one) are only run if there is at least one player online

# This function is ONLY for fast, continuous recalculations of warmth.
# See survival/scheduler for periodic expensive calculation handling

## Classify the column beneath each grounded player

execute as @a[predicate=!vinterra:player/currently_dead] at @s if predicate vinterra:player/on_ground run scoreboard players set @s vin.over_edge 0
# Center is over an edge, but there is support one block farther down
execute as @a[predicate=!vinterra:player/currently_dead] at @s if predicate vinterra:player/on_ground positioned ~ ~0.125 ~ align y if block ~ ~-1 ~ #vinterra:heat_raycast_passable run scoreboard players set @s vin.over_edge 1
# Center is hanging over open air
execute as @a[predicate=!vinterra:player/currently_dead] at @s if predicate vinterra:player/on_ground positioned ~ ~0.125 ~ align y if block ~ ~-1 ~ #vinterra:heat_raycast_passable if block ~ ~-2 ~ #vinterra:heat_raycast_passable run scoreboard players set @s vin.over_edge 2


## Advance effective warmth and warmth bands periodically
scoreboard players add #interpolate_clock vin.warmth_meta 1
execute if score #interpolate_clock vin.warmth_meta >= #interpolate_interval vin.warmth_meta run function vinterra:survival/warmth/interpolate_all

## Advance cold exposure independently
scoreboard players add #exposure_clock vin.warmth_meta 1
execute if score #exposure_clock vin.warmth_meta >= #exposure_interval vin.warmth_meta run function vinterra:survival/warmth/cold_exposure/update_all

## Check players for freezing damage
execute as @a[tag=vin.player_initialized,predicate=!vinterra:player/currently_dead] run function vinterra:survival/warmth/cold_exposure/damage/tick