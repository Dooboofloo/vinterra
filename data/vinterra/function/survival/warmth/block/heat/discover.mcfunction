# vinterra:survival/warmth/block/heat/discover
# Discovers nearby landmark heat sources by coarse 3-shell scan, with early stopping

function vinterra:survival/warmth/block/heat/clear_probes

# TODO: Consider when we ACTUALLY want to exit this function.
# If we enforced the global #found_limit within every shell (like we do in 3), there would be no reason to separate the shells in the first place
# Do we want to go back to per-shell found limits?

function vinterra:survival/warmth/block/heat/discover_generated/shell_1
execute if score #found vin.warmth_tmp >= #found_limit vin.warmth_meta run return 1

function vinterra:survival/warmth/block/heat/discover_generated/shell_2
execute if score #found vin.warmth_tmp >= #found_limit vin.warmth_meta run return 1

# NOTE: Once we make it to shell 3, we can not find more that #found_limit landmarks
# So early exits actually occur here
function vinterra:survival/warmth/block/heat/discover_generated/shell_3

return 1