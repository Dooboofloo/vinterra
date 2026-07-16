# vinterra:survival/warmth/tick_active
# Active tick entry point the for survival/warmth submodule
# Active tick functions (including this one) are only run if there is at least one player online

# TODO: DO NOT KEEP THIS!!! Implement round robin scheduling in the future
execute as @a at @s if block ~ ~-1 ~ #air unless block ~ ~-2 ~ #air positioned ~ ~-1 ~ run return run function vinterra:survival/warmth/block/recalc
execute as @a at @s run function vinterra:survival/warmth/block/recalc