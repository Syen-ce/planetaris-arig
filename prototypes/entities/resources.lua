local resource_autoplace = require("resource-autoplace")
local base_tile_sounds = require("__base__.prototypes.tile.tile-sounds")
local simulations = require("prototypes.factoriopedia-simulations")

resource_autoplace.initialize_patch_set("petroleum-gas", false)


local function resource(resource_parameters, autoplace_parameters)
  return
  {
    type = "resource",
    name = resource_parameters.name,
    icon = "__planetaris-arig__/graphics/icons/" .. resource_parameters.name .. ".png",
    flags = {"placeable-neutral"},
    order="a-b-"..resource_parameters.order,
    tree_removal_probability = 0.8,
    tree_removal_max_distance = 32 * 32,
    minable = resource_parameters.minable or
    {
      mining_particle = resource_parameters.name .. "-particle",
      mining_time = resource_parameters.mining_time,
      result = resource_parameters.name
    },
    category = resource_parameters.category,
    subgroup = resource_parameters.subgroup,
    walking_sound = resource_parameters.walking_sound,
    collision_mask = resource_parameters.collision_mask,
    collision_box = {{-0.1, -0.1}, {0.1, 0.1}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    resource_patch_search_radius = resource_parameters.resource_patch_search_radius,
    autoplace = autoplace_parameters.probability_expression ~= nil and
    {
      --control = resource_parameters.name,
      order = resource_parameters.order,
      probability_expression = autoplace_parameters.probability_expression,
      richness_expression = autoplace_parameters.richness_expression
    }
    or resource_autoplace.resource_autoplace_settings
    {
      name = resource_parameters.name,
      order = resource_parameters.order,
      autoplace_control_name = resource_parameters.autoplace_control_name,
      base_density = autoplace_parameters.base_density,
      base_spots_per_km = autoplace_parameters.base_spots_per_km2,
      regular_rq_factor_multiplier = autoplace_parameters.regular_rq_factor_multiplier,
      starting_rq_factor_multiplier = autoplace_parameters.starting_rq_factor_multiplier,
      candidate_spot_count = autoplace_parameters.candidate_spot_count,
      tile_restriction = autoplace_parameters.tile_restriction
    },
    stage_counts = {15000, 9500, 5500, 2900, 1300, 400, 150, 80},
    stages =
    {
      sheet =
      {
        filename = "__planetaris-arig__/graphics/entity/" .. resource_parameters.name .. "/" .. resource_parameters.name .. ".png",
        priority = "extra-high",
        size = 128,
        frame_count = 8,
        variation_count = 8,
        scale = 0.5
      }
    },
    map_color = resource_parameters.map_color,
    mining_visualisation_tint = resource_parameters.mining_visualisation_tint,
    factoriopedia_simulation = resource_parameters.factoriopedia_simulation
  }
end

data:extend ({
    {
        type = "resource",
        name = "heavy-oil-geyser",
        icon = "__planetaris-arig__/graphics/icons/heavy-oil-resource.png",
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
        walking_sound = base_tile_sounds.walking.oil({}),
        driving_sound = base_tile_sounds.driving.oil,
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
          sheet = util.sprite_load("__planetaris-arig__/graphics/entity/heavy-oil/heavy-oil",
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
            animation = util.sprite_load("__planetaris-arig__/graphics/entity/heavy-oil/heavy-oil-animation",
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
              filename = "__planetaris-arig__/graphics/entity/heavy-oil/oil-smoke-outer.png",
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
              filename = "__planetaris-arig__/graphics/entity/heavy-oil/oil-smoke-inner.png",
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