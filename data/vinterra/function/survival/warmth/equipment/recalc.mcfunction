# vinterra:survival/warmth/equipment/recalc
# Calculates target player's target equipment warmth
# Must be executed as the player

scoreboard players set @s vin.equip_insulation 0
scoreboard players set @s vin.equip_cold 0

function vinterra:survival/warmth/equipment/read_slot_macro {slot:"head"}
function vinterra:survival/warmth/equipment/read_slot_macro {slot:"chest"}
function vinterra:survival/warmth/equipment/read_slot_macro {slot:"legs"}
function vinterra:survival/warmth/equipment/read_slot_macro {slot:"feet"}

function vinterra:survival/warmth/equipment/apply_wetness

scoreboard players operation @s vin.warmth_equipment = @s vin.equip_insulation
scoreboard players operation @s vin.warmth_equipment -= @s vin.equip_cold

# TODO: Netherite will have some kind of special thermal properties, whether just a high warmth value (unaffected by wetness) or some kind of cold value clamping