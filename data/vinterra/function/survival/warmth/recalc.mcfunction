# vinterra:survival/warmth/recalc
# Recalculates the selected player's target warmth
# Must be executed as and at that player

# This function is for performing periodic expensive calculations
# See survival/warmth/tick_active for continuous cheap calculations

# TODO: Determine actual order of recalculations, where they should occur (here or tick_active),
# and whether the order actually matters

function vinterra:survival/warmth/block/recalc
function vinterra:survival/warmth/equipment/recalc
function vinterra:survival/warmth/ambient/recalc

function vinterra:survival/warmth/target/recalc