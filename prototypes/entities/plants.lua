local util = require('util')
local sounds = require("__base__.prototypes.entity.sounds")
local tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")
local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local decorative_trigger_effects = require("__base__/prototypes/decorative/decorative-trigger-effects")

local seconds = 60
local minutes = 60*seconds

local plant_emissions = { pollution = -0.001 }
local plant_harvest_emissions = { spores = 15 }
local plant_flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"}

local gleba_tree_static_influence = -0.8
local gleba_tree_probability_multiplier = 0.3

local leaf_sound = sounds.tree_leaves
local spoilage_sound = sound_variations("__space-age__/sound/mining/spoilage", 3, 0) --at zero vol until the correct particle fx are in place

local cactus_rescale = 1.2

---
 data.extend({
       {
      name = "planetaris-cactus-plant",
      type = "plant",
      flags = plant_flags,
      icon = "__planetaris-arig__/graphics/icons/small-cactus.png",
      subgroup = "grass",
      order = "b[decorative]-z-b",
      map_color = {0.19, 0.39, 0.19, 0.40},
      agricultural_tower_tint =
      {
        primary = {r = 0.7, g =  1.0, b = 0.2,a =  1},
        secondary = {r = 0.561, g = 0.613, b = 0.308, a = 1.000}, -- #8f4f4eff
      },
      hidden_in_factoriopedia = false,
      collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
      selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
      collision_mask = {layers = {water_tile = true, player = true}},
      walking_sound = tile_sounds.walking.big_bush,
      damaged_trigger_effect = hit_effects.rock(),
      dying_trigger_effect = decorative_trigger_effects.big_rock(),
      mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-boompuff", 5, 0.6),
      render_layer = "object",
      max_health = 100,
      autoplace =
      {
        order = "a[doodad]-i[fluff]-a",
        probability_expression = "plateau_level * (-2.6 + rpi(0.2) + (garballo_noise + 1 - min(0, decorative_knockout)) + 0.5)",
        tile_restriction =
        {
          "planetaris-sandstone-1", "planetaris-sandstone-2", "planetaris-sandstone-3",
          "planetaris-arig-rock",
        }
        -- local_expressions =
        -- {
        --   region_box = "min(range_select{input = moisture, from = 0.2, to = 1, slope = 0.05, min = -10, max = 1},\z
        --                     range_select{input = temperature, from = 3, to = 50, slope = 0.5, min = -10, max = 1})"
        -- }
      },
      minable =
      {
        mining_particle = "wooden-particle",
        mining_time = 0.5,
        results = {{type = "item", name = "planetaris-cactus", amount = 5},
                  {type = "fluid", name = "water", amount = 1500}},
      },
      variation_weights = { 1, 1, 1, 1, 1, 1, 1, 1, 0.3, 0.3, 1},
      growth_ticks = 5 * minutes,
      surface_conditions =     {
        {
          property = "planetaris-dust-concentration",
          min = 50,
          max = 100,
        }
      },
      pictures =
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
    },
})