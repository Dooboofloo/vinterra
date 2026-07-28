# vinterra:survival/warmth/cold_exposure/reset
# Clears accumulated cold exposure and its consequences
# Must be executed as the player

scoreboard players set @s vin.cold_exposure 0
scoreboard players set @s vin.cold_stage 0

# Eventually ensure the stage-0 maximum-health state is applied here

return 1