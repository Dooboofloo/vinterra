# vinterra:feedback/hint/clear
# Clears the executing player's transient hint presentation state

scoreboard players set @s vin.hint_id 0
scoreboard players set @s vin.hint_timer 0

return 1
