# vinterra:survival/warmth/block/heat/clear_probes
# Clears landmark heat source discovery probes

kill @e[type=marker,tag=vin.heat_probe]
scoreboard players set #found vin.warmth_tmp 0