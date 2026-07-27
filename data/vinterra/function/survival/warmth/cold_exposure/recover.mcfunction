# vinterra:survival/warmth/cold_exposure/recover

# TODO: Recover at different rates based on higher warmth bands 
scoreboard players remove @s vin.cold_exposure 4

# Do not recover past the current band's target
execute if score @s vin.cold_exposure < @s vin.warmth_tmp run scoreboard players operation @s vin.cold_exposure = @s vin.warmth_tmp

function vinterra:survival/warmth/cold_exposure/update_stage

return 1