# vinterra:feedback/hint/check
# Starts the highest-priority eligible unseen Survival hint
# Must be executed as an initialized living player who has no active hint

# Cold Exposure is the highest priority because it already reduces maximum health
execute if score @s vin.cold_stage matches 1.. unless entity @s[advancements={vinterra:feedback/hint_seen/cold_exposure=true}] run return run function vinterra:feedback/hint/start/cold_exposure

# Meaningful Wetness teaches both its cold amplification and insulation penalty
execute if score @s vin.wetness matches 400.. unless entity @s[advancements={vinterra:feedback/hint_seen/wetness=true}] run return run function vinterra:feedback/hint/start/wetness

# Any negative Warmth band is enough to teach the basic response to cold
execute if score @s vin.warmth_band matches ..-1 unless entity @s[advancements={vinterra:feedback/hint_seen/cold=true}] run return run function vinterra:feedback/hint/start/cold

return 0