# vinterra:survival/warmth/ambient/recalc
# Recalculates the player's environmental ambient warmth contribution
# Must be executed as and at the player

scoreboard players set @s vin.warmth_ambient 0

function vinterra:survival/warmth/ambient/climate/apply

# Consider time only if in the overworld
execute if dimension minecraft:overworld run function vinterra:survival/warmth/ambient/time/apply

function vinterra:survival/warmth/ambient/weather/apply

# Reduce exposure according to the player's shelter value
function vinterra:survival/warmth/ambient/shelter/apply

return 1