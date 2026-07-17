# vinterra:survival/warmth/tick_active
# Active tick entry point the for survival/warmth submodule
# Active tick functions (including this one) are only run if there is at least one player online

# TODO: DO NOT KEEP THIS!!! Implement round robin scheduling in the future
# kill @e[type=armor_stand,tag=vin.test]
execute as @a at @s run function vinterra:survival/warmth/block/recalc