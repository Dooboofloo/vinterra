# vinterra:survival/comfort/recalc
# Recalculates cached comfort conditions for one player
# Must be executed as and at the player

function vinterra:survival/comfort/coverage/recalc
function vinterra:survival/comfort/shelter/recalc

function vinterra:survival/comfort/cozy_blocks/recalc
function vinterra:survival/comfort/equipment/recalc

# Preserve manually assigned final Comfort while retaining component measurements
execute if entity @s[tag=vin.test_lock_comfort] run return 0

function vinterra:survival/comfort/finalize

return 1