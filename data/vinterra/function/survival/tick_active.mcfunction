# vinterra:survival/tick_active
# Active tick entry point for the survival module. Calls each submodule's active tick function
# Active tick functions (including this one) are only run if there is at least one player online

# Fast, continuous mechanics
function vinterra:survival/comfort/tick_active
# function vinterra:survival/warmth/tick_active # TODO: Uncomment this line once this function actually does something

# Expensive survival recalculations scheduler
function vinterra:survival/scheduler/tick_active