# vinterra:survival/warmth/block/recalc
# Establishes a stable origin for one player's block warmth calculation,
# then calls vinterra:survival/warmth/block/recalc_positioned at that position
# Must be executed as and at the player

# Offset before flooring to compensate for short blocks such as
# soul sand and mud. If the player has risen into the next block while jumping,
# shift back down when a passable block is above solid support.
execute positioned ~ ~0.125 ~ align y if block ~ ~-1 ~ #vinterra:heat_raycast_passable unless block ~ ~-2 ~ #vinterra:heat_raycast_passable positioned ~ ~-1 ~ run return run function vinterra:survival/warmth/block/recalc_positioned

return run execute positioned ~ ~0.125 ~ align y run function vinterra:survival/warmth/block/recalc_positioned