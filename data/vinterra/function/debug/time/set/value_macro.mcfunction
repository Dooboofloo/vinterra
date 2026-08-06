# vinterra:debug/time/set/value_macro
# Macro debug function to set the vin time based on the passed value
# Usage: function vinterra:debug/time/set/value_macro {value:N}

$scoreboard players set #time vin.time $(value)
return run function vinterra:world/time/synchronize