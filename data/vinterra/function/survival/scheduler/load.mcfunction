# vinterra:survival/scheduler/load

# Number of ticks since each player's last scheduled survival recalculation
scoreboard objectives add vin.recalc_wait dummy

# Shared scheduler state and constants
scoreboard objectives add vin.schedule_meta dummy

scoreboard players set #budget vin.schedule_meta 0
scoreboard players set #online vin.schedule_meta 0
scoreboard players set #max_wait vin.schedule_meta 0

# One complete update per player every ten ticks
scoreboard players set #schedule_window vin.schedule_meta 10

# Maximum retained budget after overload
scoreboard players set #budget_cap vin.schedule_meta 9