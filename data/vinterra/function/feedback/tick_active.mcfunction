# vinterra:feedback/tick_active
# Active tick entry point for the feedback module
# Active tick functions (including this one) are only run if there is at least one player online

scoreboard players add #hud_clock vin.feedback_meta 1
execute if score #hud_clock vin.feedback_meta >= #hud_interval vin.feedback_meta run return run function vinterra:feedback/hud/update_all

return 0
