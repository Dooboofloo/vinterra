# vinterra:survival/warmth/cold_exposure/apply_stage
# Applies a cold-stage transition
# vin.warmth_tmp contains the new stage
# Must be executed as the player

# Produce feedback while both old and new values are available
execute if score @s vin.cold_stage < @s vin.warmth_tmp run function vinterra:feedback/warmth/cold_exposure/worse
execute if score @s vin.cold_stage > @s vin.warmth_tmp run function vinterra:feedback/warmth/cold_exposure/better

# Commit the new stage
scoreboard players operation @s vin.cold_stage = @s vin.warmth_tmp

# Apply mechanical consequences
function vinterra:player/health/max_health/apply_cold_exposure

return 1