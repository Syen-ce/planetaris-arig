local util = require('util')
local sounds = require("__base__.prototypes.entity.sounds")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")

local seconds = 60
local minutes = 60*seconds

local plant_emissions = { pollution = -0.001 }
local plant_harvest_emissions = { spores = 15 }
local plant_flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"}

local gleba_tree_static_influence = -0.8
local gleba_tree_probability_multiplier = 0.3

local leaf_sound = sounds.tree_leaves
local spoilage_sound = sound_variations("__space-age__/sound/mining/spoilage", 3, 0) --at zero vol until the correct particle fx are in place

local cactus_rescale = 1.5

---


local cactus_plant = util.table.deepcopy(data.raw["simple-entity"]["arig-small-cactus-plant"])
cactus_plant.type = "plant"
cactus_plant.name = "planetaris-cactus-plant"
cactus_plant.flags = plant_flags
cactus_plant.hidden_in_factoriopedia = false
cactus_plant.factoriopedia_alternative = nil
cactus_plant.map_color = {0.19, 0.39, 0.19, 0.40}
cactus_plant.agricultural_tower_tint =
{
  primary = {r = 0.7, g =  1.0, b = 0.2,a =  1},
  secondary = {r = 0.561, g = 0.613, b = 0.308, a = 1.000}, -- #8f4f4eff
}
cactus_plant.minable =
{
  mining_particle = "wooden-particle",
  mining_time = 0.5,
  results = {{type = "item", name = "planetaris-cactus", amount = 5}},
}
cactus_plant.variation_weights = { 1, 1, 1, 1, 1, 1, 1, 1, 0.3, 0.3, 1}
cactus_plant.growth_ticks = 5 * minutes
cactus_plant.surface_conditions =     {
      {
        property = "planetaris-dust-concentration",
        min = 50,
        max = 100,
      }
    }
cactus_plant.pictures =
      {
        --cactus
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-1.png",
          priority = "extra-high",
          width = 92,
          height = 61,
          shift = util.by_pixel(3, -1.75),
          scale = 0.5 * cactus_rescale
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-2.png",
          priority = "extra-high",
          width = 92,
          height = 61,
          shift = util.by_pixel(2.75, 0),
          scale = 0.5 * cactus_rescale
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-3.png",
          priority = "extra-high",
          width = 92,
          height = 90,
          shift = util.by_pixel(2.75, 0),
          scale = 0.5 * cactus_rescale
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-4.png",
          priority = "extra-high",
          width = 92,
          height = 90,
          shift = util.by_pixel(12, -8),
          scale = 0.5 * cactus_rescale
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-5.png",
          priority = "extra-high",
          width = 92,
          height = 90,
          shift = util.by_pixel(25, -20),
          scale = 1 * cactus_rescale
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-6.png",
          priority = "extra-high",
          width = 92,
          height = 90,
          shift = util.by_pixel(25, -20),
          scale = 1 * cactus_rescale
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-7.png",
          priority = "extra-high",
          width = 92,
          height = 90,
          shift = util.by_pixel(25, -20),
          scale = 1 * cactus_rescale
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-8.png",
          priority = "extra-high",
          width = 92,
          height = 90,
          shift = util.by_pixel(25, -20),
          scale = 1 * cactus_rescale
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-9.png",
          priority = "extra-high",
          width = 92,
          height = 90,
          shift = util.by_pixel(15, -20),
          scale = 0.8 * cactus_rescale
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-10.png",
          priority = "extra-high",
          width = 92,
          height = 90,
          shift = util.by_pixel(25, -20),
          scale = 1 * cactus_rescale
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-11.png",
          priority = "extra-high",
          width = 92,
          height = 90,
          shift = util.by_pixel(30, -20),
          scale = 1 * cactus_rescale
        },
      }
cactus_plant.autoplace =
{
  probability_expression = 0,
  -- required to show agricultural tower plots
  tile_restriction =
  {
    "planetaris-sandstone-1", "planetaris-sandstone-2", "planetaris-sandstone-3",
    "planetaris-arig-rock",
  }
}

data:extend({cactus_plant})