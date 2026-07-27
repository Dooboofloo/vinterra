# vinterra:survival/warmth/equipment/recalc
# Calculates target player's target equipment warmth
# Must be executed as the player

scoreboard players set @s vin.warmth_equipment 0

# TODO: Make predicates for these, or defined per-equipment values, rather than hard coding here.
# Also maybe split into functions for different slots?

execute if entity @s[nbt={equipment:{head:{id:"minecraft:leather_helmet"}}}] run scoreboard players add @s vin.warmth_equipment 4
execute if entity @s[nbt={equipment:{chest:{id:"minecraft:leather_chestplate"}}}] run scoreboard players add @s vin.warmth_equipment 12
execute if entity @s[nbt={equipment:{legs:{id:"minecraft:leather_leggings"}}}] run scoreboard players add @s vin.warmth_equipment 8
execute if entity @s[nbt={equipment:{feet:{id:"minecraft:leather_boots"}}}] run scoreboard players add @s vin.warmth_equipment 4

function vinterra:survival/warmth/equipment/apply_wetness