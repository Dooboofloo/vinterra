# vinterra:feedback/event/warmth/cold_exposure/worse
# Provides feedback for cold exposure stage changing (getting worse)
# Must be executed as a player
# vin.warmth_tmp contains the new stage
# vin.cold_stage contains the old stage

# execute if score @s vin.warmth_tmp matches 1 run tellraw @s {text:"[Cold Exposure 1] The cold is beginning to take its toll.",color:"gold",italic:true}
# execute if score @s vin.warmth_tmp matches 2 run tellraw @s {text:"[Cold Exposure 2] Prolonged exposure is weakening you.",color:"red",italic:true}
# execute if score @s vin.warmth_tmp matches 3 run tellraw @s {text:"[Cold Exposure 3] Your condition is critical.",color:"dark_red",bold:true}

# Will eventually provide feedback other than debug output