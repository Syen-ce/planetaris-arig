local utils = require("__any-planet-start__.utils")

data.raw.technology["planetslib-arig-cargo-drops"].enabled = true

data.raw.technology["electronics"].prerequisites = {"planetaris-sand-sifting"}
data.raw.technology["steam-power"].prerequisites = {"planetaris-sand-sifting"}

data.raw.technology["steel-processing"].research_trigger = {
        type = "craft-item",
        item = "iron-plate",
        count = 75
      }
data.raw.technology["steel-processing"].unit = nil
data.raw.technology["steel-processing"].prerequisites = {"planetaris-sand-sifting"}
table.insert(data.raw.technology["steel-processing"].effects,{
          type = "unlock-recipe",
          recipe = "planetaris-small-electric-pole"
    })
table.insert(data.raw.technology["steel-processing"].effects,{
          type = "unlock-recipe",
          recipe = "barrel"
    })

data.raw.technology["automation-2"].prerequisites = {"automation", "steel-processing"}
data.raw.technology["automation-2"].unit =
    {
      count = 100,
      ingredients = {{"automation-science-pack", 1}},
      time = 15
    }

data.raw.technology["solar-energy"].prerequisites = {"steel-processing", "electronics"}
data.raw.technology["solar-energy"].research_trigger = {
        type = "craft-item",
        item = "electronic-circuit",
        count = 50
      }
data.raw.technology["solar-energy"].unit = nil

data.raw.technology["oil-processing"].effects = {
      {
        type = "unlock-recipe",
        recipe = "oil-refinery"
      },
      {
        type = "unlock-recipe",
        recipe = "chemical-plant"
      },
      {
        type = "unlock-recipe",
        recipe = "basic-oil-processing"
      },
      {
        type = "unlock-recipe",
        recipe = "heavy-oil-cracking"
      },
      {
        type = "unlock-recipe",
        recipe = "light-oil-cracking"
      },
      {
        type = "unlock-recipe",
        recipe = "solid-fuel-from-petroleum-gas"
      }
    }

    data.raw.technology["oil-processing"].research_trigger =
    {
      type = "mine-entity",
      entity = "heavy-oil-geyser"
    }

    data:extend({
          {
    type = "recipe",
    name = "planetaris-small-electric-pole",
    localised_name = {"", {"entity-name.small-electric-pole"}, " (", {"space-location-name.arig"}, ")"},
    enabled = false,
    ingredients =
    {
      {type = "item", name = "steel-plate", amount = 1},
      {type = "item", name = "copper-cable", amount = 2}
    },
    results = {{type="item", name="small-electric-pole", amount=2}}
  },
    })