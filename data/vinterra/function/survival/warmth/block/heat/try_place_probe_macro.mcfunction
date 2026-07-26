# vinterra:survival/warmth/block/heat/try_place_probe_macro
# Macro function taking in {tags:[...]}
# Places a marker entity at the executed position with the passed in tags

$execute align xyz positioned ~0.5 ~0.5 ~0.5 run summon marker ~ ~ ~ {Tags:$(tags)}

# Classify
execute align xyz positioned ~0.5 ~0.5 ~0.5 as @e[type=marker,tag=vin.heat_probe,distance=..0.1,sort=nearest,limit=1] at @s run function vinterra:survival/warmth/block/heat/classify/begin

# Discard the probe if it contributes no heat_val
execute align xyz positioned ~0.5 ~0.5 ~0.5 as @e[type=marker,tag=vin.heat_probe,distance=..0.1,sort=nearest,limit=1] if score @s vin.heat_val matches ..0 run return run kill @s

# If we made it this far, we found a real candidate, so increment the score.
scoreboard players add #found vin.warmth_tmp 1