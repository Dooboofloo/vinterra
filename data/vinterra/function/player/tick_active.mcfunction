# vinterra:player/tick_active
# Active tick entry point for the player module. Calls each submodule's active tick function
# Active tick functions (including this one) are only run if there is at least one player online

# Reset respawned players
execute as @e[tag=vin.player_initialized,scores={vin.player_respawn=1}] run function vinterra:player/respawn

# Initialize new players
execute as @a[tag=!vin.player_initialized] run function vinterra:player/initialize

