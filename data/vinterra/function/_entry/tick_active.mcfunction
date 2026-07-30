# vinterra:_entry/tick_active
# Main active tick entry point for the datapack. Calls only the top-level active tick function of each module (if it exists)
# Active tick functions (including this one) are only run if there is at least one player online

# Module load order:
# World -> Player -> Survival

# Module active tick functions
function vinterra:world/tick_active
function vinterra:player/tick_active
function vinterra:survival/tick_active

function vinterra:debug/tick_active