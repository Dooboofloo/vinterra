# vinterra:feedback/warmth/band/colder
# Provides feedback for warmth band changing (colder)
# Must be executed as a player
# vin.warmth_tmp contains the new band
# vin.warmth_band contains the old band

execute if score @s vin.warmth_tmp matches -1 run tellraw @s {text:"You begin to feel cold. (Warmth -1)",color:"aqua",italic:true}
execute if score @s vin.warmth_tmp matches -2 run tellraw @s {text:"The cold is becoming dangerous. (Warmth -2)",color:"blue",italic:true}
execute if score @s vin.warmth_tmp matches -3 run tellraw @s {text:"You are freezing. (Warmth -3)",color:"dark_aqua",bold:true}

# Will eventually provide feedback other than debug output