if not mods["bzcarbon"] then return end

---------------------Add a graphite route to Arig

data:extend({
  {
    type = "recipe",
    name = "planetaris-graphite",
    icons = {
      {icon = "__planetaris-arig__/graphics/icons/press.png", icon_size = 64, scale = 0.5, draw_background = true},
      {icon = "__bzcarbon__/graphics/icons/graphite.png", icon_size = 128, shift = {12, 12}, scale = 0.3},
    },
    localised_name = {"", {"item-name.graphite"}, " (", {"technology-name.planetaris-compression"}, ")"},
    localised_description = {"item-description.graphite"},
    category = "compressing",
    subgroup = "arig-processes",
    order = "d[graphite]",
    auto_recycle = false,
    enabled = false,
    energy_required = 2,
    ingredients =
    {
      {type = "item", name = "carbon", amount = 1},
    },
    results = {{type = "item", name = "graphite", amount = 1}},
    allow_productivity = true,
  },
})

table.insert(data.raw.technology["planetaris-compression"].effects,
    {type = "unlock-recipe", recipe = "planetaris-graphite"})
