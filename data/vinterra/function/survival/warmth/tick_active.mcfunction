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


## Interpolate Warmth
# Though each player's expensive calculations are done periodically,
# their effective warmth is always being interpolated toward their target warmth

execute as @a[tag=vin.player_initialized,predicate=!vinterra:player/currently_dead] run function vinterra:survival/warmth/interpolate

## Determine Warmth Bands
execute as @a[tag=vin.player_initialized,predicate=!vinterra:player/currently_dead] run function vinterra:survival/warmth/band/update


### True debug output
execute as @a[tag=vin.debug_viewer] run title @s actionbar [{text:"Effective Warmth: "},{score:{name:"@s",objective:"vin.warmth_effective"}}, {text:" (Target Warmth: "},{score:{name:"@s",objective:"vin.warmth_target"}}, {text:")"}]