# vinterra:feedback/event/warmth/cold_exposure/better
# Provides feedback for cold exposure stage changing (getting better)
# Must be executed as a player
# vin.warmth_tmp contains the new stage
# vin.cold_stage contains the old stage

execute if score @s vin.warmth_tmp matches 2 run tellraw @s {text:"[Cold Exposure 2] Your condition is beginning to improve.",color:"red",italic:true}
execute if score @s vin.warmth_tmp matches 1 run tellraw @s {text:"[Cold Exposure 1] You are recovering from the exposure.",color:"gold",italic:true}
execute if score @s vin.warmth_tmp matches 0 run tellraw @s {text:"[Cold Exposure 0] You have recovered from the cold.",color:"green",italic:true}

# Will eventually provide feedback other than debug output