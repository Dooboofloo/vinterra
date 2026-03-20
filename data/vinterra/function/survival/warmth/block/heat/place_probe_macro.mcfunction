# vinterra:survival/warmth/block/heat/place_probe_macro
# Macro function taking in {tags:[...]}
# Places a marker entity at the executed position with the passed in tags

# TODO: Higher quality heat landmarks contribute more to #found OR keep track of a seperate value

$summon marker ~ ~ ~ {Tags:$(tags)}
scoreboard players add #found vin.heat_tmp 1