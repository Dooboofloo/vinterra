# vinterra:_entry/load
# Main load entry point for the datapack. Calls only the top-level load function of each module

# Module load order:
# World -> Player -> Survival

function vinterra:world/load
function vinterra:player/load
function vinterra:survival/load