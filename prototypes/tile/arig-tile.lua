require("__base__/prototypes/tile/tiles")

local base_sounds = require("__base__/prototypes/entity/sounds")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local space_age_tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")
local planetaris_tile_collision_masks = require("prototypes.tile.tile-collision-masks")
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


data:extend({
  {
      type = "trivial-smoke",
      name = "sand-smoke",
      color = {0.949, 0.918, 0.867},
      duration = 15,
      fade_in_duration = 3,
      fade_away_duration = 3,
      start_scale = 0.05,
      end_scale = 0.05,
      render_layer = "higher-object-under",
      affected_by_wind = true,
      cyclic =  true,
      animation = {
        width = 152,
        height = 120,
        line_length = 5,
        frame_count = 60,
        shift = {0, 0},
        priority = "high",
        animation_speed = 0.25,
        filename = "__planetaris-arig__/graphics/entity/sand-smoke/smoke.png",
        flags = { "smoke" },
        scale = 0.5
      }
      
  }
})

local destroyed_item_trigger =
{
  type = "direct",
  action_delivery =
  {
    type = "instant",
    source_effects =
    {
      type = "create-trivial-smoke",
      smoke_name = "sand-smoke",
      starting_frame_deviation = 5
    }
  }
}


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

    spritesheet = "__planetaris-arig__/graphics/terrain/sand.png",
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

    spritesheet = "__planetaris-arig__/graphics/terrain/sand-transition.png",
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

    spritesheet = "__planetaris-arig__/graphics/terrain/out-of-map-transition/sandstone-out-of-map-transition.png",
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

    spritesheet = "__planetaris-arig__/graphics/terrain/out-of-map-transition/sandstone-shore-out-of-map-transition.png",
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

    spritesheet = "__planetaris-arig__/graphics/terrain/sandstone-foundation/sandstone.png",
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
    spritesheet = "__planetaris-arig__/graphics/terrain/sandstone-foundation/sandstone-transition.png",
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

    spritesheet = "__planetaris-arig__/graphics/terrain/sandstone-foundation/sandstone-shore-out-of-map-transition.png",
    layout = tile_spritesheet_layout.transition_3_3_3_1_0,
    effect_map_layout =
    {
      spritesheet = "__base__/graphics/terrain/effect-maps/water-dirt-to-out-of-map-mask.png",
      u_transition_count = 0,
      o_transition_count = 0
    }
  },
}

local function transition_masks()
  return {
    mask_spritesheet = "__base__/graphics/terrain/masks/transition-1.png",
    mask_layout =
    {
      scale = 0.5,
      inner_corner =
      {
        count = 8,
      },
      outer_corner =
      {
        count = 8,
        x = 64*9
      },
      side =
      {
        count = 8,
        x = 64*9*2
      },
      u_transition =
      {
        count = 1,
        x = 64*9*3
      },
      o_transition =
      {
        count = 1,
        x = 64*9*4
      }
    }
  }
end

------------------------------------------------------------------ Sandstone Path


data:extend({
  {
  type = "tile",
  name = "planetaris-sandstone-path",
  subgroup = "artificial-tiles",
  collision_mask = tile_collision_masks.ground(),
  minable = {mining_time = 0.2, result = "planetaris-sandstone-brick"},
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
            picture = "__planetaris-arig__/graphics/terrain/sandstone-path/stone-path-1.png",
            count = 16,
            size = 1,
            scale = 0.5
          },
          {
            picture = "__planetaris-arig__/graphics/terrain/sandstone-path/stone-path-2.png",
            count = 16,
            size = 2,
            probability = 0.39,
            scale = 0.5
          },
          {
            picture = "__planetaris-arig__/graphics/terrain/sandstone-path/stone-path-4.png",
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
              spritesheet = "__planetaris-arig__/graphics/terrain/sandstone-path/stone-path-inner-corner.png",
              count = 16,
              tile_height = 2,
              scale = 0.5
            },
            outer_corner =
            {
              spritesheet = "__planetaris-arig__/graphics/terrain/sandstone-path/stone-path-outer-corner.png",
              count = 8,
              tile_height = 2,
              scale = 0.5
            },
            side =
            {
              spritesheet = "__planetaris-arig__/graphics/terrain/sandstone-path/stone-path-side.png",
              count = 16,
              tile_height = 2,
              scale = 0.5
            },
            u_transition =
            {
              spritesheet = "__planetaris-arig__/graphics/terrain/sandstone-path/stone-path-u.png",
              count = 8,
              tile_height = 2,
              scale = 0.5
            },
            o_transition =
            {
              spritesheet = "__planetaris-arig__/graphics/terrain/sandstone-path/stone-path-o.png",
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
    name = "planetaris-sandstone-foundation",
    order = "a[artificial]-d[utility]-b[sandstone-foundation]",
    subgroup = "artificial-tiles",
    minable = {mining_time = 0.2, result = "planetaris-sandstone-foundation"},
    mined_sound = base_sounds.deconstruct_bricks(0.8),
    is_foundation = true,
    can_be_part_of_blueprint = true,
    collision_mask = tile_collision_masks.ground(),
    layer = 11,

    transitions = sandstone_foundation_transitions,
    transitions_between_transitions = sandstone_foundation_transitions_between_transitions,

    variants =
    {
      transition = tile_graphics.generic_masked_tile_transitions1,

      material_background =
      {
        picture = "__planetaris-arig__/graphics/terrain/sandstone-foundation/sandstone-foundation.png",
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

data:extend({
  {
    type = "item-subgroup",
    name = "arig-tiles",
    group = "tiles",
    order = "c"
  }
})

data:extend({
  {

------------------------------------------------------------------ arig sand

    name = "arig-sand",
    type = "tile",
    order = "a[sand]-b[shallow]",
    subgroup = "arig-tiles",
    collision_mask = {layers={
      water_tile=true,
      resource=true,
      floor=true,
    }},
    autoplace = {probability_expression = "shallow_sand_level"}, -- target coast at cliff elevation
    layer = 4,
    layer_group = "ground-natural",
    map_color = {189, 158, 124},
    vehicle_friction_modifier = 4,
    walking_speed_modifier = 0.8,
    default_cover_tile = "planetaris-sandstone-foundation",
    fluid = "planetaris-sand",
    absorptions_per_second = nil,
    destroys_dropped_items = true,
    default_destroyed_dropped_item_trigger = destroyed_item_trigger,
    variants =
    {
      transition = transition_masks(),
      material_background =
      {
        picture = "__planetaris-arig__/graphics/terrain/arig-dune-sand.png",
        line_length = 4,
        count = 16,
        scale = 0.5
      },
      material_texture_width_in_tiles = 10,
      material_texture_height_in_tiles = 7
    },
    transitions = table.deepcopy(data.raw.tile["water-shallow"].transitions),
    transitions_between_transitions = table.deepcopy(data.raw.tile["water-shallow"].transitions_between_transitions),
    walking_sound = sound_variations("__base__/sound/walking/sand", 9, 0.8, volume_multiplier("main-menu", 2.9)),
    landing_steps_sound = space_age_tile_sounds.landing.sand,
    driving_sound = sand_driving_sound,
    ambient_sounds = sand_ambient_sound,
    trigger_effect = tile_trigger_effects.sand_trigger_effect()
  },
{

------------------------------------------------------------------ deep arig sand

    name = "arig-deep-sand",
    type = "tile",
    order = "a[sand]-a[deep]",
    subgroup = "arig-tiles",
    collision_mask = planetaris_tile_collision_masks.oil_ocean_deep(),
    autoplace = {probability_expression = "deep_sand_level"}, -- target coast at cliff elevation
    layer = 5,
    layer_group = "ground-natural",
    map_color = {199, 168, 134},
    vehicle_friction_modifier = 5,
    walking_speed_modifier = 0.7,
    default_cover_tile = "planetaris-sandstone-path",
    fluid = "planetaris-sand",
    absorptions_per_second = nil,
    destroys_dropped_items = true,
    default_destroyed_dropped_item_trigger = destroyed_item_trigger,
    variants =
    {
      transition = transition_masks(),
      material_background =
      {
        picture = "__planetaris-arig__/graphics/terrain/arig-dune-deep-sand.png",
        line_length = 4,
        count = 16,
        scale = 0.5,
        tint = {0.5, 0, 0, 0.2}
      },
      material_texture_width_in_tiles = 10,
      material_texture_height_in_tiles = 7
    },
    transitions = table.deepcopy(data.raw.tile["water-shallow"].transitions),
    transitions_between_transitions = table.deepcopy(data.raw.tile["water-shallow"].transitions_between_transitions),
    walking_sound = sound_variations("__base__/sound/walking/sand", 9, 0.8, volume_multiplier("main-menu", 2.9)),
    landing_steps_sound = space_age_tile_sounds.landing.sand,
    driving_sound = sand_driving_sound,
    ambient_sounds = sand_ambient_sound,
    trigger_effect = tile_trigger_effects.sand_trigger_effect()
  },
    ------------------------------------------------------------------ arig stable sand
  {

    name = "arig-stable-sand",
    type = "tile",
    order = "a[sand]-c[stable]",
    subgroup = "arig-tiles",
    collision_mask = tile_collision_masks.ground(),
    autoplace = {probability_expression = "beach_level"},
    layer = 6,
    map_color={160, 128, 93},
    vehicle_friction_modifier = sand_vehicle_speed_modifier,
    walking_speed_modifier = 0.9,
    absorptions_per_second = nil,
    variants =
    {
      transition = transition_masks(),
      material_background =
      {
        picture = "__planetaris-arig__/graphics/terrain/arig-stable-sand.png",
        line_length = 8,
        count = 16,
        scale = 0.5
      },
      material_texture_width_in_tiles = 8,
      material_texture_height_in_tiles = 8
    },
    transitions = sandstone_transitions,
    transitions_between_transitions = sandstone_transitions_between_transitions,
    walking_sound = base_tile_sounds.walking.sand,
    landing_steps_sound = space_age_tile_sounds.landing.sand,
    driving_sound = base_tile_sounds.driving.sand,
    ambient_sounds = sand_ambient_sound,
    scorch_mark_color = {r = 0.3, g = 0.3, b = 0.3, a = 1.000},
    trigger_effect = tile_trigger_effects.sand_trigger_effect()
  },
  ------------------------------------------------------------------ arig sandstone
{
  name = "planetaris-sandstone-1",
  type = "tile",
  order = "b[sandstone]-a[sandstone-1]",
  subgroup = "arig-tiles",
  collision_mask = tile_collision_masks.ground(),
  autoplace = {probability_expression = [[
      plateau_level * 
      (range_select{
        input = arig_island_elevation_raw,
        from = 0.50,
        to = 1,
        slope = 0.1,
        min = 0,
        max = 1
      } + noise_layer_noise(41) * 0.3)
    ]]},
  layer = 7,

  variants = tile_variations_template(
    "__planetaris-arig__/graphics/terrain/sandstone-1.png", "__base__/graphics/terrain/masks/transition-4.png",
    {
      max_size = 8,
      [2] = { probability = 0.39, weights = {0.025, 0.010, 0.013, 0.025, 0.025, 0.100, 0.100, 0.005, 0.010, 0.010, 0.005, 0.005, 0.001, 0.015, 0.020, 0.020} },
      [4] = { probability = 0.20, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} },
      [8] = { probability = 0.10, weights = {0.090, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.025, 0.125, 0.005, 0.010, 0.100, 0.100, 0.010, 0.020, 0.020} }
    }
  ),

  transitions = stable_to_shallow_transitions,
  transitions_between_transitions = sandstone_transitions_between_transitions,

  walking_sound = base_tile_sounds.walking.sand,
  driving_sound = base_tile_sounds.driving.sand,
  map_color={160, 128, 93},
  scorch_mark_color = {170, 138, 103},
  absorptions_per_second = nil,
  vehicle_friction_modifier = sand_vehicle_speed_modifier,

  trigger_effect = tile_trigger_effects.sand_trigger_effect(),

},
{
  name = "planetaris-sandstone-2",
  type = "tile",
  order = "b[sandstone]-b[sandstone-2]",
  subgroup = "arig-tiles",
  collision_mask = tile_collision_masks.ground(),
  autoplace = {probability_expression = [[
      plateau_level * 
      (range_select{
        input = arig_island_elevation_raw,
        from = 0.50,
        to = 1,
        slope = 0.1,
        min = 0,
        max = 1
      } + noise_layer_noise(41) * 0.3)
    ]]},
  layer = 8,

  variants = tile_variations_template(
      "__planetaris-arig__/graphics/terrain/sandstone-2.png", "__base__/graphics/terrain/masks/transition-4.png",
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
  absorptions_per_second = nil,
  vehicle_friction_modifier = sand_vehicle_speed_modifier,

  trigger_effect = tile_trigger_effects.sand_trigger_effect(),

},
{
  name = "planetaris-sandstone-3",
  type = "tile",
  order = "b[sandstone]-c[sandstone-3]",
  subgroup = "arig-tiles",
  collision_mask = tile_collision_masks.ground(),
  autoplace = {probability_expression = [[
      plateau_level * 
      (range_select{
        input = arig_island_elevation_raw,
        from = 0.50,
        to = 1,
        slope = 0.1,
        min = 0,
        max = 1
      } + noise_layer_noise(40) * 0.3)
    ]]},
  layer = 8,

  variants = tile_variations_template(
      "__planetaris-arig__/graphics/terrain/sandstone-3.png", "__base__/graphics/terrain/masks/transition-4.png",
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
  absorptions_per_second = nil,
  vehicle_friction_modifier = sand_vehicle_speed_modifier,

  trigger_effect = tile_trigger_effects.sand_trigger_effect(),

},
  {
    name = "planetaris-arig-rock",
    type = "tile",
    order = "b[sandstone]-d[sandstone-rock]",
    subgroup = "arig-tiles",
    collision_mask = tile_collision_masks.ground(),
  autoplace = {probability_expression = "plateau_level"},
    layer = 9,
    map_color={135, 105, 75},
    vehicle_friction_modifier = 4,
    absorptions_per_second = nil,
    variants =
    {
      transition = transition_masks(),
      material_background =
      {
        picture = "__planetaris-arig__/graphics/terrain/arig-rock.png",
        line_length = 8,
        count = 16,
        scale = 0.5
      },
      material_texture_width_in_tiles = 8,
      material_texture_height_in_tiles = 8
    },
    transitions = sandstone_transitions,
    transitions_between_transitions = sandstone_transitions_between_transitions,
    walking_sound = space_age_tile_sounds.walking.rocky_stone({modifiers = volume_multiplier("main-menu", 2.9)}),
    landing_steps_sound = space_age_tile_sounds.landing.rock,
    driving_sound = base_tile_sounds.driving.stone,
    scorch_mark_color = {155, 125, 90},
    trigger_effect = tile_trigger_effects.sand_trigger_effect()
  },
})

table.insert(water_tile_type_names, "arig-sand")
table.insert(water_tile_type_names, "arig-deep-sand")

-- Return the necessary data for the tile (optional but for clarity)
return {
  ["arig-sand"] = arig_sand,
  ["arig-deep-sand"] = arig_deep_sand,
  ["arig-path"] = sandstone_path,
  ["arig-stable-sand"] = arig_stable_sand,
  ["planetaris-sandstone-1"] = sandstone_1,
  ["planetaris-sandstone-2"] = sandstone_2,
  ["planetaris-sandstone-3"] = sandstone_3,
}