# vinterra:survival/warmth/cold_exposure/update_stage

scoreboard players set @s vin.warmth_tmp 0

execute if score @s vin.cold_exposure matches 100.. run scoreboard players set @s vin.warmth_tmp 1
execute if score @s vin.cold_exposure matches 200.. run scoreboard players set @s vin.warmth_tmp 2
execute if score @s vin.cold_exposure matches 300.. run scoreboard players set @s vin.warmth_tmp 3

execute if score @s vin.cold_stage = @s vin.warmth_tmp run return 0

scoreboard players operation @s vin.cold_stage = @s vin.warmth_tmp

# Maximum-health application comes here later

return 1