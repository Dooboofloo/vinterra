# vinterra:survival/scheduler/tick_active
# Active tick entry point for the survival/scheduler submodule
# Active tick functions (including this one) are only run if there is at least one player online

# Paces expensive survival recalculations across a ten-tick window

# Increase every online player's cached calculation age
scoreboard players add @a vin.recalc_wait 1

# Count online players
scoreboard players set #online vin.schedule_meta 0
execute as @a run scoreboard players add #online vin.schedule_meta 1

# Each player contributes one tenth of a calculation per tick
# This is how we more or less evenly space the calculations based on player count                          
scoreboard players operation #budget vin.schedule_meta += #online vin.schedule_meta

# Spend at most one calculation this tick
execute if score #budget vin.schedule_meta >= #schedule_window vin.schedule_meta run function vinterra:survival/scheduler/run_one

# Ex. 3 players online. 
# Tick:   1   2   3   4   5   6   7   8   9   10   11
# Budget: 3   6   9  12
#                     2   5   8  11
#                                 1   4   7   10
#                                              0   ...
# Thus a player recalcuation is done on ticks 4, 7, and 10. No player waits more than 10 ticks.