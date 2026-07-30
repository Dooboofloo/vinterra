# vinterra:survival/comfort/shelter/raycast/cast_all
# Casts all world-aligned shelter rays from the player's eyes
# Must be executed as and at the player

## Horizontal cardinal rays: 4 × 128

function vinterra:survival/comfort/shelter/raycast/cast_macro {yaw:"0",pitch:"0",weight:128}
function vinterra:survival/comfort/shelter/raycast/cast_macro {yaw:"90",pitch:"0",weight:128}
function vinterra:survival/comfort/shelter/raycast/cast_macro {yaw:"180",pitch:"0",weight:128}
function vinterra:survival/comfort/shelter/raycast/cast_macro {yaw:"-90",pitch:"0",weight:128}

## Horizontal diagonal rays: 4 × 96

function vinterra:survival/comfort/shelter/raycast/cast_macro {yaw:"45",pitch:"0",weight:96}
function vinterra:survival/comfort/shelter/raycast/cast_macro {yaw:"135",pitch:"0",weight:96}
function vinterra:survival/comfort/shelter/raycast/cast_macro {yaw:"-135",pitch:"0",weight:96}
function vinterra:survival/comfort/shelter/raycast/cast_macro {yaw:"-45",pitch:"0",weight:96}

## Straight upward: 1 × 32

function vinterra:survival/comfort/shelter/raycast/cast_macro {yaw:"0",pitch:"-90",weight:32}

## Upward cardinal diagonals: 4 × 16

function vinterra:survival/comfort/shelter/raycast/cast_macro {yaw:"0",pitch:"-45",weight:16}
function vinterra:survival/comfort/shelter/raycast/cast_macro {yaw:"90",pitch:"-45",weight:16}
function vinterra:survival/comfort/shelter/raycast/cast_macro {yaw:"180",pitch:"-45",weight:16}
function vinterra:survival/comfort/shelter/raycast/cast_macro {yaw:"-90",pitch:"-45",weight:16}

## Upward corner diagonals: 4 × 8
# Equal X/Y/Z components use pitch approximately -35.264 degrees

function vinterra:survival/comfort/shelter/raycast/cast_macro {yaw:"45",pitch:"-35.264",weight:8}
function vinterra:survival/comfort/shelter/raycast/cast_macro {yaw:"135",pitch:"-35.264",weight:8}
function vinterra:survival/comfort/shelter/raycast/cast_macro {yaw:"-135",pitch:"-35.264",weight:8}
function vinterra:survival/comfort/shelter/raycast/cast_macro {yaw:"-45",pitch:"-35.264",weight:8}

return 1