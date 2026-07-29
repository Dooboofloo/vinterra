# vinterra:survival/warmth/block/recalc
# Establishes a stable origin for one player's block warmth calculation,
# then calls vinterra:survival/warmth/block/recalc_positioned at that position
# Must be executed as and at the player

# Offset before flooring to compensate for short blocks such as
# soul sand and mud. If the player has risen into the next block while jumping,
# shift back down when a passable block is above solid support.

# Grounded players always use their current aligned position
execute if predicate vinterra:player/on_ground positioned ~ ~0.125 ~ align y run return run function vinterra:survival/warmth/block/recalc_positioned


# TYPE 1: Player took off from direct support
# When the aligned origin rises into the next block, the block immediately below becomes passable while the block two below remains solid.
execute if score @s vin.over_edge matches 0 positioned ~ ~0.125 ~ align y if block ~ ~-1 ~ #vinterra:heat_raycast_passable unless block ~ ~-2 ~ #vinterra:heat_raycast_passable positioned ~ ~-1 ~ run return run function vinterra:survival/warmth/block/recalc_positioned


# TYPE 2: Player took off over one air block with solid support below it
# Once the aligned origin rises, both blocks below the new origin are passable, so shift back down.
execute if score @s vin.over_edge matches 1 positioned ~ ~0.125 ~ align y if block ~ ~-1 ~ #vinterra:heat_raycast_passable if block ~ ~-2 ~ #vinterra:heat_raycast_passable positioned ~ ~-1 ~ run return run function vinterra:survival/warmth/block/recalc_positioned


# TYPE 3: Player took off over open air
# Rises by one block briefly near the peak, but never drops below the takeoff layer
# TODO: See if I can fix this eventually
execute if score @s vin.over_edge matches 2 positioned ~ ~0.125 ~ align y run return run function vinterra:survival/warmth/block/recalc_positioned


# Fallback
return run execute positioned ~ ~0.125 ~ align y run function vinterra:survival/warmth/block/recalc_positioned