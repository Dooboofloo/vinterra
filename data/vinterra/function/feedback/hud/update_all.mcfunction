# vinterra:feedback/hud/update_all
# Refreshes the Survival UI for all initialized living players

scoreboard players set #hud_clock vin.feedback_meta 0

# Debug viewers retain the dedicated diagnostic actionbar
execute as @a[tag=vin.player_initialized,tag=!vin.debug_viewer,predicate=!vinterra:player/currently_dead] run function vinterra:feedback/hud/update

return 1
