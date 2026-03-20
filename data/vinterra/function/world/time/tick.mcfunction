# vinterra:world/time/tick
# Tick entry point for the world/time submodule

# Run the active tick entry point only if at least one player is online
# TODO: Move "active tick" logic up to the top level
execute if entity @a run function vinterra:world/time/tick_active