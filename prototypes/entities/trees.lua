local util = require('util')
local sounds = require("__base__.prototypes.entity.sounds")
local simulations = require("prototypes.factoriopedia-simulations")

local pointy_crystal = {
      {
        filename = "__planetaris-unbounded-assets__/graphics/entity/hyarion-pointed-crystal/hyarion-pointed-crystal-1.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = {0 , -0.5},
        scale = 0.8,
      },
            {
        filename = "__planetaris-unbounded-assets__/graphics/entity/hyarion-pointed-crystal/hyarion-pointed-crystal-2.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = {0 , -0.5},
        scale = 0.8,
      },
            {
        filename = "__planetaris-unbounded-assets__/graphics/entity/hyarion-pointed-crystal/hyarion-pointed-crystal-3.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = {0 , -0.5},
        scale = 0.8,
      },
            {
        filename = "__planetaris-unbounded-assets__/graphics/entity/hyarion-pointed-crystal/hyarion-pointed-crystal-4.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = {0 , -0.5},
        scale = 0.8,
      },
            {
        filename = "__planetaris-unbounded-assets__/graphics/entity/hyarion-pointed-crystal/hyarion-pointed-crystal-5.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = {0 , -0.5},
        scale = 0.8,
      },
            {
        filename = "__planetaris-unbounded-assets__/graphics/entity/hyarion-pointed-crystal/hyarion-pointed-crystal-6.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = {0 , -0.5},
        scale = 0.8,
      },
            {
        filename = "__planetaris-unbounded-assets__/graphics/entity/hyarion-pointed-crystal/hyarion-pointed-crystal-7.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = {0 , -0.5},
        scale = 0.8,
      },
            {
        filename = "__planetaris-unbounded-assets__/graphics/entity/hyarion-pointed-crystal/hyarion-pointed-crystal-8.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = {0 , -0.5},
        scale = 0.8,
      },
            {
        filename = "__planetaris-unbounded-assets__/graphics/entity/hyarion-pointed-crystal/hyarion-pointed-crystal-9.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = {0 , -0.5},
        scale = 0.8,
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/entity/hyarion-pointed-crystal/hyarion-pointed-crystal-10.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = {0 , -0.5},
        scale = 0.8,
      },
}

data:extend(
{
  {
    type = "tree",
    name = "hyarion-pointy-crystal",
    icon = "__planetaris-unbounded-assets__/graphics/icons/pointy-crystal.png",
    flags = {"placeable-neutral", "placeable-off-grid", "breaths-air"},
    minable =
    {
      mining_particle = "wooden-particle",
      mining_time = 0.5,
      results =
      {
        {type = "item", name = "planetaris-raw-quartz", amount_min = 15, amount_max = 25},
      }
    },
    mining_sound = sound_variations("__space-age__/sound/mining/axe-mining-ashland-lichen-tree", 5, 0.4),
    mined_sound = sound_variations("__space-age__/sound/mining/mined-ashland-lichen-tree", 5, 0.4),
    --corpse = "hyarion-pointy-crystal-mined",
    --remains_when_mined = "hyarion-pointy-crystal-mined",
    max_health = 50,
    collision_box = {{-1, -1}, {1, 1}},
    selection_box = {{-1, -1}, {1, 1}},
    subgroup = "trees",
    order = "a[tree]-h[hyarion]-a",
    impact_category = "tree",
    factoriopedia_simulation = simulations.factoriopedia_hyarion_pointy_crystal,
    map_color = {r = 256/256, g = 256/256, b = 256/256, a = 1.000},
    autoplace =
    {
      order = "b[tree]-b[normal]",
      --control = "trees", -- makes it appear on Nauvis
      probability_expression = "vulcanus_tree"
    },
    remove_decoratives = "true",
    pictures = pointy_crystal,
  },
  {
    type = "corpse",
    name = "hyarion-pointy-crystal-mined",
    localised_name = {"entity-name.tree-stump"},
    --icon = "__base__/graphics/icons/" .. type_name .. "-stump.png",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    hidden_in_factoriopedia = true,
    icon = "__space-age__/graphics/icons/ashland-lichen-tree.png",
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    final_render_layer = "remnants",
    subgroup = "remnants",
    order="d[remnants]-b[tree]-z",
    animation =
    {
      layers =
        {
          util.sprite_load("__planetaris-unbounded-assets__/graphics/decorative/hyarion-chimney/metallic-chimney-truncated-upper", { scale = 0.5, variation_count = 6,multiply_shift=0.5}),
          util.sprite_load("__planetaris-unbounded-assets__/graphics/decorative/hyarion-chimney/metallic-chimney-truncated-shadow", { scale = 0.5, variation_count = 6,multiply_shift=0.5,draw_as_shadow=true}),
        }
    }
  }
})