local utils = require("__any-planet-start__.utils")

if data.raw.technology["planetslib-arig-cargo-drops"] then
  data.raw.technology["planetslib-arig-cargo-drops"].research_trigger = {type = "create-space-platform"}
  data.raw.technology["planetslib-arig-cargo-drops"].prerequisites = {"rocket-silo"}
end

table.insert(data.raw.technology["planetaris-sand-sifting"].effects, {
          type = "unlock-recipe",
          recipe = "planetaris-pure-sand-venting"
        })

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

data.raw.technology["planetaris-glass"].prerequisites = {"planetaris-sand-sifting", "automation-2"}
data.raw.technology["planetaris-compression"].prerequisites = {"planetaris-glass"}
data.raw.technology["condensing-agricultural-tower"].prerequisites = {"planetaris-glass"}

data.raw.technology["planetaris-advanced-heavy-oil-cracking"].prerequisites = {"oil-gathering"}

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
      },
      {
        type = "unlock-recipe",
        recipe = "steam-condensation"
      },
    }

    data.raw.technology["oil-processing"].research_trigger =
    {
      type = "mine-entity",
      entities = {"heavy-oil-geyser"}
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
  {
        type = "recipe",
        name = "planetaris-pure-sand-venting",
        icons = {
          {icon="__planetaris-arig__/graphics/icons/fluid/pure-sand.png", draw_background=true },
          {icon="__planetaris-arig__/graphics/icons/sifter.png", shift={12, 12}, scale=0.4},
        },
        icon_size = 64,
        categories = {"sifting"},
        subgroup = "arig-processes",
        order = "a[sand-processing]-a[sifting]-d",
        enabled = false,
        auto_recycle = false,
        energy_required = 2,
        ingredients = {{type = "fluid", name = "planetaris-pure-sand", amount = 50}},
        results = nil,
        allow_productivity = false,
      },
    })