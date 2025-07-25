local resource_autoplace = require("resource-autoplace")
local tile_sounds = require("__base__/prototypes/tile/tile-sounds")

resource_autoplace.initialize_patch_set("petroleum-gas", false)

data:extend ({
    {
        type = "resource",
        name = "heavy-oil-geyser",
        icon = "__planetaris-unbounded__/graphics/icons/heavy-oil-resource.png",
        flags = {"placeable-neutral"},
        category = "basic-fluid",
        subgroup = "mineable-fluids",
        order="a-b-a",
        infinite = true,
        highlight = true,
        minimum = 60000,
        normal = 300000,
        infinite_depletion_amount = 10,
        resource_patch_search_radius = 12,
        tree_removal_probability = 0.7,
        tree_removal_max_distance = 32 * 32,
        minable =
        {
          mining_time = 1,
          results =
          {
            {
              type = "fluid",
              name = "heavy-oil",
              amount_min = 10,
              amount_max = 10,
              probability = 1
            }
          }
        },
        walking_sound = tile_sounds.walking.oil({}),
        driving_sound = tile_sounds.driving.oil,
        collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
        selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
        autoplace = resource_autoplace.resource_autoplace_settings
        {
          name = "heavy-oil-geyser",
          order = "c", -- Other resources are "b"; oil won't get placed if something else is already there.
          base_density = 8.2,
          base_spots_per_km2 = 1.8,
          random_probability = 1/48,
          random_spot_size_minimum = 1,
          random_spot_size_maximum = 1, -- don't randomize spot size
          additional_richness = 220000, -- this increases the total everywhere, so base_density needs to be decreased to compensate
          has_starting_area_placement = false,
          regular_rq_factor_multiplier = 1
        },
        stage_counts = {0},
        stages =
        {
          sheet = util.sprite_load("__planetaris-unbounded__/graphics/entity/heavy-oil/heavy-oil",
          {
            priority = "extra-high",
            scale = 0.5,
            variation_count = 1,
            frame_count = 4,
          })
        },
        draw_stateless_visualisation_under_building = false,
        stateless_visualisation =
        {
          {
            count = 1,
            render_layer = "decorative",
            animation = util.sprite_load("__planetaris-unbounded__/graphics/entity/heavy-oil/heavy-oil-animation",
            {
              priority = "extra-high",
              scale = 0.5,
              frame_count = 32,
              animation_speed = 0.2,
            })
          },
          {
            count = 1,
            render_layer = "smoke",
            animation = {
              filename = "__planetaris-unbounded__/graphics/entity/heavy-oil/oil-smoke-outer.png",
              frame_count = 47,
              line_length = 16,
              width = 90,
              height = 188,
              animation_speed = 0.3,
              shift = util.by_pixel(-2, 24 -152),
              scale = 1.5,
              tint = util.multiply_color({r=0.3, g=0.3, b=0.3}, 0.2)
            }
          },
          {
            count = 1,
            render_layer = "smoke",
            animation = {
              filename = "__planetaris-unbounded__/graphics/entity/heavy-oil/oil-smoke-inner.png",
              frame_count = 47,
              line_length = 16,
              width = 40,
              height = 84,
              animation_speed = 0.3,
              shift = util.by_pixel(0, 24 -78),
              scale = 1.5,
              tint = util.multiply_color({r=0.4, g=0.4, b=0.4}, 0.2)
            }
          }
        },
        map_color = {160, 62, 22},
        map_grid = false
      },
})