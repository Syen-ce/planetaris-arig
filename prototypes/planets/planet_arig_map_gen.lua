local tile = require("prototypes/tile/arig-tile")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")


local arig_cliff = data.raw["cliff"]["arig-cliff"] 

arig_cliff.autoplace = {
  control = "arig_cliff",
  order = "c-z-c",
  category = "cliff",
  sharpness = 10,
  richness = false,
  probability_expression = "0"
}


--------------------------------------- PARAMETERS

-- Island size and spacing
local island_frequency_base = 0.033  -- Lower = bigger islands
local island_size_base = 1.125         -- Base size multiplier
local island_threshold = 0.5       -- Controls where land starts (lower = more land)
local island_noise_octaves = 4
local island_noise_persistence = 0.5

-- elevation levels
local deep_sand_level = -40       -- Deep sand
local shallow_sand_level = -20    -- Shallow water
local beach_level = 0              -- Beach/coast
local plateau_level = 20           -- Upper plateau

-- transition thresholds
local shallow_threshold = 0.35     -- raw < 0.15 = shallow
local beach_threshold = 0.50       -- 0.15 <= raw < 0.35 = beach

-- rugged edge
local edge_roughness_scale = 0.02   -- scale of detail
local edge_roughness_amplitude = 0.3 -- jagged
local edge_roughness_octaves = 4

-- starting island
local starting_island_radius = 50


--------------------------------------- NOISE EXPRESSIONS


data:extend({
  {
    type = "noise-expression",
    name = "terraced_island_base",
    expression = string.format([[
      multioctave_noise{
        x = x,
        y = y,
        seed0 = map_seed,
        seed1 = 12345,
        octaves = %d,
        persistence = %f,
        input_scale = %f,
        output_scale = 1
      }
    ]], 
    island_noise_octaves,
    island_noise_persistence,
    island_frequency_base)
  },

  -- Edge roughness
  {
    type = "noise-expression",
    name = "terraced_island_edge_roughness",
    expression = string.format([[
      multioctave_noise{
        x = x,
        y = y,
        seed0 = map_seed,
        seed1 = 67890,
        octaves = %d,
        persistence = 0.6,
        input_scale = %f,
        output_scale = %f
      }
    ]],
    edge_roughness_octaves,
    edge_roughness_scale,
    edge_roughness_amplitude)
  },

  -- Combined island shape WITH rough edges applied
  {
    type = "noise-expression",
    name = "terraced_island_with_edges",
    expression = string.format([[
      (terraced_island_base + terraced_island_edge_roughness) 
      * 1
      * (%f * (control:arig_sand:size * -1))
    ]], island_size_base)
  },

  {
    type = "noise-expression",
    name = "terraced_starting_island",
    expression = string.format([[
      (distance < %d) * max(0, 
        (1 - distance / %d) + terraced_island_edge_roughness * 0.3
      )
    ]], starting_island_radius, starting_island_radius)
  },

  -- Raw elevation value (before terracing)
  {
    type = "noise-expression",
    name = "arig_island_elevation_raw",
    expression = string.format([[
      terraced_island_with_edges - %f
      + (distance < %d) * terraced_starting_island * 2
    ]], island_threshold, starting_island_radius)
  },

  -- Apply terrace levels
  {
    type = "noise-expression",
    name = "arig_island_elevation",
    expression = string.format([[
      (arig_island_elevation_raw < 0) * %d
      + (arig_island_elevation_raw >= 0) * (arig_island_elevation_raw < %f) * %d
      + (arig_island_elevation_raw >= %f) * (arig_island_elevation_raw < %f) * %d
      + (arig_island_elevation_raw >= %f) * %d
    ]],
    deep_sand_level,
    shallow_threshold,
    shallow_sand_level,
    shallow_threshold,
    beach_threshold,
    beach_level,
    beach_threshold,
    plateau_level)
  },

  {
    type = "noise-expression",
    name = "terraced_cliffiness",
    expression = [[
      (1.0 + 0.5 * multioctave_noise{
        x = x, y = y,
        seed0 = map_seed, seed1 = 99999,
        octaves = 3,
        persistence = 0.5,
        input_scale = 0.1 * control:arig_cliff:frequency,
        output_scale = 1
      }) * control:arig_cliff:size 
    ]]
  },

  -- Expressions for tile/decorative placement
  {
    type = "noise-expression",
    name = "deep_sand_level",
    expression = [[
      (arig_island_elevation_raw < 0)
    ]]
  },
  {
    type = "noise-expression",
    name = "shallow_sand_level",
    expression = string.format([[
      (arig_island_elevation_raw >= 0) * (arig_island_elevation_raw < %f)
    ]], shallow_threshold)
  },
  {
    type = "noise-expression",
    name = "beach_level",
    expression = string.format([[
      (arig_island_elevation_raw >= %f) * (arig_island_elevation_raw < %f)
    ]], shallow_threshold, beach_threshold)
  },
  {
    type = "noise-expression",
    name = "plateau_level",
    expression = string.format([[
      (arig_island_elevation_raw >= %f)
    ]], beach_threshold)
  },

-- Ores

  {
    type = "noise-expression",
    name = "arig_stone_richness",
    expression = "4000 * max(starting, gleba_simple_spot(1222, 7 * size ^ 0.5, 120 / frequency ^ 0.5, plateau_level) * plateau_level) * richness / size",
    local_expressions =
    {
      richness = "control:arig_stone:richness",
      frequency = "control:arig_stone:frequency",
      size = "control:arig_stone:size",
      starting = "starting_spot_at_angle{ angle = gleba_starting_angle + 65 * gleba_starting_direction,\z
                                          distance = 40 * gleba_starting_area_multiplier,\z
                                          radius = 7 * size ^ 0.5,\z
                                          x_distortion = gleba_wobble_x * 8,\z
                                          y_distortion = gleba_wobble_x * 8}"
    }
  },
  {
    type = "noise-expression",
    name = "arig_stone_probability",
    expression = "(control:arig_stone:size > 0) * (arig_stone_richness > 1)"
  },

})


data:extend{arig_cliff}