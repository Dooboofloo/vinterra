# vinterra:survival/warmth/block/heat/recalc
# Calculates landmark heat visibility for the executing player
# Must be executed as and at the player

# Thermal raycasts intentionally allow corner-grazing paths
# This approximates heat transfer through imperfect structural seams and keeps
# environmental exposure and block heat behavior consistent.
# Just add corner blocks to your bases if you're worried about it!

# Discover nearby candidate heat landmarks, discarding probes with no heat value
function vinterra:survival/warmth/block/heat/discover

# Raycast to the found heat landmarks
function vinterra:survival/warmth/block/heat/raycast/begin

# Aggregate heat sources across all found and visible landmarks
function vinterra:survival/warmth/block/heat/aggregate/begin

# Probes are no longer needed
function vinterra:survival/warmth/block/heat/clear_probes