# vinterra:feedback/warmth/band/colder
# Provides feedback for warmth band changing (colder)
# Must be executed as a player
# vin.warmth_tmp contains the new band
# vin.warmth_band contains the old band

execute if score @s vin.warmth_tmp matches -1 run tellraw @s {text:"[Warmth -1] You begin to feel cold.",color:"aqua",italic:true}
execute if score @s vin.warmth_tmp matches -2 run tellraw @s {text:"[Warmth -2] The cold is becoming dangerous.",color:"blue",italic:true}
execute if score @s vin.warmth_tmp matches -3 run tellraw @s {text:"[Warmth -3] You are freezing.",color:"dark_aqua",bold:true}

# Will eventually provide feedback other than debug output