# vinterra:survival/scheduler/run_one
# Selects and recalculates exactly one longest-waiting player

# Spend one calculation (default 10 ticks)
scoreboard players operation #budget vin.schedule_meta -= #schedule_window vin.schedule_meta

# If more than ten players are online, demand exceeds the strict capacity
# of one calculation per tick. Discard excess backlog so a temporary
# overload does not cause calculations every tick long after it ends.
execute if score #budget vin.schedule_meta >= #schedule_window vin.schedule_meta run scoreboard players operation #budget vin.schedule_meta = #budget_cap vin.schedule_meta

# Find the greatest current wait time
scoreboard players set #max_wait vin.schedule_meta -1
scoreboard players operation #max_wait vin.schedule_meta > @a vin.recalc_wait

# Clear temporary selection tags
tag @a remove vin.recalc_candidate
tag @a remove vin.recalc_selected

# Mark every player tied for the longest wait
execute as @a if score @s vin.recalc_wait = #max_wait vin.schedule_meta run tag @s add vin.recalc_candidate

# Break a tie arbitrarily, but select exactly one player
tag @a[tag=vin.recalc_candidate,sort=arbitrary,limit=1] add vin.recalc_selected

# Perform the complete expensive calculation
execute as @a[tag=vin.recalc_selected] at @s run function vinterra:survival/recalc

# Reset the selected player's age
scoreboard players set @a[tag=vin.recalc_selected] vin.recalc_wait 0

# Cleanup
tag @a remove vin.recalc_candidate
tag @a remove vin.recalc_selected