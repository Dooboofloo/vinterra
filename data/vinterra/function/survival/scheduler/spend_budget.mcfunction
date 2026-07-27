# vinterra:survival/scheduler/spend_budget
# Accounts for one completed survival recalculation

# Spend one calculation (default 10 ticks)
scoreboard players operation #budget vin.schedule_meta -= #schedule_window vin.schedule_meta

# Urgent work may run before enough budget has accumulated.
# Do not retain negative scheduler debt.
execute if score #budget vin.schedule_meta matches ..-1 run scoreboard players set #budget vin.schedule_meta 0

# If more than ten players are online, demand exceeds the strict capacity
# of one calculation per tick. Discard excess backlog so a temporary
# overload does not cause calculations every tick long after it ends.
execute if score #budget vin.schedule_meta >= #schedule_window vin.schedule_meta run scoreboard players operation #budget vin.schedule_meta = #budget_cap vin.schedule_meta