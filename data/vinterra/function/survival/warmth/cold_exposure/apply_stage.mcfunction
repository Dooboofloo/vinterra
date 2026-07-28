# vinterra:survival/warmth/cold_exposure/change_stage
# Applies a cold-stage transition
# vin.warmth_tmp contains the new stage
# Must be executed as the player

scoreboard players operation @s vin.cold_stage = @s vin.warmth_tmp

# TODO:
# - apply maximum-health modifier
# - display health-stage feedback
# - play transition sound

return 1