# vinterra:survival/comfort/equipment/recalc
# Sum up the amount of comfort granted by equipment

# Leather has hard-coded value. Eventually progressive armor upgrades will exist for better padding materials

# Base leather contributes 2 final comfort (8 quarter-points)
# Later progression could get up to 4 or more

scoreboard players set @s vin.comfort_equipment 0

function vinterra:survival/comfort/equipment/read_slot_macro {slot:"head"}
function vinterra:survival/comfort/equipment/read_slot_macro {slot:"chest"}
function vinterra:survival/comfort/equipment/read_slot_macro {slot:"legs"}
function vinterra:survival/comfort/equipment/read_slot_macro {slot:"feet"}