local planetaris_tile_collision_masks = {}

data.extend({
    {
    type = "collision-layer",
    name = "deepsea",
    },
})

planetaris_tile_collision_masks.deep_ammoniacal_ocean = function()
  return
  {layers={
    water_tile=true,
    --resource=true,
    item=true,
    player=true,
    doodad=true,
    floor=true,
    ["deepsea"] = true,
  }}
end

planetaris_tile_collision_masks.deep_water = function()
  return
  {layers={
    water_tile=true,
    resource=true,
    item=true,
    player=true,
    doodad=true,
    floor=true,
    ["deepsea"] = true,
  }}
end

planetaris_tile_collision_masks.oil_ocean_deep = function()
  return
  {layers={
    -- Same as above but with rail-support-layer.
    water_tile=true,
    resource=true,
    rail_support=true,
    ["deepsea"] = true,
  }}
end

return planetaris_tile_collision_masks