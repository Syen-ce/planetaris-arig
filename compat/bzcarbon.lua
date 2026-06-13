if not mods["bzcarbon"] then return end

---------------------Add a graphite route to Arig
---
local arig_crash = data.raw["simple-entity"]["arig-big-sand-rock"].minable.results
table.insert(arig_crash,
    {type = "item", name = "flake-graphite", amount_min = 19, amount_max = 25})

local arig_crash = data.raw["simple-entity"]["arig-crash"].minable.results
table.insert(arig_crash,
    {type = "item", name = "graphite", amount_min = 2, amount_max = 8})

local planetaris_sand_sifting = data.raw["recipe"]["planetaris-sand-sifting"].results
table.insert(planetaris_sand_sifting,
    {type = "item", name = "flake-graphite", amount = 1, probability = 0.02, show_details_in_recipe_tooltip = false})

data:extend({
{
    type = "recipe",
    name = "planetaris-flake-graphite",
    icons = {
      {icon = "__planetaris-arig__/graphics/icons/sifter.png", icon_size = 64, scale = 0.5, draw_background = true},
      {icon = "__bzcarbon__/graphics/icons/flake-graphite.png", icon_size = 128, shift = {12, 12}, scale = 0.3},
    },
    localised_name = {"", {"item-name.flake-graphite"}, " (", {"technology-name.planetaris-compression"}, ")"},
    localised_description = {"item-description.graphite"},
    category = "sifting",
    subgroup = "arig-processes",
    order = "d[graphite]",
    auto_recycle = false,
    enabled = false,
    energy_required = 2,
    ingredients =
    {
      {type = "item", name = "flake-graphite", amount = 5},
    },
    results = {
      {type = "item", name = "graphite", amount = 1},
      {type = "item", name = "coal", amount = 1},
    },
    allow_productivity = true,
  },
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
  {
    type = "recipe",
    name = "planetaris-compression-bz-diamond",
    icons = {
      {icon = "__planetaris-arig__/graphics/icons/press.png", icon_size = 64, scale = 0.5, draw_background = true},
      {icon = "__bzcarbon__/graphics/icons/diamond.png", icon_size = 128, shift = {12, 12}, scale = 0.3},
    },
    localised_name = {"", {"item-name.diamond"}, " (", {"technology-name.planetaris-compression"}, ")"},
    localised_description = {"item-description.diamond"},
    category = "compressing",
    subgroup = "arig-processes",
    order = "d[graphite]-z-a",
    auto_recycle = false,
    enabled = false,
    energy_required = 2,
    ingredients =
    {
      {type = "item", name = "graphite", amount = 20},
    },
    results = {{type = "item", name = "diamond", amount = 1}},
    allow_productivity = true,
  },
})

PlanetarisLib.add_tech_unlock("planetaris-sand-sifting", "planetaris-flake-graphite")
PlanetarisLib.add_tech_unlock("planetaris-compression", "planetaris-graphite")
PlanetarisLib.add_tech_unlock("planetaris-compression", "planetaris-compression-bz-diamond")

PlanetarisLib.convert_recipe_ingredient("planetaris-raw-diamond", "carbon", "graphite")

PlanetarisLib.add_recipe_surface_condition("synthetic-diamond", "planetaris-dust-concentration", 49)