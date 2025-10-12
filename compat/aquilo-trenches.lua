if not mods["AquiloTrenches"] then return end

data.raw.tile["aquilo-trench"].collision_mask = {layers={
    water_tile=true,
    resource=true,
    item=true,
    player=true,
    doodad=true,
    floor=true,
    ["deepsea"] = true,
    ["aquilo_trench"] = true,
  }}