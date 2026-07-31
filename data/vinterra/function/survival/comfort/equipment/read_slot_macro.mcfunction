# vinterra:survival/comfort/equipment/read_slot_macro
# Reads the comfort value of the equipment in one player's armor slot
# Explicit custom-data values replace the item's corresponding default value.
# Usage: function vinterra:survival/comfort/equipment/read_slot_macro {slot:"<slot>"} (head | chest | legs | feet)

# Read comfort override, otherwise use the vanilla leather default
scoreboard players set @s vin.comfort_tmp 0
$execute if data entity @s equipment.$(slot).components."minecraft:custom_data".vinterra.comfort store result score @s vin.comfort_tmp run data get entity @s equipment.$(slot).components."minecraft:custom_data".vinterra.comfort 1
$execute unless data entity @s equipment.$(slot).components."minecraft:custom_data".vinterra.comfort if items entity @s armor.$(slot) #vinterra:armor/leather run scoreboard players operation @s vin.comfort_tmp = #leather_$(slot) vin.comfort_meta
execute if score @s vin.comfort_tmp matches ..-1 run scoreboard players set @s vin.comfort_tmp 0
scoreboard players operation @s vin.comfort_equipment += @s vin.comfort_tmp