# vinterra:debug/profile/finish

tellraw @s {text:"Profile Finished",color:"green"}

data modify storage vinterra:debug profile.archive append from storage vinterra:debug profile.active
data remove storage vinterra:debug profile.active
data remove storage vinterra:debug profile.sample
tag @s remove vin.debug_profile_active

return 1