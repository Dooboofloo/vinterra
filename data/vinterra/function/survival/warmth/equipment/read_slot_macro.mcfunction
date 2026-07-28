# vinterra:survival/warmth/equipment/read_slot_macro
# Reads the insulation and cold values of the equipment in one player's armor slot
# Explicit custom-data values replace the item's corresponding default value.
# Usage: function vinterra:survival/warmth/equipment/read_slot_macro {slot:"<slot>"} (head | chest | legs | feet)

# Read insulation override, otherwise use the vanilla leather default
scoreboard players set @s vin.warmth_tmp 0
$execute if data entity @s equipment.$(slot).components."minecraft:custom_data".vinterra.warmth.insulation store result score @s vin.warmth_tmp run data get entity @s equipment.$(slot).components."minecraft:custom_data".vinterra.warmth.insulation 1
$execute unless data entity @s equipment.$(slot).components."minecraft:custom_data".vinterra.warmth.insulation if items entity @s armor.$(slot) #vinterra:armor/leather run scoreboard players operation @s vin.warmth_tmp = #leather_$(slot) vin.warmth_meta
execute if score @s vin.warmth_tmp matches ..-1 run scoreboard players set @s vin.warmth_tmp 0
scoreboard players operation @s vin.equip_insulation += @s vin.warmth_tmp

# Read cold override, otherwise use the vanilla cold default
scoreboard players set @s vin.warmth_tmp 0
$execute if data entity @s equipment.$(slot).components."minecraft:custom_data".vinterra.warmth.cold store result score @s vin.warmth_tmp run data get entity @s equipment.$(slot).components."minecraft:custom_data".vinterra.warmth.cold 1
$execute unless data entity @s equipment.$(slot).components."minecraft:custom_data".vinterra.warmth.cold if items entity @s armor.$(slot) #vinterra:armor/cold run scoreboard players operation @s vin.warmth_tmp = #cold_armor_$(slot) vin.warmth_meta
execute if score @s vin.warmth_tmp matches ..-1 run scoreboard players set @s vin.warmth_tmp 0
scoreboard players operation @s vin.equip_cold += @s vin.warmth_tmp