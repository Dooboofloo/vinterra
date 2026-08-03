# vinterra:feedback/load
# Load entry point for the feedback module

scoreboard objectives add vin.feedback_meta dummy
scoreboard objectives add vin.feedback_tmp dummy

scoreboard players set #hud_interval vin.feedback_meta 5
scoreboard players set #hud_clock vin.feedback_meta 0

# Cold Exposure is displayed as a ten-segment bar
scoreboard players set #bar_steps vin.feedback_meta 10

return 1
