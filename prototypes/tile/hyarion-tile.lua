require("__base__/prototypes/tile/tiles")
require("__space-age__/prototypes/tile/tiles-vulcanus")
require("prototypes/planets/planet_hyarion_map_gen")

local base_sounds = require("__base__/prototypes/entity/sounds")
local base_tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local space_age_tile_sounds = require("__space-age__/prototypes/tile/tile-sounds")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")
local tile_trigger_effects = require("__base__/prototypes/tile/tile-trigger-effects")
local tile_pollution = require("__base__/prototypes/tile/tile-pollution-values")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")

local tile_graphics = require("__base__/prototypes/tile/tile-graphics")
local tile_spritesheet_layout = tile_graphics.tile_spritesheet_layout

local tile_lightening = 128
hyarion_tile_offset = 40

data:extend({
  {
    type = "item-subgroup",
    name = "hyarion-tiles",
    group = "tiles",
    order = "c-b"
  }
})

data:extend({
  {
    type = "noise-expression",
    name = "hyarion_metal_tile",
    expression = "max(0, hyarion_iron_probability)"
  },
  ---- BASALTS
  -- hyarion_aux controls rocky outcrop pounts.
  -- high-medium hyarion_aux is cracks
  -- low hyarion_aux is smooth
  -- hotter is lower elevation
  {
    type = "noise-expression",
    name ="hyarion_cracks_hot_range",
    expression = "hyarion_quartzlands_biome * range_select_base(hyarion_elev, 0, 8, 1, 0, 20)"
  },
  {
    type = "noise-expression",
    name ="hyarion_cracks_warm_range",
    expression = "hyarion_quartzlands_biome * range_select_base(hyarion_elev, 8, 22, 1, 0, 5)\z
                  + (hyarion_aux - 0.05)\z
                  + 50000 * hyarion_metal_tile"
  },
  {
    type = "noise-expression",
    name = "hyarion_cracks_cold_range",
    expression = "(0.5 - hyarion_valley_biome) * range_select_base(hyarion_elev, 20, 100, 1, 0, 1)\z
                  + (hyarion_aux - 0.3)"
  },
  {
    type = "noise-expression",
    name = "hyarion_smooth_stone_warm_range",
    expression = "hyarion_quartzlands_biome * range_select_base(hyarion_elev, 8, 20, 1, 0, 5)\z
                  - (hyarion_aux - 0.05)\z
                  + 50000 * hyarion_metal_tile"
  },
  {
    type = "noise-expression",
    name = "hyarion_smooth_stone_range",
    expression = "(0.5 - hyarion_valley_biome) * range_select_base(hyarion_elev, 20, 100, 1, 0, 1)\z
                  - (hyarion_aux - 0.3)"
  },

  -- MOUNTAINS
  -- lumps (jagged/cold folded) are on high hyarion_aux.
  -- depression channels (hot folded, soil) are low hyarion_aux.
  -- folded is higher up the mountain.
  -- hot folded is closest to the center.
  -- jagged ground identifies rocky peacks and resource patches.
  -- flat folded ix between extremes
  {
    type = "noise-expression",
    name = "hyarion_folds_flat_range",
    expression = "2 * (hyarion_mountains_biome - 0.5) - 0.15 * mountain_volcano_spots"
  },
  {
    type = "noise-expression",
    name = "hyarion_folds_range",
    expression = "2 * (hyarion_mountains_biome - 0.5) + (hyarion_aux - 0.5) + 0.5 * (mountain_volcano_spots - 0.1)"

  },
  {
    type = "noise-expression",
    name = "hyarion_folds_warm_range",
    expression = "2 * (hyarion_mountains_biome - 0.5) + 3 * (mountain_volcano_spots - 0.85) - 2 * (hyarion_aux - 0.5)"
  },
  {
    type = "noise-expression",
    name ="hyarion_jagged_ground_range",
    -- volcano peak circle is expected to be 1020 to 1030, The cliff is at 1020
    expression = "5 * min(10, max(hyarion_iron_region + 0.2,\z
                                  range_select_base(hyarion_elev, 1010, 2000, 2, -10, 1) + 3 * (hyarion_aux - 0.5)))"
  },
  {
    type = "noise-expression",
    name ="hyarion_soil_light_range_mountains",
    expression = "min(0.8, 4 * (hyarion_mountains_biome - 0.25)) - 0.35 * mountain_volcano_spots - 3 * (hyarion_aux - 0.2)"
  },
  {
    type = "noise-expression",
    name ="hyarion_soil_dark_range_mountains",
    expression = "min(0.8, 4 * (hyarion_mountains_biome - 0.25)) - 0.35 * mountain_volcano_spots - 1 * (hyarion_aux - 0.5)"
  },

  -- Ashlands
  -- Low hyarion_aux low hyarion_moisture is ash
  -- Low hyarion_aux high hyarion_moisture is trees & grass.
  -- High hyarion_aux low hyarion_moisture is chimneys and rocks.
  -- High hyarion_aux high hyarion_moisture is rocks with pita
  {
    type = "noise-expression",
    name = "hyarion_ash_flats_range",
    expression = "2 * (hyarion_valley_biome - 0.5)\z
                  - 1.5 * (hyarion_aux - 0.25)\z
                  - 1.5 * (hyarion_moisture - 0.6)"
  },
  {
    type = "noise-expression",
    name = "hyarion_ash_light_range",
    expression = "2 * (hyarion_valley_biome - 0.5)\z
                  - 1.5 * (hyarion_moisture - 0.6)"
  },
  {
    type = "noise-expression",
    name = "hyarion_ash_dark_range",
    expression = "min(1, 4 * (hyarion_valley_biome - 0.25))\z
                  + max(-1.5 * (hyarion_aux - 0.25),\z
                        0.01 - 1.5 * abs(hyarion_aux - 0.5) - 1.5 * (hyarion_moisture - 0.66))"
    -- the last part is an axtra line blending ash cracks to light ash
  },
  {
    type = "noise-expression",
    name = "hyarion_pumice_stones_range",
    expression = "2 * (hyarion_valley_biome - 0.5)\z
                  + 1.5 * (hyarion_aux - 0.5)\z
                  + 1.5 * (hyarion_moisture - 0.66)"
  },
  {
    type = "noise-expression",
    name = "hyarion_ash_cracks_range",
    expression = "min(1, 4 * (hyarion_valley_biome - 0.25))\z
                  + 1.5 * (hyarion_aux - 0.5)\z
                  - 1.5 * (hyarion_moisture - 0.66)"
  },
  {
    type = "noise-expression",
    name = "hyarion_ash_soil_range",
    expression = "2 * (hyarion_valley_biome - 0.5)"
  },
  {
    type = "noise-expression",
    name = "hyarion_soil_light_range_ashlands",
    expression = "2 * (hyarion_valley_biome - 0.5)\z
                  + 1.5 * (hyarion_moisture - 0.8)"
  },
  {
    type = "noise-expression",
    name = "hyarion_soil_dark_range_ashlands",
    expression = "2 * (hyarion_valley_biome - 0.5)\z
                  - 1.5 * (hyarion_aux - 0.25)\z
                  + 1.5 * (hyarion_moisture - 0.8)"
  },

  -- COMBINE SHARED
  {
    type = "noise-expression",
    name = "hyarion_soil_light_range",
    expression = "max(hyarion_soil_light_range_mountains, hyarion_soil_light_range_ashlands, 10 * (vulcanus_sulfuric_acid_region_patchy + 0.2))"
  },
  {
    type = "noise-expression",
    name = "hyarion_soil_dark_range",
    expression = "max(hyarion_soil_dark_range_mountains, hyarion_soil_dark_range_ashlands)"
  },

  ----------------------------------------------------------------------------------------------------

  ----------- CLIFF TILE
  {
    type = "tile",
    name = "hyarion-jagged-ground",
    subgroup = "hyarion-tiles",
    order = "a-k",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "hyarion_jagged_ground_range"
    },
    layer = vulcanus_tile_offset + 5,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      "__planetaris-unbounded-assets__/graphics/terrain/hyarion/hyarion-jagged-ground.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = space_age_tile_sounds.walking.rocky_stone({}),
    landing_steps_sound = space_age_tile_sounds.landing.rock,
    driving_sound = base_tile_sounds.driving.stone,
    map_color = {r = tile_lightening- 30, g = tile_lightening- 30, b = tile_lightening- 20},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 2,
    absorptions_per_second = tile_pollution.lava,
  },

  ----------- WARM CRACKS
  {
    type = "tile",
    name = "hyarion-cracks-hot",
    subgroup = "hyarion-tiles",
    order = "a-c",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "hyarion_cracks_hot_range"
    },
    layer = hyarion_tile_offset + 2,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions_and_light(
      "__planetaris-unbounded-assets__/graphics/terrain/hyarion/hyarion-cracks-hot.png",
      "__planetaris-unbounded-assets__/graphics/terrain/hyarion/hyarion-cracks-hot-light.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = space_age_tile_sounds.walking.warm_stone,
    landing_steps_sound = space_age_tile_sounds.landing.rock,
    driving_sound = base_tile_sounds.driving.stone,
    map_color = {r = tile_lightening+ 30, g = tile_lightening+ 5, b = tile_lightening+ -5}, -- changed from (32 32 32) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = .6,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,
  },
  {
    type = "tile",
    name = "hyarion-cracks-warm",
    subgroup = "hyarion-tiles",
    order = "a-d",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "hyarion_cracks_warm_range"
    },
    layer = hyarion_tile_offset + 3,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions_and_light(
      "__planetaris-unbounded-assets__/graphics/terrain/hyarion/hyarion-cracks-warm.png",
      "__planetaris-unbounded-assets__/graphics/terrain/hyarion/hyarion-cracks-warm-lightmap1.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = space_age_tile_sounds.walking.warm_stone,
    landing_steps_sound = space_age_tile_sounds.landing.rock,
    driving_sound = base_tile_sounds.driving.stone,
    map_color = {r = tile_lightening+ 30, g = tile_lightening+ 10, b = tile_lightening+ 5},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava
  },
  ----------- COLD CRACKS
  {
    type = "tile",
    name = "hyarion-cracks",
    subgroup = "hyarion-tiles",
    order = "a-e",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "hyarion_cracks_cold_range"
    },
    layer = hyarion_tile_offset + 4,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
       "__planetaris-unbounded-assets__/graphics/terrain/hyarion/hyarion-cracks.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = space_age_tile_sounds.walking.rocky_stone({}),
    landing_steps_sound = space_age_tile_sounds.landing.rock,
    driving_sound = base_tile_sounds.driving.stone,
    map_color = {r = tile_lightening+ 15, g = tile_lightening+ 14, b = tile_lightening+ 15},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava
  },
  ----------- COLD LAVA FLAT
  {
    type = "tile",
    name = "hyarion-folds-flat",
    subgroup = "hyarion-tiles",
    order = "a-j",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "hyarion_folds_flat_range"
    },
    layer = hyarion_tile_offset + 16,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      "__planetaris-unbounded-assets__/graphics/terrain/hyarion/hyarion-folds-flat.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = space_age_tile_sounds.walking.rugged_stone({}),
    landing_steps_sound = space_age_tile_sounds.landing.rock,
    driving_sound = base_tile_sounds.driving.stone,
    map_color = {r =tile_lightening- 20, g = tile_lightening- 20, b = tile_lightening- 20}, -- changed from (8 7 8) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 2,
    absorptions_per_second = tile_pollution.lava

  },
  ----------- ASH SAND
  {
    type = "tile",
    name = "hyarion-ash-light",
    subgroup = "hyarion-tiles",
    order = "a-o",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "hyarion_ash_light_range"
    },
    layer = hyarion_tile_offset + 14,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      "__planetaris-unbounded-assets__/graphics/terrain/hyarion/hyarion-ash-light.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = space_age_tile_sounds.walking.soft_sand({}),
    landing_steps_sound = space_age_tile_sounds.landing.sand,
    driving_sound = base_tile_sounds.driving.sand,
    map_color = {r = tile_lightening+ 5, g = tile_lightening+ 5, b = tile_lightening+ 5}, -- changed from (30 30 30) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,
    can_be_part_of_blueprint = false,

    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
  },
  {
    type = "tile",
    name = "hyarion-ash-dark",
    subgroup = "hyarion-tiles",
    order = "a-p",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "hyarion_ash_dark_range"
    },
    layer = hyarion_tile_offset + 13,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      "__planetaris-unbounded-assets__/graphics/terrain/hyarion/hyarion-ash-dark.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = space_age_tile_sounds.walking.soft_sand({}),
    landing_steps_sound = space_age_tile_sounds.landing.sand,
    driving_sound = base_tile_sounds.driving.sand,
    map_color = {r = tile_lightening+ 3, g = tile_lightening+ 3, b = tile_lightening+ 3}, -- changed from (30 30 30) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,
    can_be_part_of_blueprint = false,

    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
  },
  ----------- ASH SAND
  {
    type = "tile",
    name = "hyarion-ash-flats",
    subgroup = "hyarion-tiles",
    order = "a-o",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "hyarion_ash_flats_range"
    },
    layer = hyarion_tile_offset + 12,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      "__planetaris-unbounded-assets__/graphics/terrain/hyarion/hyarion-ash-flats.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = space_age_tile_sounds.walking.soft_sand({}),
    landing_steps_sound = space_age_tile_sounds.landing.sand,
    driving_sound = base_tile_sounds.driving.sand,
    map_color = {r = tile_lightening+ 1, g = tile_lightening+ 1, b = tile_lightening+ 1}, -- changed from (30 30 30) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,
    can_be_part_of_blueprint = false,

    trigger_effect = tile_trigger_effects.dirt_2_trigger_effect()
  },
  ----------- PUMICE
  {
    type = "tile",
    name = "hyarion-pumice-stones",
    subgroup = "hyarion-tiles",
    order = "a-n",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "hyarion_pumice_stones_range"
    },
    layer = hyarion_tile_offset + 15,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      "__planetaris-unbounded-assets__/graphics/terrain/hyarion/hyarion-pumice-stones.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = space_age_tile_sounds.walking.rocky_stone({}),
    landing_steps_sound = space_age_tile_sounds.landing.rock,
    driving_sound = base_tile_sounds.driving.stone,
    map_color = {r = tile_lightening+ 18, g = tile_lightening+ 18, b = tile_lightening+ 18}, -- changed from (32 32 32) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava
  },
  ----------- SMOOTH STONE
  {
    type = "tile",
    name = "hyarion-smooth-stone",
    subgroup = "hyarion-tiles",
    order = "a-g",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "hyarion_smooth_stone_range"
    },
    layer = hyarion_tile_offset + 1,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      "__planetaris-unbounded-assets__/graphics/terrain/hyarion/hyarion-smooth-stone.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = space_age_tile_sounds.walking.rocky_stone({}),
    landing_steps_sound = space_age_tile_sounds.landing.rock,
    driving_sound = base_tile_sounds.driving.stone,
    map_color = {r = tile_lightening+ 22, g = tile_lightening+ 22, b = tile_lightening+ 30}, -- changed from (32 32 32) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava

  },
  ----------- SMOOTH STONE WARM
  {
    type = "tile",
    name = "hyarion-smooth-stone-warm",
    subgroup = "hyarion-tiles",
    order = "a-f",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "hyarion_smooth_stone_warm_range"
    },
    layer = hyarion_tile_offset,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions_and_light(
      "__planetaris-unbounded-assets__/graphics/terrain/hyarion/hyarion-smooth-stone-warm.png",
      "__planetaris-unbounded-assets__/graphics/terrain/hyarion/hyarion-smooth-stone-warm-lightmap.png",

      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = space_age_tile_sounds.walking.warm_stone,
    landing_steps_sound = space_age_tile_sounds.landing.rock,
    driving_sound = base_tile_sounds.driving.stone,
    map_color = {r = tile_lightening+ 26, g = tile_lightening+ 22, b = tile_lightening+ 22}, -- changed from (32 32 32) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,

  },
  {
    type = "tile",
    name = "hyarion-ash-cracks",
    subgroup = "hyarion-tiles",
    order = "a-r",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "hyarion_ash_cracks_range"
    },
    layer = hyarion_tile_offset + 6,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      "__planetaris-unbounded-assets__/graphics/terrain/hyarion/hyarion-ash-cracks.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = space_age_tile_sounds.walking.rugged_stone({}),
    landing_steps_sound = space_age_tile_sounds.landing.rock,
    driving_sound = base_tile_sounds.driving.stone,
    map_color = {r = tile_lightening+ 11, g = tile_lightening+ 11, b = tile_lightening+ 11}, -- changed from (32 32 32) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava
  },
  {
    type = "tile",
    name = "hyarion-folds",
    subgroup = "hyarion-tiles",
    order = "a-i",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "hyarion_folds_range"
    },
    layer = hyarion_tile_offset + 18,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      "__planetaris-unbounded-assets__/graphics/terrain/hyarion/hyarion-folds.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = space_age_tile_sounds.walking.rugged_stone({}),
    landing_steps_sound = space_age_tile_sounds.landing.rock,
    driving_sound = base_tile_sounds.driving.stone,
    map_color = {r =tile_lightening- 17, g = tile_lightening- 17, b = tile_lightening- 17}, -- changed from (2 2 2) to satisfy TerrainColorsVersusResourceColors test
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 2,
    absorptions_per_second = tile_pollution.lava,
  },
  {
    type = "tile",
    name = "hyarion-folds-warm",
    subgroup = "hyarion-tiles",
    order = "a-h",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "hyarion_folds_warm_range"
    },
    layer = hyarion_tile_offset + 17,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions_and_light(
      "__planetaris-unbounded-assets__/graphics/terrain/hyarion/hyarion-folds-warm.png",
      "__planetaris-unbounded-assets__/graphics/terrain/hyarion/hyarion-folds-warm-lightmap.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
        [4] = { probability = 0.1, weights = {0.018, 0.020, 0.015, 0.025, 0.015, 0.020, 0.025, 0.015, 0.025, 0.025, 0.010, 0.025, 0.020, 0.025, 0.025, 0.010 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = space_age_tile_sounds.walking.rocky_stone({}),
    landing_steps_sound = space_age_tile_sounds.landing.rock,
    driving_sound = base_tile_sounds.driving.stone,
    map_color = {r = tile_lightening- 0, g = tile_lightening- 20, b = tile_lightening- 20},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,
  },
    {
    type = "tile",
    name = "hyarion-soil-dark",
    subgroup = "hyarion-tiles",
    order = "a-l",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "hyarion_soil_dark_range",
    },
    layer = hyarion_tile_offset + 7,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      "__planetaris-unbounded-assets__/graphics/terrain/hyarion/hyarion-soil-dark.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
      }
    ),
    -- tint={0.8, 0.75, 0.8},
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = space_age_tile_sounds.walking.soft_sand({}),
    landing_steps_sound = space_age_tile_sounds.landing.sand,
    driving_sound = base_tile_sounds.driving.sand,
    map_color = {r = tile_lightening- 20, g = tile_lightening- 23, b = tile_lightening- 15},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,
  },
  {
    type = "tile",
    name = "hyarion-soil-light",
    subgroup = "hyarion-tiles",
    order = "a-m",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "hyarion_soil_light_range"
    },
    layer = hyarion_tile_offset + 8,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      "__planetaris-unbounded-assets__/graphics/terrain/hyarion/hyarion-soil-light.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
      }
    ),
    -- tint={0.6, 0.55, 0.55},
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = space_age_tile_sounds.walking.soft_sand({}),
    landing_steps_sound = space_age_tile_sounds.landing.sand,
    driving_sound = base_tile_sounds.driving.sand,
    map_color = {r = tile_lightening- 30, g = tile_lightening- 20, b = tile_lightening- 15},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,
  },
  {
    type = "tile",
    name = "hyarion-ash-soil",
    subgroup = "hyarion-tiles",
    order = "a-q",
    collision_mask = tile_collision_masks.ground(),
    autoplace =
    {
      probability_expression = "hyarion_ash_soil_range"
    },
    layer = hyarion_tile_offset + 11,
    sprite_usage_surface = "vulcanus",
    variants = tile_variations_template_with_transitions(
      "__planetaris-unbounded-assets__/graphics/terrain/hyarion/hyarion-ash-soil.png",
      {
        max_size = 4,
        [1] = { weights = {0.085, 0.085, 0.085, 0.085, 0.087, 0.085, 0.065, 0.085, 0.045, 0.045, 0.045, 0.045, 0.005, 0.025, 0.045, 0.045 } },
        [2] = { probability = 1, weights = {0.070, 0.070, 0.025, 0.070, 0.070, 0.070, 0.007, 0.025, 0.070, 0.050, 0.015, 0.026, 0.030, 0.005, 0.070, 0.027 } },
        [4] = { probability = 1.00, weights = {0.070, 0.070, 0.070, 0.070, 0.070, 0.070, 0.015, 0.070, 0.070, 0.070, 0.015, 0.050, 0.070, 0.070, 0.065, 0.070 }, },
      }
    ),
    transitions = lava_stone_transitions,
    transitions_between_transitions = lava_stone_transitions_between_transitions,
    walking_sound = space_age_tile_sounds.walking.soft_sand({}),
    landing_steps_sound = space_age_tile_sounds.landing.sand,
    driving_sound = base_tile_sounds.driving.sand,
    map_color = {r = tile_lightening+ 8, g = tile_lightening+ 8, b = tile_lightening+ 8},
    walking_speed_modifier = 1,
    vehicle_friction_modifier = 1,
    absorptions_per_second = tile_pollution.lava,
  },
})