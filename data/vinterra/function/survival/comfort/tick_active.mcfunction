# vinterra:survival/comfort/tick_active
# Active tick entry point the for survival/comfort submodule
# Active tick functions (including this one) are only run if there is at least one player online

scoreboard players set #dry_loss vin.comfort_meta 0

execute as @a at @s run function vinterra:survival/comfort/wetness/update

execute as @a run tellraw @s [{text:"Wetness: "}, {score:{name:"@s",objective:"vin.wetness"}}, {text:" (Loss: "}, {score:{name:"#dry_loss",objective:"vin.comfort_meta"}}, {text:")"}]
