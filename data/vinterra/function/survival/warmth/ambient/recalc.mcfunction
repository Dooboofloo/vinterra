# vinterra:survival/warmth/ambient/recalc
# Recalculates the player's environmental ambient warmth contribution
# Must be executed as and at the player

scoreboard players set @s vin.warmth_ambient 0

## Ambient Warmth Contributors

# Climate
function vinterra:survival/warmth/ambient/climate/apply
# Time
function vinterra:survival/warmth/ambient/time/apply
# Weather
function vinterra:survival/warmth/ambient/weather/apply

## Ambient Warmth Modifiers

# Reduce overall magnitude according to the player's shelter value
function vinterra:survival/warmth/ambient/shelter/apply
# Increase only negative warmth according to the player's wetness
function vinterra:survival/warmth/ambient/wetness/apply

return 1