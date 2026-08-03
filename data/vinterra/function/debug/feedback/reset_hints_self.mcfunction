# vinterra:debug/feedback/reset_hints_self
# Resets one player's Survival onboarding so each hint and toast can be tested again
# Must be executed as the player

advancement revoke @s only vinterra:feedback/hint_seen/cold
advancement revoke @s only vinterra:feedback/hint_seen/wetness
advancement revoke @s only vinterra:feedback/hint_seen/cold_exposure
function vinterra:feedback/hint/clear

return 1
