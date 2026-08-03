# vinterra:feedback/hud/render_macro
# Renders the Survival UI using the supplied vinterra:feedback hud storage compound
# Must be executed as the displayed player

$title @s actionbar [{text:"🌡",color:"$(warmth_color)"},{text:" $(warmth_name)",color:"$(warmth_color)"},{text:"   "},{text:"☂",color:"$(wetness_color)"},{text:" $(wetness_name)",color:"$(wetness_color)"},{text:"   "},{text:"🌨",color:"$(exposure_color)"},{text:" "},{text:"$(exposure_bar)",color:"$(exposure_color)"}]
