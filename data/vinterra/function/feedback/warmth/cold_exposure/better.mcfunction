# vinterra:feedback/warmth/cold_exposure/better
# Provides feedback for cold exposure stage changing (getting better)
# Must be executed as a player
# vin.warmth_tmp contains the new stage
# vin.warmth_band contains the old stage

execute if score @s vin.warmth_tmp matches 2 run tellraw @s {text:"Your condition is beginning to improve. (Exposure 2)",color:"red",italic:true}
execute if score @s vin.warmth_tmp matches 1 run tellraw @s {text:"You are recovering from the exposure. (Exposure 1)",color:"gold",italic:true}
execute if score @s vin.warmth_tmp matches 0 run tellraw @s {text:"You have recovered from the cold. (Exposure 0)",color:"green",italic:true}

# Will eventually provide feedback other than debug output