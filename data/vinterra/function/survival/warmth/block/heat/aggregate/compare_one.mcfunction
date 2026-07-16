# vinterra:survival/warmth/block/heat/aggregate/compare_one
# Updates the current maximum using this probe's heat value
# Must be executed as a heat probe

execute if score @s vin.heat_val > #agg_max vin.heat_tmp run scoreboard players operation #agg_max vin.heat_tmp = @s vin.heat_val