# vinterra:world/tick_active
# Active tick entry point for the world module. Calls each submodule's active tick function
# Active tick functions (including this one) are only run if there is at least one player online

# Submodule active tick functions
function vinterra:world/time/tick_active