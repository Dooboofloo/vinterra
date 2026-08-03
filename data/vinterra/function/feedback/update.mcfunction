# vinterra:feedback/update
# Selects the current Feedback presentation for one initialized living player
# Must be executed as the player

# Continue an active hint
execute if score @s vin.hint_timer matches 1.. run return run function vinterra:feedback/hint/update

# Check whether a new hint should begin
function vinterra:feedback/hint/check

# A started hint sets vin.hint_timer and renders itself immediately
execute if score @s vin.hint_timer matches 1.. run return 1

# Otherwise render the persistent Survival HUD
return run function vinterra:feedback/hud/update