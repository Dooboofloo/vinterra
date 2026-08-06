# vinterra:debug/profile/cancel
# Cancels the current or interrupted profile

scoreboard players set @a[tag=vin.debug_profile_active] vin.debug_profile_timer 0
tag @a remove vin.debug_profile_active
data remove storage vinterra:debug profile.active
data remove storage vinterra:debug profile.sample

return 1