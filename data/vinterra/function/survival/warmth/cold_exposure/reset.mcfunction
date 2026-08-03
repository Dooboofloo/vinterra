# vinterra:survival/warmth/cold_exposure/reset
# Clears accumulated cold exposure and its consequences
# Must be executed as the player

scoreboard players set @s vin.cold_exposure 0
scoreboard players set @s vin.cold_stage 0
scoreboard players set @s vin.cold_dmg_timer 0

function vinterra:player/health/max_health/apply_cold_exposure

return 1