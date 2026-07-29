# vinterra:survival/comfort/recalc
# Recalculates cached comfort conditions for one player
# Must be executed as and at the player

# TODO: Watch this
# Is it readable to players?
# Is it too complex for its own good?
# Can it be simplified while retaining its mechanical identity?

function vinterra:survival/comfort/coverage/recalc
function vinterra:survival/comfort/shelter/recalc

# Remove the coverage-to-shelter handoff marker
function vinterra:survival/comfort/coverage/cleanup

return 1