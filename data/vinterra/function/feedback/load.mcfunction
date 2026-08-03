# vinterra:feedback/load
# Load entry point for the feedback module

# TODO: Posteffects (26.3), transition sounds, etc.

scoreboard objectives add vin.feedback_meta dummy
scoreboard objectives add vin.feedback_tmp dummy

# Per-player one-time hint presentation state
scoreboard objectives add vin.hint_id dummy
scoreboard objectives add vin.hint_timer dummy

scoreboard players set #feedback_interval vin.feedback_meta 5
scoreboard players set #feedback_clock vin.feedback_meta 0

# Hints replace the ordinary actionbar HUD for four seconds
scoreboard players set #hint_duration vin.feedback_meta 80

# Cold Exposure is displayed as a ten-segment bar
scoreboard players set #bar_steps vin.feedback_meta 10

return 1
