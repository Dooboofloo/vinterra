# vinterra:feedback/warmth/band/warmer
# Provides feedback for warmth band changing (warmer)
# Must be executed as a player
# vin.warmth_tmp contains the new band
# vin.warmth_band contains the old band

execute if score @s vin.warmth_tmp matches -2 run tellraw @s {text:"[Warmth -2] You are no longer freezing.",color:"blue",italic:true}
execute if score @s vin.warmth_tmp matches -1 run tellraw @s {text:"[Warmth -1] The worst of the cold is passing.",color:"aqua",italic:true}
execute if score @s vin.warmth_tmp matches 0 run tellraw @s {text:"[Warmth 0+] You begin to warm up.",color:"green",italic:true}

# Will eventually provide feedback other than debug output