local tile = require("prototypes/tile/tile")
local tile_collision_masks = require("__base__/prototypes/tile/tile-collision-masks")


local arig_cliff = table.deepcopy(data.raw["cliff"]["cliff"])  
arig_cliff.name = "arig-cliff" 

arig_cliff.autoplace = {
  control = "arig_cliff",
  order = "c-z-c",
  category = "cliff",
  sharpness = 0.7,
  richness = false,
  probability_expression = "clamp(0, 1, (arig_cliff_elevation - 0.1) * 0.8)"
}

data:extend({
  { 
    type = "noise-expression",
    name = "arig_cliff_size",
    expression = "control:arig_cliff:size" 
  },
  {
    type = "noise-expression",
    name = "arig_cliffiness",
    expression = "control:arig_cliff:frequency" 
  },
  {
    type = "noise-expression",
    name = "arig_cliff_elevation",
    expression = "multioctave_noise{x = map_seed, y = map_seed, persistence = 0.75, seed0 = map_seed, seed1 = map_seed + 5678, octaves = 6, input_scale = 1, output_scale = 1}"
  }
})

data:extend({
  {
    type = "noise-expression",
    name = "arig_sand_size",
    expression = "control:arig_sand:size"
  },
  {
    type = "noise-expression",
    name = "arig_sand_frequency",
    expression = "control:arig_sand:frequency"
  },
  {
    type = "noise-expression",
    name = "arig_island_shape",
    expression = "max(0, 1 - distance * 3) * (arig_sand_size * 100)"
  },
  {
    type = "noise-expression",
    name = "arig_island_peaks",
    expression = "max(0, 1 - distance * 0.5) * 5"  -- Increase the peak strength and decrease distance effect
  },
  {
    type = "noise-expression",
    name = "arig_sand_solid",
    expression = "max(0, 1 - arig_island_elevation_cliff)"  -- sand should only appear at lower elevations
  },
  {
    type = "noise-expression",
    name = "arig_island_elevation",
    expression = "multioctave_noise{x = x, y = y, seed0 = map_seed, seed1 = map_seed + 1234, persistence = 0.65, octaves = 11 + (arig_sand_size * 0.05), input_scale = 1.2 * (0.5 * arig_sand_frequency), output_scale = 2}",  -- Adjust elevation for clear island peaks
    local_expressions = {
      maxed = "max(formation_clumped, formation_broken)",
      blended = "lerp(formation_clumped, formation_broken, 0.4)",  -- Blend the island elevation based on the peak strength
      formation_clumped = "-30 + (11 * (0.5)) * max(arig_island_peaks, random_island_peaks) + 11 * tri_crack",  -- Centralized elevation for island peaks
      formation_broken  = "-30 + (8 * (0.5)) * max(arig_island_peaks * 1.1, min(0., random_island_peaks - 0.3)) + 7 * (pow(voronoi_large * max(0, voronoi_large_cell * 1.3 - 0.3) + 0.3 * voronoi_small * max(0, aux + 0.2), 0.5))",
      random_island_peaks = "abs(amplitude_corrected_multioctave_noise{x = x, y = y, seed0 = map_seed, seed1 = 1000, input_scale = segmentation_mult / 0.1, offset_x = -10000, octaves = 2, persistence = 0.4, amplitude = 1})",
      voronoi_large = "voronoi_facet_noise{x = x + aquilo_wobble_x * 2, y = y + aquilo_wobble_y * 2, seed0 = map_seed, seed1 = 'aquilo-cracks', grid_size = 36, distance_type = 'euclidean', jitter = 1}",
      voronoi_large_cell = "voronoi_cell_id{x = x + aquilo_wobble_x * 2, y = y + aquilo_wobble_y * 2, seed0 = map_seed, seed1 = 'aquilo-cracks', grid_size = 36, distance_type = 'euclidean', jitter = 1}",
      voronoi_small  = "voronoi_facet_noise{x = x + aquilo_wobble_x * 2, y = y + aquilo_wobble_y * 2, seed0 = map_seed, seed1 = 'aquilo-cracks', grid_size = 20, distance_type = 'euclidean', jitter = 1}",
      tri_crack = "min(aquilo_simple_billows{seed1 = 2000, octaves = 3, input_scale = segmentation_mult / 1.5}, aquilo_simple_billows{seed1 = 3000, octaves = 3, input_scale = segmentation_mult / 1.2}, aquilo_simple_billows{seed1 = 4000, octaves = 3, input_scale = segmentation_mult})",
      segmentation_mult = "aquilo_segmentation_multiplier / 10"
    }
  },
  {
    type = "noise-expression",
    name = "arig_island_elevation_cliff",
    expression = "max(arig_island_elevation * 0.7, arig_island_peaks * 0.8)"  -- Elevation at the cliffs
  },
  {
    type = "noise-expression",
    name = "arig_island_temperature",
    expression = "temperature_basic + 100",  -- Temperature, similar to Aquilo setup
  },
  {
    type = "noise-expression",
    name = "arig_island_sand_transition",
    expression = "max(0, 1 - distance * 1.5)"  -- Transition from land to sand
  },
})

data:extend{arig_cliff}
