# vinterra:feedback/load
# Load entry point for the feedback module

scoreboard objectives add vin.feedback_meta dummy
scoreboard objectives add vin.feedback_tmp dummy

# Cold Exposure is displayed as a ten-segment bar
scoreboard players set #bar_steps vin.feedback_meta 10

return 1
