if not mods["wood-industry"] then return end
    
if settings.startup["alloy-smelting-coke"].value then
    data.extend({
    {
    type = "recipe",
    name = "heavy-oil-to-charcoal",
    category = "chemistry",
    enabled = false,
    energy_required = 2,
    icon = "__wood-industry__/graphics/icons/charcoal.png",
    localised_name = {"", {"item-name.charcoal"}, " (", {"space-location-name.arig"}, ")"},
    ingredients =
    {
      {type = "fluid", name = "heavy-oil", amount = 10},
      {type = "item", name = "coke", amount = 2},
    },
    results = {{type="item", name="charcoal", amount=1}},
    surface_conditions =
    {
      {
        property = "planetaris-dust-concentration",
        min = 50,
        max = 100,
      },
    },
    allow_productivity = true
    }
    })

    table.insert(data.raw["technology"]["advanced-oil-processing"].effects,
        {
          type = "unlock-recipe",
          recipe = "heavy-oil-to-charcoal"
        })
end

--------------------------------- Hyarion
    data.extend({
        {
        type = "recipe",
        name = "planetaris-lig-carbon-wood",
        category = "sifting",
        enabled = false,
        auto_recycle = false,
        energy_required = 1,
        icon = "__base__/graphics/icons/wood.png",
        localised_name = {"", {"item-name.wood"}, " (", {"space-location-name.hyarion"}, ")"},
        ingredients =
        {
        {type = "item", name = "carbon", amount = 2},
        },
        results = {{type="item", name="wood", amount=5}},
        allow_productivity = false
        },
    })

    table.insert(data.raw["technology"]["planetaris-metallic-ore-processing"].effects,
        {
          type = "unlock-recipe",
          recipe = "planetaris-lig-carbon-wood"
        }
      )

--- Resin

    data.extend({
        {
        type = "recipe",
        name = "planetaris-wood-coke-sifting",
        category = "sifting",
        subgroup = "hyarion-basic-processes",
        order = "a-a-e",
        enabled = false,
        auto_recycle = false,
        energy_required = 10,
        icon = data.raw["item"]["coke"].icon,
        localised_name = {"", {"item-name.coke"}, " (", {"space-location-name.hyarion"}, ")"},
        surface_conditions =
        {
          {
            property = "planetaris-crystalization-resistance",
            min = 50,
            max = 100,
          }
        },
        ingredients =
        {
        {type = "item", name = "carbon", amount = 1},
        },
        results = {{type="item", name="coke", amount=2}},
        allow_productivity = true,
        crafting_machine_tint = {primary = {0.2, 0.2, 0.2, 1}, secondary = {0.2, 0.2, 0.2, 1}},
        },
        {
        type = "recipe",
        name = "planetaris-wood-resin",
        category = data.raw["item"]["resin"].category,
        subgroup = "hyarion-basic-processes",
        order = "a-a-e-b",
        enabled = false,
        auto_recycle = false,
        energy_required = 10,
        icon = data.raw["item"]["resin"].icon,
        localised_name = {"", {"item-name.resin"}, " (", {"space-location-name.hyarion"}, ")"},
        surface_conditions =
        {
          {
            property = "planetaris-crystalization-resistance",
            min = 50,
            max = 100,
          }
        },
        ingredients =
        {
        {type = "item", name = "wood", amount = 3},
        {type = "item", name = "coke", amount = 1},
        {type = "item", name = "planetaris-raw-quartz", amount = 1},
        },
        results = {{type="item", name="resin", amount=2}},
        allow_productivity = true,
        crafting_machine_tint = {primary = {1, 0.808, 0.435, 1}, secondary = {1, 0.808, 0.435, 1}},
        },
    })

    table.insert(data.raw["technology"]["planetaris-metallic-ore-processing"].effects,
        {
          type = "unlock-recipe",
          recipe = "planetaris-wood-coke-sifting"
        }
    )

    table.insert(data.raw["technology"]["planetaris-metallic-ore-processing"].effects,
        {
          type = "unlock-recipe",
          recipe = "planetaris-wood-resin"
        }
    )