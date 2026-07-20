# vinterra:_entry/tick
# Main tick entry point for the datapack. Calls only the top-level tick function of each module

# At the beginning of each tick, we must call the active tick functions of each module.
# Since these resolve before the inactive tick functions, active functions must not rely on inactive tick functions.
execute if entity @a run function vinterra:_entry/tick_active

# function vinterra:world/tick