# vinterra:survival/scheduler/run_one
# Selects and recalculates exactly one longest-waiting player

# Spend the budget for calculating this player, with an exception for urgent recalculations
function vinterra:survival/scheduler/spend_budget

# Find the greatest current wait time
scoreboard players set #max_wait vin.schedule_meta -1
scoreboard players operation #max_wait vin.schedule_meta > @a vin.recalc_wait

# Clear temporary selection tags
tag @a remove vin.recalc_candidate
tag @a remove vin.recalc_selected

# Mark every living player tied for the longest wait
execute as @a[predicate=!vinterra:player/currently_dead] if score @s vin.recalc_wait = #max_wait vin.schedule_meta run tag @s add vin.recalc_candidate

# Break a tie arbitrarily, but select exactly one player
tag @a[tag=vin.recalc_candidate,sort=arbitrary,limit=1] add vin.recalc_selected

# Debug output
# tellraw @a[tag=vin.debug_viewer] [{text:"[Scheduler] Running Recalc for: "}, {selector:"@a[tag=vin.recalc_selected]"}]

# Perform the complete expensive calculation
execute as @a[tag=vin.recalc_selected] at @s run function vinterra:survival/recalc

# Reset the selected player's age
scoreboard players set @a[tag=vin.recalc_selected] vin.recalc_wait 0

# Cleanup
tag @a remove vin.recalc_candidate
tag @a remove vin.recalc_selected

return 1