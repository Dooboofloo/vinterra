# vinterra:feedback/update_all
# Dispatches player-facing Feedback updates for all initialized living players

scoreboard players set #feedback_clock vin.feedback_meta 0

# Do not resume a partially displayed hint after death
execute as @a[tag=vin.player_initialized,scores={vin.player_respawn=1}] run function vinterra:feedback/hint/clear

# Debug viewers retain the dedicated diagnostic actionbar and do not consume unseen hints
execute as @a[tag=vin.player_initialized,tag=!vin.debug_viewer,predicate=!vinterra:player/currently_dead] run function vinterra:feedback/update

return 1