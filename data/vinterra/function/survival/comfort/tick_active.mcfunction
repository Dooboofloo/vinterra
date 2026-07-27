# vinterra:survival/comfort/tick_active
# Active tick entry point the for survival/comfort submodule
# Active tick functions (including this one) are only run if there is at least one player online

# For debug output
# scoreboard players set #dry_loss vin.comfort_meta 0

execute as @a[predicate=!vinterra:player/currently_dead] at @s run function vinterra:survival/comfort/wetness/update

# Debug output (note this doesn't really work for multiple players, it always shows the last #dry_loss)
# execute as @a run tellraw @s [{text:"Wetness: "}, {score:{name:"@s",objective:"vin.wetness"}}, {text:" (Loss: "}, {score:{name:"#dry_loss",objective:"vin.comfort_meta"}}, {text:")"}]
