for _, surface in pairs(game.surfaces) do
  if surface.planet and surface.planet.name == "arig" then
    -- Reset map gen settings to ensure controls have proper values
    local settings = surface.map_gen_settings
    settings.autoplace_controls = settings.autoplace_controls or {}
    settings.autoplace_controls["arig_sand"] = settings.autoplace_controls["arig_sand"] or {}
    settings.autoplace_controls["arig_sand"].size = settings.autoplace_controls["arig_sand"].size or 1
    settings.autoplace_controls["arig_sand"].frequency = settings.autoplace_controls["arig_sand"].frequency or 1

    settings.elevation = settings.elevation or"terraced_elevation"
    settings.cliffiness = settings.cliffiness or "terraced_cliffiness"
    settings.cliff_elevation = settings.cliff_elevation or "cliff_elevation_from_elevation"
    
    surface.map_gen_settings = settings
  end
end