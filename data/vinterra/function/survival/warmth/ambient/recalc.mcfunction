# vinterra:survival/warmth/ambient/recalc
# Must be executed as and at the player

scoreboard players set @s vin.warmth_ambient 0

function vinterra:survival/warmth/ambient/climate/apply

# Consider time only if in the overworld
execute if dimension minecraft:overworld run function vinterra:survival/warmth/ambient/time/apply

function vinterra:survival/warmth/ambient/weather/apply