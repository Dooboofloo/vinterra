# vinterra:survival/warmth/recalc
# Recalculates the selected player's target warmth
# Must be executed as and at that player

# This function is for performing periodic expensive calculations
# See survival/warmth/tick_active for continuous cheap calculations

# Even though some of these functions are not that expensive, we still
# only calculate them periodically for project simplicity.

# This function is run no more than once each tick. Each player typically
# waits no more than 10 ticks (0.5s) to update. If there are more than 10
# players online, this wait time increases to N ticks. Some conditions can
# cause a player's warmth to be recalculated early, such as dying, changing
# dimensions, teleporting(?), etc.

function vinterra:survival/warmth/ambient/recalc

function vinterra:survival/warmth/block/recalc

function vinterra:survival/warmth/equipment/recalc

# Aggregate warmth categories and calculate final target warmth after applying modifiers
function vinterra:survival/warmth/target/recalc