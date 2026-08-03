# vinterra:survival/scheduler/tick_active
# Active tick entry point for the survival/scheduler submodule
# Active tick functions (including this one) are only run if there is at least one player online

# Paces expensive survival recalculations across a ten-tick window

# Increase every living online player's cached calculation age
scoreboard players add @a[predicate=vinterra:player/participating] vin.recalc_wait 1

# Count living online players
scoreboard players set #participants vin.schedule_meta 0
execute as @a[predicate=vinterra:player/participating] run scoreboard players add #participants vin.schedule_meta 1

# Each player contributes one tenth of a calculation per tick
# This is how we more or less evenly space the calculations based on player count                          
scoreboard players operation #budget vin.schedule_meta += #participants vin.schedule_meta

# Urgent requests bypass the normal budget requirement, but the scheduler
# still performs no more than one complete recalculation this tick.
execute if entity @a[tag=vin.recalc_urgent,predicate=vinterra:player/participating] run return run function vinterra:survival/scheduler/run_urgent

# Otherwise, perform ordinary scheduled work when enough budget exists (and at least one player is alive)
execute if entity @a[predicate=vinterra:player/participating] if score #budget vin.schedule_meta >= #schedule_window vin.schedule_meta run function vinterra:survival/scheduler/run_one

return 0

# Ex. 3 players online. 
# Tick:   1   2   3   4   5   6   7   8   9   10   11
# Budget: 3   6   9  12
#                     2   5   8  11
#                                 1   4   7   10
#                                              0   ...
# Thus a player recalcuation is done on ticks 4, 7, and 10. No player waits more than 10 ticks.