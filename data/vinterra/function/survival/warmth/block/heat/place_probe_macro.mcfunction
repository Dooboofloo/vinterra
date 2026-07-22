# vinterra:survival/warmth/block/heat/place_probe_macro
# Macro function taking in {tags:[...]}
# Places a marker entity at the executed position with the passed in tags

$execute align xyz positioned ~0.5 ~0.5 ~0.5 run summon marker ~ ~ ~ {Tags:$(tags)}
scoreboard players add #found vin.warmth_tmp 1