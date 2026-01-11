local sounds = require("__base__/prototypes/entity/sounds")
local tile_sounds = require("__base__/prototypes/tile/tile-sounds")
local hit_effects = require ("__base__.prototypes.entity.hit-effects")


local decorative_trigger_effects = require("__base__/prototypes/decorative/decorative-trigger-effects")

local tintable_rock_tint = {0.82, 0.604, 0.427}

local base_decorative_sprite_priority = "extra-high"
local decal_tile_layer = 255

data:extend({
    {
        name = "arig-crash",
        type = "simple-entity",
        flags = {"placeable-neutral", "placeable-off-grid"},
        icon = "__planetaris-arig__/graphics/icons/arig-crash.png",
        subgroup = "grass",
        order = "b[decorative]-z-a",
        deconstruction_alternative = "big-rock",
        collision_mask = {layers = {ground_tile = true, player = true}},
        collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
        selection_box = {{-1.0, -1.0}, {1.0, 0.75}},
        damaged_trigger_effect = hit_effects.rock(),
        render_layer = "object",
        autoplace = {
           probability_expression = 
            "0.0001 * (0.1 * (crash_cluster_mask)) \z
            + ((crash_frequency_scaled) + 0.006 * ((crash_size_scaled) - 0.3)) \z
            * (clamp( (crash_size_scaled) - abs(crash_cluster_noise), 0, 1))",
           local_expressions = {
              crash_size = "control:arig_crash:size",
              crash_frequency = "control:arig_crash:frequency",
              crash_size_scaled = "crash_size * (0.003)",
              crash_frequency_scaled = "crash_frequency * (5)",
              crash_cluster_noise = "multioctave_noise{ x = x, y = y, seed0 = map_seed, seed1 = map_seed + 5678, octaves = 4, persistence = 0.5, input_scale = 1, output_scale = 1}",
              crash_cluster_mask = "multioctave_noise{ x = x, y = y, seed0 = map_seed, seed1 = map_seed + 5678, octaves = 3, persistence = 0.6, input_scale = 1, output_scale = 1}",
          },
        },
        dying_trigger_effect = decorative_trigger_effects.big_rock(),
        minable =
        {
          mining_particle = "stone-particle",
          mining_time = 3,
          results = {
            {type = "item", name = "iron-plate", amount_min = 10, amount_max = 20},
            {type = "item", name = "copper-plate", amount_min = 10, amount_max = 20},
            {type = "item", name = "electronic-circuit", amount_min = 2, amount_max = 10},
            {type = "item", name = "steel-plate", amount_min = 5, amount_max = 15},
            {type = "item", name = "transport-belt", amount_min = 10, amount_max = 30},
            {type = "item", name = "inserter", amount_min = 2, amount_max = 5},
            {type = "item", name = "construction-robot", amount_min = 1, amount_max = 3}       
        }
        },
        resistances =
        {
          {
            type = "fire",
            percent = 100
          }
        },
        map_color = {219, 44, 44, 128},
        count_as_rock_for_filtered_deconstruction = true,
        mined_sound = sounds.deconstruct_bricks(1.0),
        impact_category = "stone",
        pictures =
        {
          {
            filename = "__planetaris-arig__/graphics/decorative/arig-crash/arig-crash-1.png",
            width = 229,
            height = 235,
            scale = 0.5,
            shift = {0.25, 0.0625}
          },
          {
            filename = "__planetaris-arig__/graphics/decorative/arig-crash/arig-crash-2.png",
            width = 215,
            height = 235,
            scale = 0.5,
            shift = {0.429688, 0.046875}
          },
          {
            filename = "__planetaris-arig__/graphics/decorative/arig-crash/arig-crash-3.png",
            width = 297,
            height = 235,
            scale = 0.5,
            shift = {0.398438, 0.3}
          },
        }
    },
    {
        name = "arig-big-sand-rock",
        type = "simple-entity",
        flags = {"placeable-neutral", "placeable-off-grid"},
        icon = "__base__/graphics/icons/big-sand-rock.png",
        subgroup = "grass",
        order = "b[decorative]-l[rock]-a[big]",
        deconstruction_alternative = "big-rock",
        collision_mask = {layers = {water_tile = true, player = true}},
        collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
        selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
        damaged_trigger_effect = hit_effects.rock(),
        render_layer = "object",
        max_health = 500,
        autoplace = {
           probability_expression = 
            "0.0001 * (0.1 * (rock_cluster_mask)) \z
            + ((rock_frequency_scaled) + 0.006 * ((rock_size_scaled) - 0.3)) \z
            * (clamp( (rock_size_scaled) - abs(rock_cluster_noise), 0, 1))",
           local_expressions = {
              rock_size = "control:arig_rocks:size",
              rock_frequency = "control:arig_rocks:frequency",
              rock_size_scaled = "rock_size * (0.01)",
              rock_frequency_scaled = "rock_frequency * (20)",
              rock_cluster_noise = "multioctave_noise{ x = x, y = y, seed0 = map_seed, seed1 = map_seed + 5678, octaves = 4, persistence = 0.5, input_scale = 1, output_scale = 1}",
              rock_cluster_mask = "multioctave_noise{ x = x, y = y, seed0 = map_seed, seed1 = map_seed + 5678, octaves = 3, persistence = 0.6, input_scale = 1, output_scale = 1}",
          },
        },
        dying_trigger_effect = decorative_trigger_effects.big_rock(),
        minable =
        {
          mining_particle = "stone-particle",
          mining_time = 2,
          results = {
            {type = "item", name = "stone", amount_min = 19, amount_max = 25},
            {type = "item", name = "coal", amount_min = 19, amount_max = 25},
            {type = "item", name = "iron-ore", amount_min = 19, amount_max = 25},
            {type = "item", name = "copper-ore", amount_min = 19, amount_max = 25},
        }
        },
        resistances =
        {
          {
            type = "fire",
            percent = 100
          }
        },
        map_color = {129, 105, 78},
        count_as_rock_for_filtered_deconstruction = true,
        mined_sound = sounds.deconstruct_bricks(1.0),
        impact_category = "stone",
        pictures =
        {
          {
            filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-01.png",
            width = 209,
            height = 138,
            shift = {0.304688, -0.4},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-02.png",
            width = 165,
            height = 129,
            shift = {0.0, 0.0390625},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-03.png",
            width = 151,
            height = 139,
            shift = {0.151562, 0.0},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-04.png",
            width = 216,
            height = 110,
            shift = {0.390625, 0.0},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-05.png",
            width = 154,
            height = 147,
            shift = {0.328125, 0.0703125},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-06.png",
            width = 154,
            height = 132,
            shift = {0.16875, -0.1},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-07.png",
            width = 193,
            height = 130,
            shift = {0.3, -0.2},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-08.png",
            width = 136,
            height = 117,
            shift = {0.0, 0.0},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-09.png",
            width = 157,
            height = 115,
            shift = {0.1, 0.0},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-10.png",
            width = 198,
            height = 153,
            shift = {0.325, -0.1},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-11.png",
            width = 190,
            height = 115,
            shift = {0.453125, 0.0},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-12.png",
            width = 229,
            height = 126,
            shift = {0.539062, -0.015625},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-13.png",
            width = 151,
            height = 125,
            shift = {0.0703125, 0.179688},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-14.png",
            width = 137,
            height = 117,
            shift = {0.160938, 0.0},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-15.png",
            width = 201,
            height = 141,
            shift = {0.242188, -0.195312},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/big-sand-rock-16.png",
            width = 209,
            height = 154,
            shift = {0.351562, -0.1},
            scale = 0.5
          }
        }
      },
      {
        name = "arig-medium-sand-rock",
        type = "simple-entity",
        flags = {"placeable-neutral", "placeable-off-grid"},
        order = "d[remnants]-d[sand-rock]-b[medium]",
        collision_mask = {layers = {water_tile = true, player = true}},
        collision_box = {{-0.2, 0}, {0.8, 1}},
        selection_box = {{-0.2, 0}, {0.8, 1}},
        icon = "__base__/graphics/icons/big-sand-rock.png",
        subgroup = "grass",
        render_layer = "object",
        deconstruction_alternative = "big-rock",
        autoplace = {
           probability_expression = 
            "0.0001 * (0.1 * (rock_cluster_mask)) \z
            + ((rock_frequency_scaled) + 0.006 * ((rock_size_scaled) - 0.3)) \z
            * (clamp( (rock_size_scaled) - abs(rock_cluster_noise), 0, 1))",
           local_expressions = {
              rock_size = "control:arig_rocks:size",
              rock_frequency = "control:arig_rocks:frequency",
              rock_size_scaled = "rock_size * (0.06)",
              rock_frequency_scaled = "rock_frequency * (2)",
              rock_cluster_noise = "multioctave_noise{ x = x, y = y, seed0 = map_seed, seed1 = map_seed + 5678, octaves = 4, persistence = 0.5, input_scale = 1, output_scale = 1}",
              rock_cluster_mask = "multioctave_noise{ x = x, y = y, seed0 = map_seed, seed1 = map_seed + 5678, octaves = 3, persistence = 0.6, input_scale = 1, output_scale = 1}",
          },
        },
        dying_trigger_effect = decorative_trigger_effects.medium_rock(),
        minable =
        {
          mining_particle = "stone-particle",
          mining_time = 1,
          results = {
            {type = "item", name = "stone", amount_min = 5, amount_max = 12},
            {type = "item", name = "coal", amount_min = 5, amount_max = 12},
            {type = "item", name = "iron-ore", amount_min = 5, amount_max = 12},
            {type = "item", name = "copper-ore", amount_min = 5, amount_max = 12},
        }
        },
        resistances =
        {
          {
            type = "fire",
            percent = 100
          }
        },
        map_color = {129, 105, 78},
        count_as_rock_for_filtered_deconstruction = true,
        mined_sound = sounds.deconstruct_bricks(1.0),
        trigger_effect = decorative_trigger_effects.medium_rock(),
        pictures =
        {
          {
            filename = "__base__/graphics/decorative/sand-rock/medium-sand-rock-01.png",
            priority = base_decorative_sprite_priority,
            width = 134,
            height = 82,
            shift = {0.328125, 0.515625},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/medium-sand-rock-02.png",
            priority = base_decorative_sprite_priority,
            width = 110,
            height = 79,
            shift = {0.15625, 0.570312},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/medium-sand-rock-03.png",
            priority = base_decorative_sprite_priority,
            width = 90,
            height = 60,
            shift = {0.34375, 0.484375},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/medium-sand-rock-04.png",
            priority = base_decorative_sprite_priority,
            width = 110,
            height = 89,
            shift = {0.296875, 0.476562},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/medium-sand-rock-05.png",
            priority = base_decorative_sprite_priority,
            width = 106,
            height = 76,
            shift = {0.359375, 0.25},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/medium-sand-rock-06.png",
            priority = base_decorative_sprite_priority,
            width = 100,
            height = 92,
            shift = {0.4375, 0.296875},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/medium-sand-rock-07.png",
            priority = base_decorative_sprite_priority,
            width = 82,
            height = 83,
            shift = {0.59375, 0.398438},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/medium-sand-rock-08.png",
            priority = base_decorative_sprite_priority,
            width = 123,
            height = 92,
            shift = {0.601562, 0.328125},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/medium-sand-rock-09.png",
            priority = base_decorative_sprite_priority,
            width = 146,
            height = 76,
            shift = {0.5625, 0.3125},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/medium-sand-rock-10.png",
            priority = base_decorative_sprite_priority,
            width = 112,
            height = 77,
            shift = {0.46875, 0.460938},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/medium-sand-rock-11.png",
            priority = base_decorative_sprite_priority,
            width = 91,
            height = 61,
            shift = {0.445312, 0.507812},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/medium-sand-rock-12.png",
            priority = base_decorative_sprite_priority,
            width = 105,
            height = 84,
            shift = {0.398438, 0.453125},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/medium-sand-rock-13.png",
            priority = base_decorative_sprite_priority,
            width = 94,
            height = 73,
            shift = {0.375, 0.632812},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/medium-sand-rock-14.png",
            priority = base_decorative_sprite_priority,
            width = 122,
            height = 89,
            shift = {0.359375, 0.570312},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/medium-sand-rock-15.png",
            priority = base_decorative_sprite_priority,
            width = 98,
            height = 65,
            shift = {0.1875, 0.773438},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/medium-sand-rock-16.png",
            priority = base_decorative_sprite_priority,
            width = 144,
            height = 76,
            shift = {0.109375, 0.71875},
            scale = 0.5
          }
        }
      },
    
      {
        name = "arig-small-sand-rock",
        type = "optimized-decorative",
        order = "d[remnants]-d[sand-rock]-a[small]",
        collision_mask = {layers = {water_tile = true, doodad = true}},
        collision_box = {{0, 0}, {1, 1}},
        tile_layer = 253,
        autoplace =
        {
           probability_expression = 
            "0.0001 * (0.1 * (rock_cluster_mask)) \z
            + ((rock_frequency_scaled) + 0.006 * ((rock_size_scaled) - 0.3)) \z
            * (clamp( (rock_size_scaled) - abs(rock_cluster_noise), 0, 1))",
           local_expressions = {
              rock_size = "control:arig_rocks:size",
              rock_frequency = "control:arig_rocks:frequency",
              rock_size_scaled = "rock_size * (0.05)",
              rock_frequency_scaled = "rock_frequency * (10)",
              rock_cluster_noise = "multioctave_noise{ x = x, y = y, seed0 = map_seed, seed1 = map_seed + 5678, octaves = 4, persistence = 0.5, input_scale = 1, output_scale = 1}",
              rock_cluster_mask = "multioctave_noise{ x = x, y = y, seed0 = map_seed, seed1 = map_seed + 5678, octaves = 3, persistence = 0.6, input_scale = 1, output_scale = 1}",
          },
      },
        walking_sound = tile_sounds.walking.pebble,
        trigger_effect = decorative_trigger_effects.small_rock(),
        pictures =
        {
          {
            filename = "__base__/graphics/decorative/sand-rock/small-sand-rock-01.png",
            priority = base_decorative_sprite_priority,
            width = 56,
            height = 45,
            shift = {0.40625, 0.476562},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/small-sand-rock-02.png",
            priority = base_decorative_sprite_priority,
            width = 54,
            height = 45,
            shift = {0.296875, 0.476562},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/small-sand-rock-03.png",
            priority = base_decorative_sprite_priority,
            width = 44,
            height = 40,
            shift = {0.328125, 0.53125},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/small-sand-rock-04.png",
            priority = base_decorative_sprite_priority,
            width = 60,
            height = 43,
            shift = {0.265625, 0.601562},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/small-sand-rock-05.png",
            priority = base_decorative_sprite_priority,
            width = 52,
            height = 48,
            shift = {0.296875, 0.46875},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/small-sand-rock-06.png",
            priority = base_decorative_sprite_priority,
            width = 57,
            height = 39,
            shift = {0.554688, 0.523438},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/small-sand-rock-07.png",
            priority = base_decorative_sprite_priority,
            width = 73,
            height = 41,
            shift = {0.570312, 0.539062},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/small-sand-rock-08.png",
            priority = base_decorative_sprite_priority,
            width = 50,
            height = 46,
            shift = {0.640625, 0.390625},
            scale = 0.5
          },
           {
            filename = "__base__/graphics/decorative/sand-rock/small-sand-rock-09.png",
            priority = base_decorative_sprite_priority,
            width = 52,
            height = 43,
            shift = {0.671875, 0.335938},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/small-sand-rock-10.png",
            priority = base_decorative_sprite_priority,
            width = 63,
            height = 39,
            shift = {0.632812, 0.398438},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/small-sand-rock-11.png",
            priority = base_decorative_sprite_priority,
            width = 57,
            height = 41,
            shift = {0.460938, 0.617188},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/small-sand-rock-12.png",
            priority = base_decorative_sprite_priority,
            width = 67,
            height = 51,
            shift = {0.460938, 0.570312},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/small-sand-rock-13.png",
            priority = base_decorative_sprite_priority,
            width = 70,
            height = 37,
            shift = {0.484375, 0.789062},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/small-sand-rock-14.png",
            priority = base_decorative_sprite_priority,
            width = 63,
            height = 48,
            shift = {0.179688, 0.90625},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/small-sand-rock-15.png",
            priority = base_decorative_sprite_priority,
            width = 56,
            height = 48,
            shift = {0.140625, 0.78125},
            scale = 0.5
          },
          {
            filename = "__base__/graphics/decorative/sand-rock/small-sand-rock-16.png",
            priority = base_decorative_sprite_priority,
            width = 74,
            height = 46,
            shift = {-0.03125, 0.78125},
            scale = 0.5
          }
        },
    },
    {
      name = "arig-red-desert-decal",
      type = "optimized-decorative",
      order = "b[decorative]-b[red-desert-decal]",
      collision_box = {{-4.40625, -5.6875}, {4.375, 5.625}},
      collision_mask = {layers={doodad=true, water_tile=true}, not_colliding_with_itself=true},
      walking_sound = tile_sounds.walking.mud,
      render_layer = "decals",
      tile_layer = 255,
      autoplace =
      {
        probability_expression = "plateau_level * clamp(-1.5 + noise_layer_noise('red-desert-decal')\z
                                        + min(range_select(moisture, 0.3, 0.7, 0.05, -1, 1),\z
                                              range_select(aux, 0.7, 1, 0.05, -1, 1)),\z
                                        0, 0.01)"
      },
      pictures =
      {
        --redDecal
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-red-desert-decal/red-desert-decal-01.png",
          width = 553,
          height = 753,
          dice_y = 2,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-red-desert-decal/red-desert-decal-02.png",
          width = 567,
          height = 471,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-red-desert-decal/red-desert-decal-03.png",
          width = 567,
          height = 425,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-red-desert-decal/red-desert-decal-04.png",
          width = 557,
          height = 565,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-red-desert-decal/red-desert-decal-05.png",
          width = 555,
          height = 563,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-red-desert-decal/red-desert-decal-06.png",
          width = 567,
          height = 565,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-red-desert-decal/red-desert-decal-07.png",
          width = 567,
          height = 565,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-red-desert-decal/red-desert-decal-09.png",
          width = 567,
          height = 565,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-red-desert-decal/red-desert-decal-11.png",
          width = 371,
          height = 409,
          scale = 0.5
        }
      }
    },
    {
      name = "arig-sand-decal",
      type = "optimized-decorative",
      order = "b[decorative]-b[red-desert-decal]",
      collision_box = {{-7.21875, -5.9375}, {7.3125, 5.71875}},
      collision_mask = {layers={doodad=true, water_tile=true}, not_colliding_with_itself=true},
      walking_sound = tile_sounds.walking.mud,
      render_layer = "decals",
      tile_layer = 255, -- despite the name, this is not a sand exclusive decal
      autoplace =
      {
        probability_expression = "plateau_level * clamp(-1.5 + noise_layer_noise('sand-decal')\z
                                        + min(range_select(moisture, 0.1, 1, 0.05, -1, 1),\z
                                              range_select(aux, 0.4, 0.9, 0.05, -1, 1)),\z
                                        0, 0.01)"
      },
      pictures =
      {
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-sand-decal/sand-decal-01.png",
          width = 975,
          height = 664,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-sand-decal/sand-decal-02.png",
          width = 628,
          height = 477,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-sand-decal/sand-decal-03.png",
          width = 519,
          height = 331,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-sand-decal/sand-decal-04.png",
          width = 870,
          height = 781,
          dice_y = 2,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-sand-decal/sand-decal-05.png",
          width = 230,
          height = 161,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-sand-decal/sand-decal-06.png",
          width = 140,
          height = 110,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-sand-decal/sand-decal-07.png",
          width = 285,
          height = 243,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-sand-decal/sand-decal-08.png",
          width = 156,
          height = 85,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-sand-decal/sand-decal-09.png",
          width = 212,
          height = 152,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-sand-decal/sand-decal-10.png",
          width = 233,
          height = 197,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-sand-decal/sand-decal-11.png",
          width = 324,
          height = 413,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-sand-decal/sand-decal-12.png",
          width = 504,
          height = 488,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-sand-decal/sand-decal-13.png",
          width = 329,
          height = 305,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-sand-decal/sand-decal-15.png",
          width = 266,
          height = 262,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-sand-decal/sand-decal-16.png",
          width = 921,
          height = 712,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-sand-decal/sand-decal-17.png",
          width = 722,
          height = 395,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-sand-decal/sand-decal-18.png",
          width = 187,
          height = 289,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-sand-decal/sand-decal-19.png",
          width = 999,
          height = 374,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-sand-decal/sand-decal-20.png",
          width = 783,
          height = 399,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-sand-decal/sand-decal-21.png",
          width = 668,
          height = 406,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-sand-decal/sand-decal-22.png",
          width = 437,
          height = 318,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-sand-decal/sand-decal-23.png",
          width = 394,
          height = 246,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-sand-decal/sand-decal-25.png",
          width = 1290,
          height = 1281,
          dice_y = 4,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-sand-decal/sand-decal-26.png",
          width = 314,
          height = 174,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-sand-decal/sand-decal-27.png",
          width = 348,
          height = 264,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-sand-decal/sand-decal-28.png",
          width = 488,
          height = 357,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-sand-decal/sand-decal-29.png",
          width = 594,
          height = 634,
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-sand-decal/sand-decal-30.png",
          width = 195,
          height = 215,
          scale = 0.5
        }
      }
    },
{
      name = "arig-small-cactus",
      type = "optimized-decorative",
      order = "b[decorative]-g[fluff]-a[normal]-a[brown]",
      collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
      collision_mask = {layers={doodad=true, water_tile=true}, not_colliding_with_itself=true},
      walking_sound = tile_sounds.walking.big_bush,
      trigger_effect = decorative_trigger_effects.brown_fluff(),
      render_layer = "object",
      tile_layer = 255,
      minimal_separation = 1,
      autoplace =
      {
        order = "a[doodad]-i[fluff]-a",
        probability_expression = "plateau_level * (-2.6 + rpi(1.2) + (garballo_noise + 1 - min(0, decorative_knockout)) + region_box)",
        local_expressions =
        {
          region_box = "min(range_select{input = moisture, from = 0.4, to = 1, slope = 0.05, min = -10, max = 1},\z
                            range_select{input = temperature, from = 5, to = 50, slope = 0.5, min = -10, max = 1})"
        }
      },
      pictures =
      {
        --cactus
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-1.png",
          priority = base_decorative_sprite_priority,
          width = 92,
          height = 61,
          shift = util.by_pixel(3, -1.75),
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-2.png",
          priority = base_decorative_sprite_priority,
          width = 92,
          height = 61,
          shift = util.by_pixel(2.75, 0),
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-3.png",
          priority = base_decorative_sprite_priority,
          width = 92,
          height = 90,
          shift = util.by_pixel(2.75, 0),
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-4.png",
          priority = base_decorative_sprite_priority,
          width = 92,
          height = 90,
          shift = util.by_pixel(12, -8),
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-5.png",
          priority = base_decorative_sprite_priority,
          width = 92,
          height = 90,
          shift = util.by_pixel(25, -20),
          scale = 1
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-6.png",
          priority = base_decorative_sprite_priority,
          width = 92,
          height = 90,
          shift = util.by_pixel(25, -20),
          scale = 1
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-7.png",
          priority = base_decorative_sprite_priority,
          width = 92,
          height = 90,
          shift = util.by_pixel(25, -20),
          scale = 1
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-8.png",
          priority = base_decorative_sprite_priority,
          width = 92,
          height = 90,
          shift = util.by_pixel(25, -20),
          scale = 1
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-9.png",
          priority = base_decorative_sprite_priority,
          width = 92,
          height = 90,
          shift = util.by_pixel(15, -20),
          scale = 0.8
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-10.png",
          priority = base_decorative_sprite_priority,
          width = 92,
          height = 90,
          shift = util.by_pixel(25, -20),
          scale = 1
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-11.png",
          priority = base_decorative_sprite_priority,
          width = 92,
          height = 90,
          shift = util.by_pixel(30, -20),
          scale = 1
        },
      },
    },
       {
      name = "arig-small-cactus-plant",
      type = "simple-entity",
      flags = {"placeable-neutral", "placeable-off-grid"},
      icon = "__planetaris-arig__/graphics/icons/small-cactus.png",
      subgroup = "grass",
      order = "b[decorative]-z-b",
      collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
      selection_box = {{-0.3, -0.3}, {0.3, 0.3}},
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
          results = {{type = "item", name = "planetaris-cactus", amount_min = 1, amount_max = 5}},
        },
      pictures =
      {
        --cactus
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-1.png",
          priority = base_decorative_sprite_priority,
          width = 92,
          height = 61,
          shift = util.by_pixel(3, -1.75),
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-2.png",
          priority = base_decorative_sprite_priority,
          width = 92,
          height = 61,
          shift = util.by_pixel(2.75, 0),
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-3.png",
          priority = base_decorative_sprite_priority,
          width = 92,
          height = 90,
          shift = util.by_pixel(2.75, 0),
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-4.png",
          priority = base_decorative_sprite_priority,
          width = 92,
          height = 90,
          shift = util.by_pixel(12, -8),
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-5.png",
          priority = base_decorative_sprite_priority,
          width = 92,
          height = 90,
          shift = util.by_pixel(25, -20),
          scale = 1
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-6.png",
          priority = base_decorative_sprite_priority,
          width = 92,
          height = 90,
          shift = util.by_pixel(25, -20),
          scale = 1
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-7.png",
          priority = base_decorative_sprite_priority,
          width = 92,
          height = 90,
          shift = util.by_pixel(25, -20),
          scale = 1
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-8.png",
          priority = base_decorative_sprite_priority,
          width = 92,
          height = 90,
          shift = util.by_pixel(25, -20),
          scale = 1
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-9.png",
          priority = base_decorative_sprite_priority,
          width = 92,
          height = 90,
          shift = util.by_pixel(15, -20),
          scale = 0.8
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-10.png",
          priority = base_decorative_sprite_priority,
          width = 92,
          height = 90,
          shift = util.by_pixel(25, -20),
          scale = 1
        },
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-small-cactus/arig-cactus-11.png",
          priority = base_decorative_sprite_priority,
          width = 92,
          height = 90,
          shift = util.by_pixel(30, -20),
          scale = 1
        },
      },
    },
    {
     name = "arig-crack-decal",
     type = "optimized-decorative",
     order = "b[decorative]-b[red-desert-decal]",
     collision_box = {{-1, -1}, {1, 1}},
      collision_mask = {layers={water_tile=true, doodad=true}, colliding_with_tiles_only=true},
      render_layer = "decals",
      tile_layer = decal_tile_layer -5,
      walking_sound = tile_sounds.walking.pebble,
      autoplace =
      {
        order = "c[doodad]-z",
        probability_expression = "plateau_level * (-1.9 + asterisk_noise + max(0, decorative_knockout) + rpi(0.4) + region_box)",
        local_expressions =
        {
          region_box = "max(min(range_select{input = moisture, from = 0, to = 0.2, slope = 0.05, min = -10, max = 1},\z
                                range_select{input = aux, from = 0.1, to = 0.6, slope = 0.05, min = -10, max = 1},\z
                                range_select{input = temperature, from = 14, to = 20, slope = 0.5, min = -10, max = 1}),\z
                            min(range_select{input = moisture, from = 0.8, to = 1, slope = 0.05, min = -10, max = 1},\z
                                range_select{input = aux, from = 0.8, to = 1, slope = 0.05, min = -10, max = 1},\z
                                range_select{input = temperature, from = 10, to = 14, slope = 0.5, min = -10, max = 1}))"
        }
      },
      pictures = get_decal_pictures("__planetaris-arig__/graphics/decorative/arig-cracks/arig-cracks-", "large-", 128, 20)
    },
      {
    name = "arig-crack-decal-large",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]-b[sand]",
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer -4,
    walking_sound = tile_sounds.walking.pebble,
      autoplace =
      {
        order = "c[doodad]-z",
        probability_expression = "plateau_level * (-1.5 + asterisk_noise + max(0, decorative_knockout) + rpi(0.8) + region_box)",
        local_expressions =
        {
          region_box = "max(min(range_select{input = moisture, from = 0, to = 0.2, slope = 0.05, min = -10, max = 1},\z
                                range_select{input = aux, from = 0.1, to = 0.6, slope = 0.05, min = -10, max = 1},\z
                                range_select{input = temperature, from = 14, to = 20, slope = 0.5, min = -10, max = 1}),\z
                            min(range_select{input = moisture, from = 0.8, to = 1, slope = 0.05, min = -10, max = 1},\z
                                range_select{input = aux, from = 0.8, to = 1, slope = 0.05, min = -10, max = 1},\z
                                range_select{input = temperature, from = 10, to = 14, slope = 0.5, min = -10, max = 1}))"
        }
      },
    pictures = get_decal_pictures("__planetaris-arig__/graphics/decorative/arig-cracks/arig-cracks-", "huge-", 256, 20)
  },
    --- ROCK CLUSTERS
  {
    name = "arig-tiny-rock-cluster",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]-b[sand]",
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    collision_mask = {layers={water_tile=true, doodad=true}, colliding_with_tiles_only=true},
    render_layer = "decorative",
    tile_layer =  253,
    walking_sound = tile_sounds.walking.pebble,
    autoplace =
    {
      order = "d[ground-surface]-i[rock]-c[cluster]",
      placement_density = 2,
      probability_expression = "vulcanus_rock_cluster"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/tiny-volcanic-rock-cluster/tiny-volcanic-rock-cluster-", "", 128, 8,tintable_rock_tint,true)
  },
    --- SAND DUNES
  {
    name = "arig-dune-decal",
    type = "optimized-decorative",
    order = "a[fulgora]-b[decorative]",
    collision_box = {{-5, -5}, {5, 5}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer = 220,
    autoplace = {
      order = "d[ground-surface]-h[dune]-a[relief]",
      probability_expression = "vulcanus_dune_decal"
    },
    pictures = get_decal_pictures("__planetaris-arig__/graphics/decorative/arig-dune-decal/arig-dune-decal-", "", 512, 20)
  },
  {
    name = "arig-pumice-relief-decal",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]",
    collision_box = {{-5, -5}, {5, 5}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer = 220,
    walking_sound = tile_sounds.walking.pebble,
    autoplace = {
      order = "d[ground-surface]-d[relief]-b[rocky]",
      probability_expression = "pumice_relief_decal"
    },
    pictures = get_decal_pictures("__planetaris-arig__/graphics/decorative/arig-relief-decal/arig-pumice-relief-", "", 1024, 19)
  },
    {
      name = "arig-brown-fluff",
      type = "optimized-decorative",
      order = "b[decorative]-g[fluff]-a[normal]-a[brown]",
      collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
      collision_mask = {layers={doodad=true, water_tile=true}, not_colliding_with_itself=true},
      walking_sound = tile_sounds.walking.big_bush,
      trigger_effect = decorative_trigger_effects.brown_fluff(),
      autoplace =
      {
        order = "a[doodad]-i[fluff]-a",
        probability_expression = "plateau_level * (-1.4 + rpi(0.7) + (garballo_noise - min(0, decorative_knockout)) + region_box)",
        local_expressions =
        {
          region_box = "min(range_select{input = moisture, from = 0.4, to = 1, slope = 0.05, min = -10, max = 1},\z
                            range_select{input = temperature, from = 15, to = 20, slope = 0.5, min = -10, max = 1})"
        }
      },
      pictures =
      {
        --fluff
        {
          filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-00.png",
          priority = base_decorative_sprite_priority,
          width = 56,
          height = 39,
          shift = util.by_pixel(3, -1.75),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-01.png",
          priority = base_decorative_sprite_priority,
          width = 59,
          height = 50,
          shift = util.by_pixel(2.75, 0),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-02.png",
          priority = base_decorative_sprite_priority,
          width = 65,
          height = 41,
          shift = util.by_pixel(-0.25, -1.25),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-03.png",
          priority = base_decorative_sprite_priority,
          width = 63,
          height = 47,
          shift = util.by_pixel(2.25, -1.75),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-04.png",
          priority = base_decorative_sprite_priority,
          width = 70,
          height = 43,
          shift = util.by_pixel(3, -2.25),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-05.png",
          priority = base_decorative_sprite_priority,
          width = 57,
          height = 47,
          shift = util.by_pixel(2.25, -1.25),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-06.png",
          priority = base_decorative_sprite_priority,
          width = 62,
          height = 47,
          shift = util.by_pixel(2.5, -2.75),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-07.png",
          priority = base_decorative_sprite_priority,
          width = 81,
          height = 45,
          shift = util.by_pixel(-0.25, -3.25),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-08.png",
          priority = base_decorative_sprite_priority,
          width = 58,
          height = 49,
          shift = util.by_pixel(3.5, 0.25),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-09.png",
          priority = base_decorative_sprite_priority,
          width = 71,
          height = 48,
          shift = util.by_pixel(-0.25, 0.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-10.png",
          priority = base_decorative_sprite_priority,
          width = 67,
          height = 57,
          shift = util.by_pixel(0.75, -1.25),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-11.png",
          priority = base_decorative_sprite_priority,
          width = 59,
          height = 39,
          shift = util.by_pixel(2.25, -1.25),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-12.png",
          priority = base_decorative_sprite_priority,
          width = 66,
          height = 51,
          shift = util.by_pixel(3, 0.25),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-13.png",
          priority = base_decorative_sprite_priority,
          width = 53,
          height = 40,
          shift = util.by_pixel(1.75, 0),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-14.png",
          priority = base_decorative_sprite_priority,
          width = 56,
          height = 32,
          shift = util.by_pixel(0, -2),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-15.png",
          priority = base_decorative_sprite_priority,
          width = 52,
          height = 39,
          shift = util.by_pixel(2, -1.25),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-16.png",
          priority = base_decorative_sprite_priority,
          width = 56,
          height = 39,
          shift = util.by_pixel(3, -1.75),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-17.png",
          priority = base_decorative_sprite_priority,
          width = 56,
          height = 39,
          shift = util.by_pixel(3, -2.25),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-18.png",
          priority = base_decorative_sprite_priority,
          width = 56,
          height = 39,
          shift = util.by_pixel(3, -2.25),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff/brown-fluff-19.png",
          priority = base_decorative_sprite_priority,
          width = 56,
          height = 39,
          shift = util.by_pixel(3, -2.25),
          scale = 0.5
        }
      }
    },
    {
      name = "arig-brown-fluff-dry",
      type = "optimized-decorative",
      order = "b[decorative]-g[fluff]-b[dry]-a[brown]",
      collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
      collision_mask = {layers={doodad=true, water_tile=true}, not_colliding_with_itself=true},
      walking_sound = tile_sounds.walking.big_bush,
      trigger_effect = decorative_trigger_effects.brown_fluff_dry(),
      autoplace =
      {
        order = "a[doodad]-i[fluff]-b",
        probability_expression = "plateau_level * (-1.5 + rpi(0.5) + (croton_noise - min(0, decorative_knockout)) + region_box)",
        local_expressions =
        {
          region_box = "min(range_select{input = moisture, from = 0.1, to = 0.4, slope = 0.05, min = -10, max = 1},\z
                            range_select{input = temperature, from = 15, to = 20, slope = 0.5, min = -10, max = 1})"
        }
      },
      pictures =
      {
        --dryFluff
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-00.png",
          priority = base_decorative_sprite_priority,
          width = 67,
          height = 44,
          shift = util.by_pixel(3.25, -2),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-01.png",
          priority = base_decorative_sprite_priority,
          width = 76,
          height = 58,
          shift = util.by_pixel(3, -1),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-02.png",
          priority = base_decorative_sprite_priority,
          width = 75,
          height = 44,
          shift = util.by_pixel(1.75, -1.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-03.png",
          priority = base_decorative_sprite_priority,
          width = 65,
          height = 54,
          shift = util.by_pixel(2.25, -1.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-04.png",
          priority = base_decorative_sprite_priority,
          width = 88,
          height = 55,
          shift = util.by_pixel(4, -3.25),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-05.png",
          priority = base_decorative_sprite_priority,
          width = 63,
          height = 49,
          shift = util.by_pixel(2.25, -0.75),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-06.png",
          priority = base_decorative_sprite_priority,
          width = 74,
          height = 50,
          shift = util.by_pixel(3.5, -2.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-07.png",
          priority = base_decorative_sprite_priority,
          width = 89,
          height = 53,
          shift = util.by_pixel(-1.75, -3.75),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-08.png",
          priority = base_decorative_sprite_priority,
          width = 70,
          height = 58,
          shift = util.by_pixel(1.5, -1.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-09.png",
          priority = base_decorative_sprite_priority,
          width = 83,
          height = 53,
          shift = util.by_pixel(1.25, -0.25),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-10.png",
          priority = base_decorative_sprite_priority,
          width = 76,
          height = 61,
          shift = util.by_pixel(2.5, -2.25),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-11.png",
          priority = base_decorative_sprite_priority,
          width = 71,
          height = 50,
          shift = util.by_pixel(1.75, -2),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-12.png",
          priority = base_decorative_sprite_priority,
          width = 79,
          height = 57,
          shift = util.by_pixel(3.75, -0.25),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-13.png",
          priority = base_decorative_sprite_priority,
          width = 60,
          height = 50,
          shift = util.by_pixel(0.5, -1.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-14.png",
          priority = base_decorative_sprite_priority,
          width = 65,
          height = 38,
          shift = util.by_pixel(0.75, -2.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-15.png",
          priority = base_decorative_sprite_priority,
          width = 65,
          height = 51,
          shift = util.by_pixel(1.25, -1.25),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-16.png",
          priority = base_decorative_sprite_priority,
          width = 51,
          height = 39,
          shift = util.by_pixel(1.25, -1.25),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-17.png",
          priority = base_decorative_sprite_priority,
          width = 49,
          height = 38,
          shift = util.by_pixel(1.75, -1),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-18.png",
          priority = base_decorative_sprite_priority,
          width = 53,
          height = 35,
          shift = util.by_pixel(1.25, -1.25),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/brown-fluff-dry/brown-fluff-dry-19.png",
          priority = base_decorative_sprite_priority,
          width = 46,
          height = 33,
          shift = util.by_pixel(1, -1.25),
          scale = 0.5
        }
      }
    },
    {
      name = "arig-white-desert-bush",
      type = "optimized-decorative",
      order = "b[decorative]-g[red-desert-bush]",
      collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
      collision_mask = {layers={doodad=true, water_tile=true}, not_colliding_with_itself=true},
      walking_sound = tile_sounds.walking.big_bush,
      trigger_effect = decorative_trigger_effects.white_desert_bush(),
      autoplace =
      {
        order = "a[doodad]-g[asterisk]-b",
        probability_expression = "plateau_level * (-1.9 + asterisk_noise + max(0, decorative_knockout) + rpi(0.8) + region_box)",
        local_expressions =
        {
          region_box = "max(min(range_select{input = moisture, from = 0, to = 0.2, slope = 0.05, min = -10, max = 1},\z
                                range_select{input = aux, from = 0.1, to = 0.6, slope = 0.05, min = -10, max = 1},\z
                                range_select{input = temperature, from = 14, to = 20, slope = 0.5, min = -10, max = 1}),\z
                            min(range_select{input = moisture, from = 0.8, to = 1, slope = 0.05, min = -10, max = 1},\z
                                range_select{input = aux, from = 0.8, to = 1, slope = 0.05, min = -10, max = 1},\z
                                range_select{input = temperature, from = 10, to = 14, slope = 0.5, min = -10, max = 1}))"
        }
      },
      pictures =
      {
        --wdbush
        {
          filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-00.png",
          priority = base_decorative_sprite_priority,
          width = 62,
          height = 40,
          shift = util.by_pixel(5.5, -3.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-01.png",
          priority = base_decorative_sprite_priority,
          width = 57,
          height = 49,
          shift = util.by_pixel(5.75, -3.75),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-02.png",
          priority = base_decorative_sprite_priority,
          width = 63,
          height = 39,
          shift = util.by_pixel(4.25, -2.75),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-03.png",
          priority = base_decorative_sprite_priority,
          width = 71,
          height = 46,
          shift = util.by_pixel(4.75, -3.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-04.png",
          priority = base_decorative_sprite_priority,
          width = 68,
          height = 45,
          shift = util.by_pixel(4, -4.25),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-05.png",
          priority = base_decorative_sprite_priority,
          width = 52,
          height = 42,
          shift = util.by_pixel(4.5, -2.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-06.png",
          priority = base_decorative_sprite_priority,
          width = 83,
          height = 54,
          shift = util.by_pixel(5.75, -4.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-07.png",
          priority = base_decorative_sprite_priority,
          width = 78,
          height = 62,
          shift = util.by_pixel(7, -3),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-08.png",
          priority = base_decorative_sprite_priority,
          width = 91,
          height = 60,
          shift = util.by_pixel(6.25, -2.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-09.png",
          priority = base_decorative_sprite_priority,
          width = 78,
          height = 49,
          shift = util.by_pixel(3, -4.75),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-10.png",
          priority = base_decorative_sprite_priority,
          width = 72,
          height = 59,
          shift = util.by_pixel(6, -1.75),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-11.png",
          priority = base_decorative_sprite_priority,
          width = 93,
          height = 51,
          shift = util.by_pixel(4.25, -2.25),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-12.png",
          priority = base_decorative_sprite_priority,
          width = 58,
          height = 47,
          shift = util.by_pixel(4, -6.25),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-13.png",
          priority = base_decorative_sprite_priority,
          width = 69,
          height = 54,
          shift = util.by_pixel(9.25, -4),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-14.png",
          priority = base_decorative_sprite_priority,
          width = 69,
          height = 43,
          shift = util.by_pixel(5.25, -3.25),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-15.png",
          priority = base_decorative_sprite_priority,
          width = 55,
          height = 38,
          shift = util.by_pixel(8.75, -3.5),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-16.png",
          priority = base_decorative_sprite_priority,
          width = 48,
          height = 38,
          shift = util.by_pixel(-0.5, -2),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-17.png",
          priority = base_decorative_sprite_priority,
          width = 43,
          height = 33,
          shift = util.by_pixel(2.25, -5.25),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-18.png",
          priority = base_decorative_sprite_priority,
          width = 46,
          height = 35,
          shift = util.by_pixel(3.5, -1.75),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/decorative/white-desert-bush/white-desert-bush-19.png",
          priority = base_decorative_sprite_priority,
          width = 45,
          height = 27,
          shift = util.by_pixel(3.75, -2.75),
          scale = 0.5
        }
      }
    },
})