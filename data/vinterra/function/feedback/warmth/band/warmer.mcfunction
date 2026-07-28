# vinterra:feedback/warmth/band/warmer
# Provides feedback for warmth band changing (warmer)
# Must be executed as a player
# vin.warmth_tmp contains the new band
# vin.warmth_band contains the old band

execute if score @s vin.warmth_tmp matches -2 run tellraw @s {text:"You are no longer freezing. (Warmth -2)",color:"blue",italic:true}
execute if score @s vin.warmth_tmp matches -1 run tellraw @s {text:"The worst of the cold is passing. (Warmth -1)",color:"aqua",italic:true}
execute if score @s vin.warmth_tmp matches 0 run tellraw @s {text:"You begin to warm up. (Warmth ≥0)",color:"green",italic:true}

# Will eventually provide feedback other than debug output