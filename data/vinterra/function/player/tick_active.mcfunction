# vinterra:player/tick_active
# Active tick entry point for the player module. Calls each submodule's active tick function
# Active tick functions (including this one) are only run if there is at least one player online

# Reset respawned players
execute as @a[tag=vin.player_initialized,scores={vin.player_respawn=1}] run function vinterra:player/respawn

# Initialize new players only after their first tick alive (prevents double urgent recalc on join)
execute as @a[tag=!vin.player_initialized,scores={vin.player_respawn=1..}] run function vinterra:player/initialize

# Decrement player grace period timers
scoreboard players remove @a[scores={vin.player_grace_counter=1..}] vin.player_grace_counter 1
scoreboard players set @a[scores={vin.player_grace_counter=..0}] vin.player_grace_counter 0