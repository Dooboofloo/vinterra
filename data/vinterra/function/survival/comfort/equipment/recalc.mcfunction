# vinterra:survival/comfort/equipment/recalc

# TODO: Worn equipment adds comfort
# Still in quarter-points, then quantized later
# Should read an item component if it exists, otherwise fall back (like equipment warmth does)
# Vanilla leather has hard-coded value. Eventually progressive armor upgrades will exist for better padding materials

# Base leather contributes 2 final comfort (8 quarter-points)
# Later progression could get up to 4 or more

scoreboard players set @s vin.comfort_equipment 0

return 1