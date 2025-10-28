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