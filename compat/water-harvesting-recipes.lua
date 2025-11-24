if mods["planetaris-hyarion"] then
    data.extend{(
    {
      type = "recipe",
      name = "planetaris-hyarion-water-harvesting",
      localised_name = {"", {"space-location-name.hyarion"}, " ", {"recipe-name.planetaris-water-harvesting"}},
      category = "water-production",
      subgroup = "water-harvesting",
      order = "a-d[fulgora]-a",
      icons = {
        {icon="__planetaris-hyarion__/graphics/icons/planet-hyarion.png", draw_background=true},
        {icon="__base__/graphics/icons/fluid/water.png", shift={8, 12}, scale=0.5},
      },
      surface_conditions =
      {
        {
          property = "planetaris-crystalization-resistance",
          min = 50,
          max = 100,
        }
      },
      energy_required = 10,
      enabled = false,
      ingredients = nil,
      results = {{type="fluid", name="water", amount=150}},
      allow_productivity = true
    }
    )}

    table.insert(data.raw["technology"]["planetaris-water-harvesting"].effects,
        {
          type = "unlock-recipe",
          recipe = "planetaris-hyarion-water-harvesting"
        })
end

if mods["pelagos"] then
    data.extend{(
    {
      type = "recipe",
      name = "planetaris-pelagos-water-harvesting",
      localised_name = {"", {"space-location-name.pelagos"}, " ", {"recipe-name.planetaris-water-harvesting"}},
      category = "water-production",
      subgroup = "water-harvesting",
      order = "a-e[gleba]-a",
      icons = {
        {icon="__pelagos__/graphics/pelagos.png", draw_background=true},
        {icon="__base__/graphics/icons/fluid/water.png", shift={8, 12}, scale=0.5},
      },
      surface_conditions =
      {
        {
          property = "pressure",
          min = 1809,
          max = 1809,
        },
        {
          property = "gravity",
          min = 18.09,
          max = 18.09,
        },
      },
      energy_required = 10,
      enabled = false,
      ingredients = nil,
      results = {{type="fluid", name="water", amount=150}},
      allow_productivity = true
    }
    )}

    table.insert(data.raw["technology"]["planetaris-water-harvesting"].effects,
        {
          type = "unlock-recipe",
          recipe = "planetaris-pelagos-water-harvesting"
        })
end