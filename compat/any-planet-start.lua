local utils = require("__any-planet-start__.utils")

data.raw.technology["planetslib-arig-cargo-drops"].enabled = true

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