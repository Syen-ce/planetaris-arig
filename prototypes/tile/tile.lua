local item = require("__planetaris-unbounded__/prototypes/item")
require("__base__/prototypes/tile/tiles")

local sounds = require("__base__.prototypes.entity.sounds")
local base_sounds = require("__base__/prototypes/entity/sounds")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local space_age_tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_trigger_effects = require("__base__/prototypes/tile/tile-trigger-effects")
local tile_pollution = require("__base__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local patch_for_inner_corner_of_transition_between_transition = tile_graphics.patch_for_inner_corner_of_transition_between_transition

base_tiles_util = base_tiles_util or {}
water_tile_type_names = water_tile_type_names or {}
out_of_map_tile_type_names = out_of_map_tile_type_names or {}

default_transition_group_id = default_transition_group_id or 0
water_transition_group_id = water_transition_group_id or 1
out_of_map_transition_group_id = out_of_map_transition_group_id or 2



-- Sandstone

local sandstone_transitions =
{
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,

    background_layer_group = "water",
    background_layer_offset = -5,
    masked_background_layer_offset = 1,
    offset_background_layer_by_tile_layer = false,

    spritesheet = "__base__/graphics/terrain/water-transitions/sand.png",
    layout = tile_spritesheet_layout.transition_16_16_16_4_8_short,
    background_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-sand-mask.png",
      --tile_height = 2,
      inner_corner_tile_height = 2,
      outer_corner_tile_height = 2,
      side_tile_height = 2,
      u_transition_tile_height = 2,
      o_transition_count = 1
    },
    background_mask_layout = tile_spritesheet_layout.simple_white_mask
  },
  ground_to_out_of_map_transition
}
local sandstone_transitions_between_transitions =
{
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = water_transition_group_id,

    spritesheet = "__base__/graphics/terrain/water-transitions/sand-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0_only_u_tall,
    background_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-sand-to-land-mask.png",
      inner_corner_tile_height = 2,
      outer_corner_tile_height = 2,
      side_tile_height = 2,
      o_transition_count = 0
    },
    water_patch = patch_for_inner_corner_of_transition_between_transition,
  },
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__planetaris-unbounded__/graphics/terrain/out-of-map-transition/sandstone-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    overlay_enabled = false
  },
  {
    transition_group1 = water_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_group = "water",
    background_layer_offset = -5,
    masked_background_layer_offset = 1,
    offset_background_layer_by_tile_layer = false,

    spritesheet = "__planetaris-unbounded__/graphics/terrain/out-of-map-transition/sandstone-shore-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-sand-to-out-of-map-mask.png",
      o_transition_count = 0
    },
    background_mask_layout = tile_spritesheet_layout.simple_3_3_3_1_0_three_way_edge_mask,
    draw_simple_outer_corner_over_diagonal = false,
    apply_waving_effect_on_background_mask = true,
    waving_effect_time_scale = 0.15 * 0.09,
    water_patch = patch_for_inner_corner_of_transition_between_transition
  }
}

-- Sanstone foundation

local sandstone_foundation_transitions =
{
  {
    to_tiles = water_tile_type_names,
    transition_group = water_transition_group_id,

    spritesheet = "__planetaris-unbounded__/graphics/terrain/sandstone-foundation/sandstone.png",
    layout = tile_spritesheet_layout.transition_8_8_8_2_4,
    background_enabled = false,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-mask.png",
      o_transition_count = 1
    }
  },
  ground_to_out_of_map_transition,
}

local sandstone_foundation_transitions_between_transitions =
{
  {
    transition_group1 = default_transition_group_id,
    transition_group2 = water_transition_group_id,
    spritesheet = "__planetaris-unbounded__/graphics/terrain/sandstone-foundation/sandstone-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    background_enabled = false,
    effect_map_layout = {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-land-mask.png",
      o_transition_count = 0
    },
    water_patch = patch_for_inner_corner_of_transition_between_transition
  },
  {
    transition_group1 = water_transition_group_id,
    transition_group2 = out_of_map_transition_group_id,

    background_layer_offset = 1,
    background_layer_group = "zero",
    offset_background_layer_by_tile_layer = true,

    spritesheet = "__planetaris-unbounded__/graphics/terrain/sandstone-foundation/sandstone-shore-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png",
      u_transition_count = 0,
      o_transition_count = 0
    }
  },
}

------------------------------------------------------------------ Sandstone Path


data:extend({
  {
  type = "tile",
  name = "sandstone-path",
  subgroup = "artificial-tiles",
  collision_mask = tile_collision_masks.ground(),
  minable = {mining_time = 0.5, result = "sandstone-brick"},
  order = "a[artificial]-b[tier-2]-a[sandstone-path]",
  mined_sound = base_sounds.deconstruct_bricks(0.8),
  layer = 12,
  layer_group = "ground-artificial",
  transition_overlay_layer_offset = 2,
  decorative_removal_probability = 0.25,
  variants = {
    main =
        {
          {
            picture = "__planetaris-unbounded__/graphics/terrain/sandstone-path/stone-path-1.png",
            count = 16,
            size = 1,
            scale = 0.5
          },
          {
            picture = "__planetaris-unbounded__/graphics/terrain/sandstone-path/stone-path-2.png",
            count = 16,
            size = 2,
            probability = 0.39,
            scale = 0.5
          },
          {
            picture = "__planetaris-unbounded__/graphics/terrain/sandstone-path/stone-path-4.png",
            count = 16,
            size = 4,
            probability = 1,
            scale = 0.5
          }
        },
        transition =
        {
          overlay_layout =
          {
            inner_corner =
            {
              spritesheet = "__planetaris-unbounded__/graphics/terrain/sandstone-path/stone-path-inner-corner.png",
              count = 16,
              tile_height = 2,
              scale = 0.5
            },
            outer_corner =
            {
              spritesheet = "__planetaris-unbounded__/graphics/terrain/sandstone-path/stone-path-outer-corner.png",
              count = 8,
              tile_height = 2,
              scale = 0.5
            },
            side =
            {
              spritesheet = "__planetaris-unbounded__/graphics/terrain/sandstone-path/stone-path-side.png",
              count = 16,
              tile_height = 2,
              scale = 0.5
            },
            u_transition =
            {
              spritesheet = "__planetaris-unbounded__/graphics/terrain/sandstone-path/stone-path-u.png",
              count = 8,
              tile_height = 2,
              scale = 0.5
            },
            o_transition =
            {
              spritesheet = "__planetaris-unbounded__/graphics/terrain/sandstone-path/stone-path-o.png",
              count = 4,
              scale = 0.5
            }
          }
        }
      },
  walking_sound = base_tile_sounds.walking.dirt,
  build_sound = base_tile_sounds.building.concrete,
  map_color = {163, 151, 127},
  vehicle_friction_modifier = 1.1,
  walking_speed_modifier = 1.2,
  },
  {
    type = "tile",
    name = "sandstone-foundation",
    order = "a[artificial]-d[utility]-b[sandstone-foundation]",
    subgroup = "artificial-tiles",
    minable = {mining_time = 0.5, result = "sandstone-foundation"},
    mined_sound = sounds.deconstruct_bricks(0.8),
    is_foundation = true,
    collision_mask = tile_collision_masks.ground(),
    layer = 11,
    -- layer_group = "ground-artificial" -- should landfill be in the ground-artifical group?

    transitions = sandstone_foundation_transitions,
    transitions_between_transitions = sandstone_foundation_transitions_between_transitions,

    variants =
    {
      transition = tile_graphics.generic_masked_tile_transitions1,

      material_background =
      {
        picture = "__planetaris-unbounded__/graphics/terrain/sandstone-foundation/sandstone-foundation.png",
        count = 8,
        scale = 0.5
      }
    },

    walking_sound = base_tile_sounds.walking.dirt,
    build_sound = base_tile_sounds.building.landfill,
    map_color={138, 127, 106},
    scorch_mark_color = {138, 127, 106}
  },
})



table.insert(water_tile_type_names, "arig-sand")

data:extend({
  {

------------------------------------------------------------------ arig sand

    name = "arig-sand",
    type = "tile",
    order = "a[oil]-b[shallow]",
    subgroup = "nauvis-tiles",
    collision_mask = {layers={
      water_tile=true,
      resource=true,
    --item=true,
    --  player=true,
      floor=true,
      rail_support=true
    }},
    autoplace = {probability_expression = "clamp(0, 1, 1 - arig_island_elevation * 2) * ((control:arig_sand:frequency * 0.17) + (control:arig_sand:size * 6) * 0.5)"}, -- target coast at cliff elevation
    layer = 4,
    layer_group = "ground-natural",
    map_color = {r = 189, g = 158, b = 124},
    vehicle_friction_modifier = 4,
    walking_speed_modifier = 0.8,
    default_cover_tile = "sandstone-path",
    fluid = "sand",
    absorptions_per_second = nil,
    variants = tile_variations_template(
      "__planetaris-unbounded__/graphics/terrain/arig-sand/arig-sand.png", "__base__/graphics/terrain/masks/transition-4.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 0.39, weights = {0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020}, },
        [4] = { probability = 0.39, weights = {0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020}, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    )
  },
------------------------------------------------------------------ arig sandstone
{
  name = "sandstone-1",
  type = "tile",
  order = "b[natural]-c[sand]-d[sandstone-1]",
  subgroup = "nauvis-tiles",
  collision_mask = tile_collision_masks.ground(),
  autoplace = {probability_expression = 'max(expression_in_range_base(-10, -10, 0.25, 0.15),\z
                                             expression_in_range(5, inf, elevation, aux, -1.5, 0.5, 1.5, 1)) +\z
                                         noise_layer_noise(36)'},
  layer = 8,

  variants = tile_variations_template(
    "__planetaris-unbounded__/graphics/terrain/sandstone-1.png", "__base__/graphics/terrain/masks/transition-4.png",
    {
      max_size = 8,
      [2] = { probability = 0.39, weights = {0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020} },
      [4] = { probability = 0.20, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
      [8] = { probability = 0.10, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
    }
  ),

  transitions = sandstone_transitions,
  transitions_between_transitions = sandstone_transitions_between_transitions,

  walking_sound = base_tile_sounds.walking.sand,
  driving_sound = base_tile_sounds.driving.sand,
  map_color={160, 128, 93},
  scorch_mark_color = {160, 128, 93},
  absorptions_per_second = tile_pollution.sand,
  vehicle_friction_modifier = sand_vehicle_speed_modifier,

  trigger_effect = tile_trigger_effects.sand_trigger_effect(),

},
{
  name = "sandstone-2",
  type = "tile",
  order = "b[natural]-c[sand]-e[sandstone-2]",
  subgroup = "nauvis-tiles",
  collision_mask = tile_collision_masks.ground(),
  autoplace = {probability_expression = 'max(expression_in_range_base(-10, -10, 0.25, 0.15),\z
                                             expression_in_range(5, inf, elevation, aux, -1.5, 0.5, 1.5, 1)) +\z
                                         noise_layer_noise(36)'},
  layer = 8,

  variants = tile_variations_template(
      "__planetaris-unbounded__/graphics/terrain/sandstone-2.png", "__base__/graphics/terrain/masks/transition-4.png",
      {
        max_size = 8,
        [2] = { probability = 0.39, weights = {0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020} },
        [4] = { probability = 0.20, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
        [8] = { probability = 0.10, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),

  transitions = sandstone_transitions,
  transitions_between_transitions = sandstone_transitions_between_transitions,

  walking_sound = base_tile_sounds.walking.sand,
  driving_sound = base_tile_sounds.driving.sand,
  map_color={151, 120, 86},
  scorch_mark_color = {151, 120, 86},
  absorptions_per_second = tile_pollution.sand,
  vehicle_friction_modifier = sand_vehicle_speed_modifier,

  trigger_effect = tile_trigger_effects.sand_trigger_effect(),

},
{
  name = "sandstone-3",
  type = "tile",
  order = "b[natural]-c[sand]-f[sandstone-3]",
  subgroup = "nauvis-tiles",
  collision_mask = tile_collision_masks.ground(),
  autoplace = {probability_expression = 'max(expression_in_range_base(-10, -10, 0.25, 0.15),\z
                                             expression_in_range(5, inf, elevation, aux, -1.5, 0.5, 1.5, 1)) +\z
                                         noise_layer_noise(36)'},
  layer = 8,

  variants = tile_variations_template(
      "__planetaris-unbounded__/graphics/terrain/sandstone-3.png", "__base__/graphics/terrain/masks/transition-4.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 0.39, weights = {0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020}, },
        [4] = { probability = 0.39, weights = {0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020}, },
        --[8] = { probability = 1.00, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
      }
    ),

  transitions = sandstone_transitions,
  transitions_between_transitions = sandstone_transitions_between_transitions,

  walking_sound = base_tile_sounds.walking.sand,
  driving_sound = base_tile_sounds.driving.sand,
  map_color={140, 110, 79},
  scorch_mark_color = {140, 110, 79},
  absorptions_per_second = tile_pollution.sand,
  vehicle_friction_modifier = sand_vehicle_speed_modifier,

  trigger_effect = tile_trigger_effects.sand_trigger_effect(),

},
})


-- Return the necessary data for the tile (optional but for clarity)
return {
  ["arig-sand"] = arig_sand,
  ["arig-path"] = sandstone_path,
  ["sandstone-1"] = sandstone_1,
  ["sandstone-2"] = sandstone_2,
  ["sandstone-3"] = sandstone_3,
}