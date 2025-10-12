local utils = require("__any-planet-start__.utils")

data.raw.technology["planetslib-hyarion-cargo-drops"].enabled = true

data.raw.technology["steel-processing"].research_trigger = {
        type = "craft-item",
        item = "iron-plate",
        count = 75
      }
data.raw.technology["steel-processing"].unit = nil
data.raw.technology["steel-processing"].prerequisites = nil
table.insert(data.raw.technology["steel-processing"].effects, {
          type = "unlock-recipe",
          recipe = "planetaris-small-electric-pole"
    })

data.raw.technology["solar-energy"].prerequisites = {"steel-processing", "electronics"}
data.raw.technology["solar-energy"].research_trigger = {
        type = "craft-item",
        item = "electronic-circuit",
        count = 50
      }
data.raw.technology["solar-energy"].unit = nil

-- Add sifter to progression
table.insert(data.raw.technology["planetaris-metallic-ore-processing"].effects, {
        type = "unlock-recipe",
        recipe = "planetaris-sifter"
      })



    data:extend({
          {
    type = "recipe",
    name = "planetaris-small-electric-pole",
    localised_name = {"", {"entity-name.small-electric-pole"}, " (", {"space-location-name.hyarion"}, ")"},
    enabled = false,
    ingredients =
    {
      {type = "item", name = "steel-plate", amount = 1},
      {type = "item", name = "copper-cable", amount = 2}
    },
    results = {{type="item", name="small-electric-pole", amount=2}}
  },
    })
