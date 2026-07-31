# vinterra:survival/warmth/block/heat/discover
# Discovers nearby landmark heat sources by coarse 3-shell scan, with early stopping

function vinterra:survival/warmth/block/heat/clear_probes

# NOTE: The number of landmarks found can exceed #found_limit in shells 1 and 2, but not in 3

function vinterra:survival/warmth/block/heat/discover_generated/shell_1
execute if score #found vin.warmth_tmp >= #found_limit vin.warmth_meta run return 1

function vinterra:survival/warmth/block/heat/discover_generated/shell_2
execute if score #found vin.warmth_tmp >= #found_limit vin.warmth_meta run return 1

# NOTE: Once we make it to shell 3, we can not find more that #found_limit landmarks
# So early exits actually occur here
function vinterra:survival/warmth/block/heat/discover_generated/shell_3

return 1