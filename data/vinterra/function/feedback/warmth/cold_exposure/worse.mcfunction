# vinterra:feedback/warmth/cold_exposure/worse
# Provides feedback for cold exposure stage changing (getting worse)
# Must be executed as a player
# vin.warmth_tmp contains the new stage
# vin.warmth_band contains the old stage

execute if score @s vin.warmth_tmp matches 1 run tellraw @s {text:"The cold is beginning to take its toll. (Exposure 1)",color:"gold",italic:true}
execute if score @s vin.warmth_tmp matches 2 run tellraw @s {text:"Prolonged exposure is weakening you. (Exposure 2)",color:"red",italic:true}
execute if score @s vin.warmth_tmp matches 3 run tellraw @s {text:"Your condition is critical. (Exposure 3)",color:"dark_red",bold:true}

# Will eventually provide feedback other than debug output