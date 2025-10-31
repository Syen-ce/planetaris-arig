if not mods["Igrys"] then return end

    data.extend({
        {
        type = "recipe",
        name = "planetaris-glass-panel-to-igrys-glass",
        category = "crafting",
        enabled = false,
        energy_required = 2,
        icon = "__Igrys__/Assets/Items/glass.png",
        localised_name = {"", {"item-name.igrys-glass"}, " (", {"space-location-name.arig"}, ")"},
        ingredients =
        {
        {type = "item", name = "planetaris-glass-panel", amount = 1},
        {type = "item", name = "stone", amount = 10},
        },
        results = {{type="item", name="igrys-glass", amount=1}},
        main_product = "igrys-glass",
        allow_productivity = false
        },
        {
        type = "recipe",
        name = "igrys-glass-to-planetaris-glass-panel",
        category = "crafting-with-fluid",
        enabled = false,
        energy_required = 2,
        icon = "__planetaris-arig__/graphics/icons/glass-panel.png",
        localised_name = {"", {"item-name.planetaris-glass-panel"}, " (", {"space-location-name.igrys"}, ")"},
        ingredients =
        {
        {type = "fluid", name = "planetaris-pure-sand", amount = 10},
        {type = "item", name = "igrys-glass", amount = 1},
        },
        results = {{type="item", name="planetaris-glass-panel", amount=1}},
        main_product = "planetaris-glass-panel",
        allow_productivity = false
        },
    })

    table.insert(data.raw["technology"]["planetaris-glass"].effects,
        {
          type = "unlock-recipe",
          recipe = "planetaris-glass-panel-to-igrys-glass"
        }
      )
    table.insert(data.raw["technology"]["planetaris-glass"].effects,
        {
          type = "unlock-recipe",
          recipe = "igrys-glass-to-planetaris-glass-panel"
        }
      )