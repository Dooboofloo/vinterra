# vinterra:survival/warmth/block/heat/discover
# Discovers nearby landmark heat sources by coarse 3-shell scan, with early stopping

function vinterra:survival/warmth/block/heat/clear_probes

function vinterra:survival/warmth/block/heat/discover_generated/shell_1
execute if score #found vin.heat_tmp matches 8.. run return 1

function vinterra:survival/warmth/block/heat/discover_generated/shell_2
execute if score #found vin.heat_tmp matches 16.. run return 1

function vinterra:survival/warmth/block/heat/discover_generated/shell_3
return 1