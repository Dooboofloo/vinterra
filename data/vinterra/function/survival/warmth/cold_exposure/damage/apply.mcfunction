# vinterra:survival/warmth/cold_exposure/damage/apply
# Must be executed as the player

damage @s 1 minecraft:freeze
scoreboard players set @s vin.cold_dmg_timer 0

return 1