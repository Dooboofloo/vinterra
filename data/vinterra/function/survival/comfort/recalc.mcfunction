# vinterra:survival/comfort/recalc
# Recalculates cached comfort conditions for one player
# Must be executed as and at the player

function vinterra:survival/comfort/coverage/recalc
function vinterra:survival/comfort/shelter/recalc

# TODO: Reduce total comfort by wetness (maximum 50% reduction)
# Should it also be scaled by coverage/shelter?

return 1