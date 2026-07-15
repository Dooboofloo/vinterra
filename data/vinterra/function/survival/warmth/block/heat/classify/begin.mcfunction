# vinterra:survival/warmth/block/heat/classify/begin
# Assigns exact heat values to visible landmark probes

scoreboard players set @e[type=marker,tag=vin.heat_probe] vin.heat_val 0

execute as @e[type=marker,tag=vin.heat_probe,tag=vin.heat_probe_visible] at @s run function vinterra:survival/warmth/block/heat/classify/static