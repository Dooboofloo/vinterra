# vinterra:survival/scheduler/run_urgent
# Selects and recalculates exactly one player with an urgent request

# Clear temporary selection state defensively
tag @a remove vin.recalc_candidate
tag @a remove vin.recalc_selected

# Select exactly one urgent player
tag @a[tag=vin.recalc_urgent,predicate=vinterra:player/participating,sort=arbitrary,limit=1] add vin.recalc_selected

# Debug output
tellraw @a[tag=vin.debug_viewer] [{text:"[Scheduler] Running Urgent Recalc for: "}, {selector:"@a[tag=vin.recalc_selected]"}]

# Defensive guard
execute unless entity @a[tag=vin.recalc_selected] run return 0

# Account for one calculation
function vinterra:survival/scheduler/spend_budget

# Perform the complete expensive calculation
execute as @a[tag=vin.recalc_selected] at @s run function vinterra:survival/recalc

# Clear the fulfilled request and reset its scheduled age
tag @a[tag=vin.recalc_selected] remove vin.recalc_urgent
scoreboard players set @a[tag=vin.recalc_selected] vin.recalc_wait 0

# Cleanup
tag @a remove vin.recalc_selected

return 1