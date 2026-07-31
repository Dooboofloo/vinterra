# vinterra:survival/comfort/cozy_blocks/accumulate_category
# Dispatches an accumulating block to its correct category
# Must be executed at a block in #vinterra:cozy_block

execute if block ~ ~ ~ #vinterra:cozy_blocks/campfire run return run function vinterra:survival/comfort/cozy_blocks/category/campfire
execute if block ~ ~ ~ #vinterra:cozy_blocks/bedding run return run function vinterra:survival/comfort/cozy_blocks/category/bedding
execute if block ~ ~ ~ #vinterra:cozy_blocks/softness run return run function vinterra:survival/comfort/cozy_blocks/category/softness
execute if block ~ ~ ~ #vinterra:cozy_blocks/decoration run return run function vinterra:survival/comfort/cozy_blocks/category/decoration
execute if block ~ ~ ~ #vinterra:cozy_blocks/banner run return run function vinterra:survival/comfort/cozy_blocks/category/banner

return 0