# vinterra:survival/warmth/cold_exposure/update
# Moves cold exposure toward the target represented by the current warmth band
# Must be executed as the player

# Determine target exposure using per-player scratch state
scoreboard players set @s vin.warmth_tmp 0

execute if score @s vin.warmth_band matches -1 run scoreboard players set @s vin.warmth_tmp 100
execute if score @s vin.warmth_band matches -2 run scoreboard players set @s vin.warmth_tmp 200
execute if score @s vin.warmth_band matches -3 run scoreboard players set @s vin.warmth_tmp 300

# Already at the correct exposure
execute if score @s vin.cold_exposure = @s vin.warmth_tmp run return 0

# Recover toward the lower target
execute if score @s vin.cold_exposure > @s vin.warmth_tmp run return run function vinterra:survival/warmth/cold_exposure/recover

# Accumulate toward the higher target at a band-dependent rate
execute if score @s vin.cold_exposure < @s vin.warmth_tmp if score @s vin.warmth_band matches -1 run scoreboard players add @s vin.cold_exposure 1
execute if score @s vin.cold_exposure < @s vin.warmth_tmp if score @s vin.warmth_band matches -2 run scoreboard players add @s vin.cold_exposure 2
execute if score @s vin.cold_exposure < @s vin.warmth_tmp if score @s vin.warmth_band matches -3 run scoreboard players add @s vin.cold_exposure 4

# Clamp worsening movement to the current target
execute if score @s vin.cold_exposure > @s vin.warmth_tmp run scoreboard players operation @s vin.cold_exposure = @s vin.warmth_tmp

function vinterra:survival/warmth/cold_exposure/update_stage

return 1