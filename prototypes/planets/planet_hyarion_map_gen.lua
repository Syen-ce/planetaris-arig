data:extend{
  ---- Constants
  {
    type = "noise-expression",
    name = "hyarion_ore_spacing",
    expression = 128
  },
  {
    type = "noise-expression",
    name = "hyarion_shared_influence",
    expression = 105 * 3
  },
  {
    type = "noise-expression",
    name = "hyarion_biome_contrast",
    expression = 2 -- higher values mean sharper transitions
  },
  {
    type = "noise-expression",
    name = "hyarion_cracks_scale",
    expression = 0.325
  },
  --used to be segmenataion_multiplier
  {
    type = "noise-expression",
    name = "hyarion_segment_scale",
    expression = 1
  },
  {
    --functions more like a cliffiness multiplier as all the mountain tiles have it offset.
    type = "noise-expression",
    name = "hyarion_mountains_elevation_multiplier",
    expression = 1.5
  },

  ---- HELPERS
  {
    type = "noise-expression",
    name = "hyarion_starting_area_multiplier",
    -- reduced richness for starting resources
    expression = "lerp(1, 0.06, clamp(0.5 + hyarion_starting_circle, 0, 1))"
  },
  {
    type = "noise-expression",
    name = "hyarion_richness_multiplier",
    expression = "6 + distance / 10000"
  },
  {
    type = "noise-expression",
    name = "hyarion_scale_multiplier",
    expression = "slider_rescale(control:hyarion_volcanism:frequency, 3)"
  },
  {
    type = "noise-function",
    name = "hyarion_detail_noise",
    parameters = {"seed1", "scale", "octaves", "magnitude"},
    expression = "multioctave_noise{x = x,\z
                                    y = y,\z
                                    seed0 = map_seed,\z
                                    seed1 = seed1 + 12243,\z
                                    octaves = octaves,\z
                                    persistence = 0.6,\z
                                    input_scale = 1 / 50 / scale,\z
                                    output_scale = magnitude}"
  },
  {
    type = "noise-function",
    name = "hyarion_plasma",
    parameters = {"seed", "scale", "scale2", "magnitude1", "magnitude2"},
    expression = "abs(basis_noise{x = x,\z
                                  y = y,\z
                                  seed0 = map_seed,\z
                                  seed1 = 12643,\z
                                  input_scale = 1 / 50 / scale,\z
                                  output_scale = magnitude1}\z
                      - basis_noise{x = x,\z
                                    y = y,\z
                                    seed0 = map_seed,\z
                                    seed1 = 13423 + seed,\z
                                    input_scale = 1 / 50 / scale2,\z
                                    output_scale = magnitude2})"
  },
  {
    type = "noise-function",
    name = "hyarion_threshold",
    parameters = {"value", "threshold"},
    expression = "(value - (1 - threshold)) * (1 / threshold)"
  },
  {
    type = "noise-function",
    name = "hyarion_contrast",
    parameters = {"value", "c"},
    expression = "clamp(value, c, 1) - c"
  },

  ---- ELEVATION
  {
    type = "noise-expression",
    name = "hyarion_elevation",
    --intended_property = "elevation",
    expression = "max(-500, hyarion_elev)"
  },
  ---- TEMPERATURE: Used to place hot vs cold tilesets, e.g. cold - warm - hot cracks.
  {
    type = "noise-expression",
    name = "hyarion_temperature",
    --intended_property = "temperature",
    expression = "100\z
                  + 100 * var('control:temperature:bias')\z
                  - min(hyarion_elev, hyarion_elev / 100)\z
                  - 2 * hyarion_moisture\z
                  - 1 * hyarion_aux\z
                  - 20 * hyarion_valley_biome\z
                  + 200 * max(0, mountain_volcano_spots - 0.6)"
  },
  ---- AUX (0-1): On hyarion this is Rockiness.
  ---- 0 is flat and arranged as paths through rocks.
  ---- 1 are rocky "islands" for rock clusters, chimneys, etc.
  {
    type = "noise-expression",
    name = "hyarion_aux",
    --intended_property = "aux",
    expression = "clamp(min(abs(multioctave_noise{x = x,\z
                                                  y = y,\z
                                                  seed0 = map_seed,\z
                                                  seed1 = 2,\z
                                                  octaves = 5,\z
                                                  persistence = 0.6,\z
                                                  input_scale = 0.2,\z
                                                  output_scale = 0.6}),\z
                            0.3 - 0.6 * hyarion_flood_paths), 0, 1)"
  },
  ---- MOISTURE (0-1): On hyarion used for vegetation clustering.
  ---- 0 is no vegetation, such as crystal bowels in the valley.
  ---- 1 is vegetation pathches (mainly in valley).
  ---- As this drives the crystal bowls, it also has an impact on small rock & pebble placement.
  {
    type = "noise-expression",
    name = "hyarion_moisture",
    --intended_property = "moisture",
    expression = "clamp(1\z
                        - abs(multioctave_noise{x = x,\z
                                                y = y,\z
                                                seed0 = map_seed,\z
                                                seed1 = 4,\z
                                                octaves = 2,\z
                                                persistence = 0.6,\z
                                                input_scale = 0.025,\z
                                                output_scale = 0.25})\z
                        - abs(multioctave_noise{x = x,\z
                                                y = y,\z
                                                seed0 = map_seed,\z
                                                seed1 = 400,\z
                                                octaves = 3,\z
                                                persistence = 0.62,\z
                                                input_scale = 0.051144353,\z
                                                output_scale = 0.25})\z
                        - 0.2 * hyarion_flood_cracks_a, 0, 1)"
  },
  ---- Starting Area blobs
  {
    type = "noise-expression",
    name = "hyarion_starting_area_radius",
    expression = "0.7 * 0.75"
  },
  {
    type = "noise-expression",
    name = "hyarion_starting_direction",
    expression = "-1 + 2 * (map_seed_small & 1)"
  },
  {
    type = "noise-expression",
    name = "hyarion_valley_angle", -- ashland
    expression = "map_seed_normalized * 3600"
  },
  {
    type = "noise-expression",
    name = "hyarion_mountains_angle",
    expression = "hyarion_valley_angle + 120 * hyarion_starting_direction"
  },
  {
    type = "noise-expression",
    name = "hyarion_quartzlands_angle",
    expression = "hyarion_valley_angle + 240 * hyarion_starting_direction"
  },
  {
    type = "noise-expression",
    name = "hyarion_valley_start",
    -- requires more influence because it is smaller and has no mountain boost
    expression = "4 * starting_spot_at_angle{ angle = hyarion_valley_angle,\z
                                              distance = 170 * hyarion_starting_area_radius,\z
                                              radius = 350 * hyarion_starting_area_radius,\z
                                              x_distortion = 0.1 * hyarion_starting_area_radius * (hyarion_wobble_x + hyarion_wobble_large_x + hyarion_wobble_huge_x),\z
                                              y_distortion = 0.1 * hyarion_starting_area_radius * (hyarion_wobble_y + hyarion_wobble_large_y + hyarion_wobble_huge_y)}"
  },
  {
    type = "noise-expression",
    name = "hyarion_quartzlands_start",
    expression = "2 * starting_spot_at_angle{ angle = hyarion_quartzlands_angle,\z
                                              distance = 250,\z
                                              radius = 550 * hyarion_starting_area_radius,\z
                                              x_distortion = 0.1 * hyarion_starting_area_radius * (hyarion_wobble_x + hyarion_wobble_large_x + hyarion_wobble_huge_x),\z
                                              y_distortion = 0.1 * hyarion_starting_area_radius * (hyarion_wobble_y + hyarion_wobble_large_y + hyarion_wobble_huge_y)}"
  },
  {
    type = "noise-expression",
    name = "hyarion_mountains_start",
    expression = "2 * starting_spot_at_angle{ angle = hyarion_mountains_angle,\z
                                              distance = 250 * hyarion_starting_area_radius,\z
                                              radius = 500 * hyarion_starting_area_radius,\z
                                              x_distortion = 0.05 * hyarion_starting_area_radius * (hyarion_wobble_x + hyarion_wobble_large_x + hyarion_wobble_huge_x),\z
                                              y_distortion = 0.05 * hyarion_starting_area_radius * (hyarion_wobble_y + hyarion_wobble_large_y + hyarion_wobble_huge_y)}"
  },
  {
    type = "noise-expression",
    name = "hyarion_starting_area", -- used for biome blending
    expression = "clamp(max(hyarion_quartzlands_start, hyarion_mountains_start, hyarion_valley_start), 0, 1)"
  },
  {
    type = "noise-expression",
    name = "hyarion_starting_circle", -- Used to push random ores away. No not clamp.
    -- 600-650 circle
    expression = "1 + hyarion_starting_area_radius * (300 - distance) / 50"
  },

    ---- BIOME NOISE

  {
    type = "noise-function",
    name = "hyarion_biome_noise",
    parameters = {"seed1", "scale"},
    expression = "multioctave_noise{x = x,\z
                                    y = y,\z
                                    persistence = 0.65,\z
                                    seed0 = map_seed,\z
                                    seed1 = seed1,\z
                                    octaves = 5,\z
                                    input_scale = hyarion_scale_multiplier / scale}"
  },
  {
    type = "noise-function",
    name = "hyarion_biome_multiscale",
    parameters = {"seed1", "scale", "bias"},
    expression = "bias + lerp(hyarion_biome_noise(seed1, scale * 0.5),\z
                              hyarion_biome_noise(seed1 + 1000, scale),\z
                              clamp(distance / 10000, 0, 1))"
  },
  {
    type = "noise-expression",
    name = "hyarion_mountains_biome_noise",
    expression = "hyarion_biome_multiscale{seed1 = 342,\z
                                            scale = 60,\z
                                            bias = 0}"
  },
  {
    type = "noise-expression",
    name = "hyarion_valley_biome_noise",
    expression = "hyarion_biome_multiscale{seed1 = 12416,\z
                                            scale = 40,\z
                                            bias = 0}"
  },
  {
    type = "noise-expression",
    name = "hyarion_quartzlands_biome_noise",
    expression = "hyarion_biome_multiscale{seed1 = 42416,\z
                                            scale = 80,\z
                                            bias = 0}"
  },
  

  {
    type = "noise-expression",
    name = "hyarion_valley_raw",
    expression = "lerp(hyarion_valley_biome_noise, starting_weights, clamp(2 * hyarion_starting_area, 0, 1))",
    local_expressions =
    {
      starting_weights = "-hyarion_mountains_start + hyarion_valley_start - hyarion_quartzlands_start"
    }
  },
  {
    type = "noise-expression",
    name = "hyarion_quartzlands_raw",
    expression = "lerp(hyarion_quartzlands_biome_noise, starting_weights, clamp(2 * hyarion_starting_area, 0, 1))",
    local_expressions =
    {
      starting_weights = "-hyarion_mountains_start - hyarion_valley_start + hyarion_quartzlands_start"
    }
  },

  {
    type = "noise-expression",
    name = "hyarion_mountains_raw_pre_volcano",
    expression = "lerp(hyarion_mountains_biome_noise, starting_weights, clamp(2 * hyarion_starting_area, 0, 1))",
    local_expressions =
    {
      starting_weights = "hyarion_mountains_start - hyarion_valley_start - hyarion_quartzlands_start"
    }
  },
  {
    type = "noise-expression",
    name = "hyarion_mountains_biome_full_pre_volcano",
    expression = "hyarion_mountains_raw_pre_volcano - max(hyarion_valley_raw, hyarion_quartzlands_raw)"
  },

  {
    type = "noise-expression",
    name = "mountain_volcano_spots",
    expression = "max(hyarion_starting_volcano_spot, raw_spots - starting_protector)",
    local_expressions =
    {
      starting_protector = "clamp(starting_spot_at_angle{ angle = hyarion_mountains_angle + 180 * hyarion_starting_direction,\z
                                                          distance = (400 * hyarion_starting_area_radius) / 2,\z
                                                          radius = 800 * hyarion_starting_area_radius,\z
                                                          x_distortion = hyarion_wobble_x/2 + hyarion_wobble_large_x/12 + hyarion_wobble_huge_x/80,\z
                                                          y_distortion = hyarion_wobble_y/2 + hyarion_wobble_large_y/12 + hyarion_wobble_huge_y/80}, 0, 1)",
      raw_spots = "spot_noise{x = x + hyarion_wobble_x/2 + hyarion_wobble_large_x/12 + hyarion_wobble_huge_x/80,\z
                              y = y + hyarion_wobble_y/2 + hyarion_wobble_large_y/12 + hyarion_wobble_huge_y/80,\z
                              seed0 = map_seed,\z
                              seed1 = 1,\z
                              candidate_spot_count = 1,\z
                              suggested_minimum_candidate_point_spacing = volcano_spot_spacing,\z
                              skip_span = 1,\z
                              skip_offset = 0,\z
                              region_size = 256,\z
                              density_expression = volcano_area / volcanism_sq,\z
                              spot_quantity_expression = volcano_spot_radius * volcano_spot_radius,\z
                              spot_radius_expression = volcano_spot_radius,\z
                              hard_region_target_quantity = 0,\z
                              spot_favorability_expression = volcano_area,\z
                              basement_value = 0,\z
                              maximum_spot_basement_radius = volcano_spot_radius}",
      volcano_area = "lerp(hyarion_mountains_biome_full_pre_volcano, 0, hyarion_starting_area)",
      volcano_spot_radius = "200 * volcanism",
      volcano_spot_spacing = "1500 * volcanism",
      volcanism = "0.3 + 0.7 * slider_rescale(control:hyarion_volcanism:size, 3) / slider_rescale(hyarion_scale_multiplier, 3)",
      volcanism_sq = "volcanism * volcanism"
    }
  },
  {
    type = "noise-expression",
    name = "hyarion_starting_volcano_spot",
    expression = "clamp(starting_spot_at_angle{ angle = hyarion_mountains_angle,\z
                                                distance = 400 * hyarion_starting_area_radius,\z
                                                radius = 200,\z
                                                x_distortion = hyarion_wobble_x/2 + hyarion_wobble_large_x/12 + hyarion_wobble_huge_x/80,\z
                                                y_distortion = hyarion_wobble_y/2 + hyarion_wobble_large_y/12 + hyarion_wobble_huge_y/80}, 0, 1)"
  },

  {
    type = "noise-expression",
    name = "hyarion_mountains_raw_volcano",
    -- moderate influence for the outer 1/3 of the volcano, ramp to high influence for the middle third, and maxed for the innter third
    expression = "0.5 * hyarion_mountains_raw_pre_volcano + max(2 * mountain_volcano_spots, 10 * clamp((mountain_volcano_spots - 0.33) * 3, 0, 1))"
  },


  -- full range biomes with no clamping, good for away-from-edge targeting.
  {
    type = "noise-expression",
    name = "hyarion_mountains_biome_full",
    expression = "hyarion_mountains_raw_volcano - max(hyarion_valley_raw, hyarion_quartzlands_raw)"
  },
  {
    type = "noise-expression",
    name = "hyarion_valley_biome_full",
    expression = "hyarion_valley_raw - max(hyarion_mountains_raw_volcano, hyarion_quartzlands_raw)"
  },
  {
    type = "noise-expression",
    name = "hyarion_quartzlands_biome_full",
    expression = "hyarion_quartzlands_raw - max(hyarion_mountains_raw_volcano, hyarion_valley_raw)"
  },

  -- clamped 0-1 biomes
  {
    type = "noise-expression",
    name = "hyarion_mountains_biome",
    expression = "clamp(hyarion_mountains_biome_full * hyarion_biome_contrast, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "hyarion_valley_biome",
    expression = "clamp(hyarion_valley_biome_full * hyarion_biome_contrast, 0, 1)"
  },
  {
    type = "noise-expression",
    name = "hyarion_quartzlands_biome",
    expression = "clamp(hyarion_quartzlands_biome_full * hyarion_biome_contrast, 0, 1)"
  },



  {
    type = "noise-expression",
    name = "hyarion_resource_penalty",
    expression = "random_penalty_inverse(2.5, 1)"
  },
  {
    type = "noise-expression",
    name = "hyarion_wobble_x",
    expression = "hyarion_detail_noise{seed1 = 10, scale = 1/8, octaves = 2, magnitude = 4}"
  },
  {
    type = "noise-expression",
    name = "hyarion_wobble_y",
    expression = "hyarion_detail_noise{seed1 = 1010, scale = 1/8, octaves = 2, magnitude = 4}"
  },
  {
    type = "noise-expression",
    name = "hyarion_wobble_large_x",
    expression = "hyarion_detail_noise{seed1 = 20, scale = 1/2, octaves = 2, magnitude = 50}"
  },
  {
    type = "noise-expression",
    name = "hyarion_wobble_large_y",
    expression = "hyarion_detail_noise{seed1 = 1020, scale = 1/2, octaves = 2, magnitude = 50}"
  },
  {
    type = "noise-expression",
    name = "hyarion_wobble_huge_x",
    expression = "hyarion_detail_noise{seed1 = 30, scale = 2, octaves = 2, magnitude = 800}"
  },
  {
    type = "noise-expression",
    name = "hyarion_wobble_huge_y",
    expression = "hyarion_detail_noise{seed1 = 1030, scale = 2, octaves = 2, magnitude = 800}"
  },

  

  {
    type = "noise-expression",
    name = "mountain_basis_noise",
    expression = "basis_noise{x = x,\z
                              y = y,\z
                              seed0 = map_seed,\z
                              seed1 = 13423,\z
                              input_scale = 1 / 500,\z
                              output_scale = 250}"
  },
  {
    type = "noise-expression",
    name = "mountain_plasma",
    expression = "hyarion_plasma(102, 2.5, 10, 125, 625)"
  },
  {
    type = "noise-expression",
    name = "mountain_elevation",
    expression = "lerp(max(clamp(mountain_plasma, -100, 10000), mountain_basis_noise),\z
                       mountain_plasma,\z
                       clamp(0.7 * mountain_basis_noise, 0, 1))\z
                  * (1 - clamp(hyarion_plasma(13, 2.5, 10, 0.15, 0.75), 0, 1))",
  },
  {
    type = "noise-expression",
    name = "mountain_lava_spots",
    expression = "clamp(hyarion_threshold(mountain_volcano_spots * 1.95 - 0.95,\z
                                           0.4 * clamp(hyarion_threshold(hyarion_mountains_biome, 0.5), 0, 1))\z
                                           * hyarion_threshold(clamp(hyarion_plasma(17453, 0.2, 0.4, 10, 20) / 20, 0, 1), 1.8),\z
                        0, 1)"
  },
  {
    type = "noise-function",
    name = "volcano_inverted_peak",
    parameters = {"spot", "inversion_point"},
    expression = "(inversion_point - abs(spot - inversion_point)) / inversion_point"
  },
  {
    type = "noise-expression",
    name = "hyarion_mountains_func",
    expression = "lerp(mountain_elevation, 700 * volcano_inverted_peak(mountain_volcano_spots, 0.65), clamp(mountain_volcano_spots * 3, 0, 1))\z
     + 200 * (aux - 0.5) * (mountain_volcano_spots + 0.5)"
  },
  {
    type = "noise-expression",
    name = "hyarion_valley_func",
    expression = "300 + 0.001 * min(basis_noise{x = x,\z
                                                y = y,\z
                                                seed0 = map_seed,\z
                                                seed1 = 12643,\z
                                                input_scale = hyarion_scale_multiplier / 50 / scale,\z
                                                output_scale = 150},\z
                                    basis_noise{x = x,\z
                                                y = y,\z
                                                seed0 = map_seed,\z
                                                seed1 = 12643,\z
                                                input_scale = hyarion_scale_multiplier / 50 / scale,\z
                                                output_scale = 150})",
    local_expressions = {scale = 3}
  },
  {
    type = "noise-expression",
    name = "hyarion_hairline_cracks",
    expression = "hyarion_plasma(15223, 0.3 * hyarion_cracks_scale, 0.6 * hyarion_cracks_scale, 0.6, 1)"
  },
  {
    type = "noise-expression",
    name = "hyarion_flood_cracks_a",
    expression = "lerp(min(hyarion_plasma(7543, 2.5 * hyarion_cracks_scale, 4 * hyarion_cracks_scale, 0.5, 1),\z
                           hyarion_plasma(7443, 1.5 * hyarion_cracks_scale, 3.5 * hyarion_cracks_scale, 0.5, 1)),\z
                       1,\z
                       clamp(hyarion_detail_noise(241, 2 * hyarion_cracks_scale, 2, 0.25), 0, 1))"
  },
  {
    type = "noise-expression",
    name = "hyarion_flood_cracks_b",
    expression = "lerp(1,\z
                       min(hyarion_plasma(12223, 2 * hyarion_cracks_scale, 3 * hyarion_cracks_scale, 0.5, 1),\z
                           hyarion_plasma(152, 1 * hyarion_cracks_scale, 1.5 * hyarion_cracks_scale, 0.25, 0.5)) - 0.5,\z
                       clamp(0.2 + hyarion_detail_noise(821, 6 * hyarion_cracks_scale, 2, 0.5), 0, 1))"
  },
  {
    type = "noise-expression",
    name = "hyarion_flood_paths",
    -- make paths through the lava cracks, get walkable areas above 0, the first value is the path height
    expression = "0.4\z
                  - hyarion_plasma(1543, 1.5 * hyarion_cracks_scale, 3 * hyarion_cracks_scale, 0.5, 1)\z
                  + min(0, hyarion_detail_noise(121, hyarion_cracks_scale * 4, 2, 0.5))",
  },
  {
    type = "noise-expression",
    name = "hyarion_flood_quartzlands_func",
    -- add hairline cracks to break up edges, crop hearilyie cracks peaks so it is more of a plates + cracks pattern
    -- lava level should be 0 and below, solid ground above 0
    expression = "min(max(hyarion_flood_cracks_a - 0.125, hyarion_flood_paths), hyarion_flood_cracks_b) + 0.3 * min(0.5, hyarion_hairline_cracks)"
  },


  {
    type = "noise-expression",
    name = "hyarion_elevation_offset",
    expression = "0"
  },
  {
    type = "noise-function",
    name = "hyarion_biome_blend",
    parameters = {"fade", "noise", "offset"},
    expression = "fade * (noise - offset)"
  },
  {
    type = "noise-expression",
    name = "hyarion_elev",
    expression = "hyarion_elevation_offset\z
                  + lerp(lerp(120 * hyarion_basalt_lakes_multisample,\z
                              20 + hyarion_mountains_func * hyarion_mountains_elevation_multiplier,\z
                              hyarion_mountains_biome),\z
                         hyarion_valley_func,\z
                         hyarion_valley_biome)",
    local_expressions =
    {
      hyarion_basalt_lakes_multisample = "min(multisample(hyarion_basalt_lakes, 0, 0),\z
                                               multisample(hyarion_basalt_lakes, 1, 0),\z
                                               multisample(hyarion_basalt_lakes, 0, 1),\z
                                               multisample(hyarion_basalt_lakes, 1, 1))"
    }
  },
  {
    type = "noise-expression",
    name = "hyarion_basalt_lakes",
    expression = "min(1,\z
                      -0.2 + hyarion_flood_quartzlands_func\z
                      - 0.35 * clamp(hyarion_contrast(hyarion_detail_noise(837, 1/40, 4, 1.25), 0.95)\z
                                     * hyarion_contrast(hyarion_detail_noise(234, 1/50, 4, 1), 0.95)\z
                                     * hyarion_detail_noise(643, 1/70, 4, 0.7),\z
                                     0, 3))"
  },

    ---- RESOURCES
  -- metals, lava and emerald geodes in mountains
  -- quartz and nitrogen geysers rocks on crystal lands.
  -- Ruby and saphire gem geodes and big crystal rocks rocks on valleys.

   {
    type = "noise-expression",
    name = "hyarion_resource_wobble_x",
    expression = "hyarion_wobble_x + 0.25 * hyarion_wobble_large_x"
  },
  {
    type = "noise-expression",
    name = "hyarion_resource_wobble_y",
    expression = "hyarion_wobble_y + 0.25 * hyarion_wobble_large_y"
  },
  {
    type = "noise-expression",
    name = "hyarion_starting_quartz", -- don't use the slider for radius because it can make quartz in the safe area
    expression = "starting_spot_at_angle{ angle = hyarion_quartzlands_angle - 10 * hyarion_starting_direction,\z
                                          distance = 450 * hyarion_starting_area_radius,\z
                                          radius = 30 / 1.5,\z
                                          x_distortion = 0.5 * hyarion_resource_wobble_x,\z
                                          y_distortion = 0.5 * hyarion_resource_wobble_y}"
  },
  {
    type = "noise-expression",
    name = "hyarion_starting_iron",
    expression = "starting_spot_at_angle{ angle = hyarion_mountains_angle - 20 * hyarion_starting_direction,\z
                                          distance = 350 * hyarion_starting_area_radius,\z
                                          radius = 35 / 1.5 * hyarion_iron_size,\z
                                          x_distortion = 0.5 * hyarion_resource_wobble_x,\z
                                          y_distortion = 0.5 * hyarion_resource_wobble_y}"
  },
    {
    type = "noise-expression",
    name = "hyarion_starting_carbon",
    expression = "starting_spot_at_angle{ angle = hyarion_mountains_angle + 15 * hyarion_starting_direction,\z
                                          distance = 400 * hyarion_starting_area_radius,\z
                                          radius = 30 * hyarion_carbon_size,\z
                                          x_distortion = 0.5 * hyarion_resource_wobble_x,\z
                                          y_distortion = 0.5 * hyarion_resource_wobble_y}"
  },
  {
    type = "noise-expression",
    name = "hyarion_starting_emerald",
    expression = "max(starting_spot_at_angle{ angle = hyarion_mountains_angle + 10 * hyarion_starting_direction,\z
                                              distance = 590 * hyarion_starting_area_radius,\z
                                              radius = 15,\z
                                              x_distortion = 0.75 * hyarion_resource_wobble_x,\z
                                              y_distortion = 0.75 * hyarion_resource_wobble_y},\z
                      starting_spot_at_angle{ angle = hyarion_mountains_angle + 30 * hyarion_starting_direction,\z
                                              distance = 50 * hyarion_starting_area_radius,\z
                                              radius = 10 * hyarion_emerald_geode_size,\z
                                              x_distortion = 0.75 * hyarion_resource_wobble_x,\z
                                              y_distortion = 0.75 * hyarion_resource_wobble_y})"
  },
    {
    type = "noise-expression",
    name = "hyarion_starting_ruby",
    expression = "max(starting_spot_at_angle{ angle = hyarion_valley_angle + 10 * hyarion_starting_direction,\z
                                              distance = 180 * hyarion_starting_area_radius,\z
                                              radius = 20,\z
                                              x_distortion = 0.75 * hyarion_resource_wobble_x,\z
                                              y_distortion = 0.75 * hyarion_resource_wobble_y},\z
                      starting_spot_at_angle{ angle = hyarion_valley_angle + 15 * hyarion_starting_direction,\z
                                              distance = 50 * hyarion_starting_area_radius,\z
                                              radius = 5 * hyarion_ruby_geode_size,\z
                                              x_distortion = 0.75 * hyarion_resource_wobble_x,\z
                                              y_distortion = 0.75 * hyarion_resource_wobble_y})"
  },
      {
    type = "noise-expression",
    name = "hyarion_starting_sapphire",
    expression = "max(starting_spot_at_angle{ angle = hyarion_valley_angle + 30 * hyarion_starting_direction,\z
                                              distance = 200 * hyarion_starting_area_radius,\z
                                              radius = 20,\z
                                              x_distortion = 0.75 * hyarion_resource_wobble_x,\z
                                              y_distortion = 0.75 * hyarion_resource_wobble_y},\z
                      starting_spot_at_angle{ angle = hyarion_valley_angle + 35 * hyarion_starting_direction,\z
                                              distance = 50 * hyarion_starting_area_radius,\z
                                              radius = 5 * hyarion_sapphire_geode_size,\z
                                              x_distortion = 0.75 * hyarion_resource_wobble_x,\z
                                              y_distortion = 0.75 * hyarion_resource_wobble_y})"
  },
  {
    type = "noise-function",
    name = "hyarion_spot_noise",
    parameters = {"seed", "count", "spacing", "span", "offset", "region_size", "density", "quantity", "radius", "favorability"},
    expression = "spot_noise{x = x + hyarion_resource_wobble_x,\z
                             y = y + hyarion_resource_wobble_y,\z
                             seed0 = map_seed,\z
                             seed1 = seed,\z
                             candidate_spot_count = count,\z
                             suggested_minimum_candidate_point_spacing = 128,\z
                             skip_span = span,\z
                             skip_offset = offset,\z
                             region_size = region_size,\z
                             density_expression = density,\z
                             spot_quantity_expression = quantity,\z
                             spot_radius_expression = radius,\z
                             hard_region_target_quantity = 0,\z
                             spot_favorability_expression = favorability,\z
                             basement_value = -1,\z
                             maximum_spot_basement_radius = 128}"
  },
  {
    type = "noise-expression",
    name = "hyarion_quartzlands_resource_favorability",
    expression = "clamp(((hyarion_quartzlands_biome_full * (hyarion_starting_area < 0.01)) - buffer) * contrast, 0, 1)",
    local_expressions =
    {
      buffer = 0.3, -- push ores away from biome edges.
      contrast = 2
    }
  },
  {
    type = "noise-expression",
    name = "hyarion_mountains_resource_favorability",
    expression = "clamp(main_region - (mountain_volcano_spots > 0.78), 0, 1)",
    local_expressions =
    {
      buffer = 0.4, -- push ores away from biome edges.
      contrast = 2,
      main_region = "clamp(((hyarion_mountains_biome_full * (hyarion_starting_area < 0.01)) - buffer) * contrast, 0, 1)"
    }
  },
  {
    type = "noise-expression",
    name = "hyarion_mountains_emerald_favorability",
    expression = "clamp(((hyarion_mountains_biome_full * (hyarion_starting_area < 0.01)) - buffer) * contrast, 0, 1)",
    local_expressions =
    {
      buffer = 0.3, -- push ores away from biome edges.
      contrast = 2
    }
  },
  {
    type = "noise-expression",
    name = "hyarion_valley_resource_favorability",
    expression = "clamp(((hyarion_valley_biome_full * (hyarion_starting_area < 0.01)) - buffer) * contrast, 0, 1)",
    local_expressions =
    {
      buffer = 0.3, -- push ores away from biome edges.
      contrast = 2
    }
  },
  {
    type = "noise-function",
    name = "hyarion_place_crystal_spots",
    parameters = {"seed", "count", "offset", "size", "freq", "favor_biome"},
    expression = "min(clamp(-1 + 4 * favor_biome, -1, 1), metal_spot_noise - hyarion_hairline_cracks / 30000)",
    local_expressions =
    {
      metal_spot_noise = "hyarion_spot_noise{seed = seed,\z
                                              count = count,\z
                                              spacing = hyarion_ore_spacing,\z
                                              span = 3,\z
                                              offset = offset,\z
                                              region_size = 500 + 500 / freq,\z
                                              density = favor_biome * 4,\z
                                              quantity = size * size,\z
                                              radius = size,\z
                                              favorability = favor_biome > 0.9}"
    }
  },
  {
    type = "noise-function",
    name = "hyarion_place_geode_spots",
    parameters = {"seed", "count", "offset", "size", "freq", "favor_biome"},
    expression = "min(2 * favor_biome - 1, hyarion_spot_noise{seed = seed,\z
                                                               count = count,\z
                                                               spacing = hyarion_ore_spacing,\z
                                                               span = 3,\z
                                                               offset = offset,\z
                                                               region_size = 400 + 400 / freq,\z
                                                               density = favor_biome * 2,\z
                                                               quantity = size * size,\z
                                                               radius = size,\z
                                                               favorability = favor_biome > 0.9})"
  },
    {
    type = "noise-function",
    name = "hyarion_place_non_crystal_spots",
    parameters = {"seed", "count", "offset", "size", "freq", "favor_biome"},
    expression = "min(2 * favor_biome - 1, hyarion_spot_noise{seed = seed,\z
                                                               count = count,\z
                                                               spacing = hyarion_ore_spacing,\z
                                                               span = 3,\z
                                                               offset = offset,\z
                                                               region_size = 400 + 400 / freq,\z
                                                               density = favor_biome * 4,\z
                                                               quantity = size * size,\z
                                                               radius = size,\z
                                                               favorability = favor_biome > 0.9})"
  },
  {
    type = "noise-function",
    name = "hyarion_place_metal_spots",
    parameters = {"seed", "count", "offset", "size", "freq", "favor_biome"},
    expression = "min(clamp(-1 + 4 * favor_biome, -1, 1), metal_spot_noise - hyarion_hairline_cracks / 30000)",
    local_expressions =
    {
      metal_spot_noise = "hyarion_spot_noise{seed = seed,\z
                                              count = count,\z
                                              spacing = hyarion_ore_spacing,\z
                                              span = 3,\z
                                              offset = offset,\z
                                              region_size = 500 + 500 / freq,\z
                                              density = favor_biome * 4,\z
                                              quantity = size * size,\z
                                              radius = size,\z
                                              favorability = favor_biome > 0.9}"
    }
  },

  ------------------QUARTZ
    {
    type = "noise-expression",
    name = "hyarion_quartz_ore_size",
    expression = "slider_rescale(control:hyarion_quartz:size, 2)"
  },
  {
    type = "noise-expression",
    name = "hyarion_quartz_ore_region",
    -- -1 to 1: needs a positive region for resources & decoratives plus a subzero baseline and skirt for surrounding decoratives.
    expression = "max(hyarion_starting_quartz,\z
                      min(1 - hyarion_starting_circle,\z
                          hyarion_place_crystal_spots(789, 15, 2,\z
                                                     hyarion_quartz_ore_size * min(1.2, hyarion_ore_dist) * 25,\z
                                                     control:hyarion_quartz:frequency,\z
                                                     hyarion_quartzlands_resource_favorability)))"
  },
  {
    type = "noise-expression",
    name = "hyarion_quartz_ore_probability",
    expression = "(control:hyarion_quartz:size > 0) * (1000 * ((1 + hyarion_quartz_ore_region) * random_penalty_between(0.9, 1, 1) - 1))"
  },
  {
    type = "noise-expression",
    name = "hyarion_quartz_ore_richness",
    expression = "hyarion_quartz_ore_region * random_penalty_between(0.9, 1, 1)\z
                  * 10000 * hyarion_starting_area_multiplier\z
                  * control:hyarion_quartz:richness / hyarion_quartz_ore_size"
  },

  ------------------CARBON
  {
    type = "noise-expression",
    name = "hyarion_carbon_size",
    expression = "slider_rescale(control:hyarion_carbon:size, 2)"
  },
  {
    type = "noise-expression",
    name = "hyarion_carbon_region",
    -- -1 to 1: needs a positive region for resources & decoratives plus a subzero baseline and skirt for surrounding decoratives.
    expression = "max(hyarion_starting_carbon,\z
                      min(1 - hyarion_starting_circle,\z
                          hyarion_place_non_crystal_spots(782349, 12, 1,\z
                                                         hyarion_carbon_size * min(1.2, hyarion_ore_dist) * 25,\z
                                                         control:hyarion_carbon:frequency,\z
                                                         hyarion_mountains_resource_favorability)))"
  },
  {
    type = "noise-expression",
    name = "hyarion_carbon_probability",
    expression = "(control:hyarion_carbon:size > 0) * (1000 * ((1 + hyarion_carbon_region) * random_penalty_between(0.9, 1, 1) - 1))"
  },
  {
    type = "noise-expression",
    name = "hyarion_carbon_richness",
    expression = "hyarion_carbon_region * random_penalty_between(0.9, 1, 1)\z
                  * 18000 * hyarion_starting_area_multiplier\z
                  * control:hyarion_carbon:richness / hyarion_carbon_size"
  },


  ------------------Iron
  {
    type = "noise-expression",
    name = "hyarion_iron_size",
    expression = "slider_rescale(control:hyarion_iron:size, 2)"
  },
  {
    type = "noise-expression",
    name = "hyarion_iron_region",
    -- -1 to 1: needs a positive region for resources & decoratives plus a subzero baseline and skirt for surrounding decoratives.
    expression = "max(hyarion_starting_iron,\z
                      min(1 - hyarion_starting_circle,\z
                          hyarion_place_metal_spots(749, 12, 1,\z
                                                         hyarion_iron_size * min(1.2, hyarion_ore_dist) * 25,\z
                                                         control:hyarion_iron:frequency,\z
                                                         hyarion_mountains_resource_favorability)))"
  },
  {
    type = "noise-expression",
    name = "hyarion_iron_probability",
    expression = "(control:hyarion_iron:size > 0) * (1000 * ((1 + hyarion_iron_region) * random_penalty_between(0.9, 1, 1) - 1))"
  },
  {
    type = "noise-expression",
    name = "hyarion_iron_richness",
    expression = "hyarion_iron_region * random_penalty_between(0.9, 1, 1)\z
                  * 24000 * hyarion_starting_area_multiplier\z
                  * control:hyarion_iron:richness / hyarion_iron_size"
  },


  ------------------Emerald
  {
    type = "noise-expression",
    name = "hyarion_emerald_geode_size",
    expression = "slider_rescale(control:hyarion_emerald:size, 2)"
  },
  {
    type = "noise-expression",
    name = "hyarion_emerald_geode_region",
    -- -1 to 1: needs a positive region for resources & decoratives plus a subzero baseline and skirt for surrounding decoratives.
    expression = "max(hyarion_starting_emerald,\z
                      min(1 - hyarion_starting_circle,\z
                          hyarion_place_geode_spots(759, 9, 0,\z
                                                      hyarion_emerald_geode_size * min(0.8, hyarion_ore_dist) * 25,\z
                                                      control:hyarion_emerald:frequency,\z
                                                      hyarion_mountains_emerald_favorability)))"
  },
  {
    type = "noise-expression",
    name = "hyarion_emerald_geode_patches",
    -- small wavelength noise (5 tiles-ish) to make geodes placement patchy but consistent between resources and decoratives
    expression = "0.8 * abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 21000, octaves = 2, input_scale = 1/3})"
  },
  {
    type = "noise-expression",
    name = "hyarion_emerald_geode_region_patchy",
    expression = "(1 + hyarion_emerald_geode_region) * (0.5 + 0.5 * hyarion_emerald_geode_patches) - 1"
  },
  {
    type = "noise-expression",
    name = "hyarion_emerald_geode_probability",
    expression = "(control:hyarion_emerald:size > 0) * (0.025 * ((hyarion_emerald_geode_region_patchy > 0) + 2 * hyarion_emerald_geode_region_patchy))"
  },
  {
    type = "noise-expression",
    name = "hyarion_emerald_geode_richness",
    expression = "(hyarion_emerald_geode_region > 0) * random_penalty_between(0.5, 1, 1)\z
                  * 80000 * 40 * hyarion_richness_multiplier * hyarion_starting_area_multiplier\z
                  * control:hyarion_emerald:richness / hyarion_emerald_geode_size"
  },


  ------------------Ruby
  {
    type = "noise-expression",
    name = "hyarion_ruby_geode_size",
    expression = "slider_rescale(control:hyarion_ruby:size, 2)"
  },
  {
    type = "noise-expression",
    name = "hyarion_ruby_geode_region",
    -- -1 to 1: needs a positive region for resources & decoratives plus a subzero baseline and skirt for surrounding decoratives.
    expression = "max(hyarion_starting_ruby,\z
                      min(1 - hyarion_starting_circle,\z
                          hyarion_place_geode_spots(759, 11, 0,\z
                                                      hyarion_ruby_geode_size * min(0.8, hyarion_ore_dist) * 25,\z
                                                      control:hyarion_ruby:frequency,\z
                                                      hyarion_valley_resource_favorability)))"
  },
  {
    type = "noise-expression",
    name = "hyarion_ruby_geode_patches",
    -- small wavelength noise (5 tiles-ish) to make geodes placement patchy but consistent between resources and decoratives
    expression = "0.8 * abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 21000, octaves = 2, input_scale = 1/3})"
  },
  {
    type = "noise-expression",
    name = "hyarion_ruby_geode_region_patchy",
    expression = "(1 + hyarion_ruby_geode_region) * (0.5 + 0.5 * hyarion_ruby_geode_patches) - 1"
  },
  {
    type = "noise-expression",
    name = "hyarion_ruby_geode_probability",
    expression = "(control:hyarion_ruby:size > 0) * (0.025 * ((hyarion_ruby_geode_region_patchy > 0) + 2 * hyarion_ruby_geode_region_patchy))"
  },
  {
    type = "noise-expression",
    name = "hyarion_ruby_geode_richness",
    expression = "(hyarion_ruby_geode_region > 0) * random_penalty_between(0.5, 1, 1)\z
                  * 80000 * 40 * hyarion_richness_multiplier * hyarion_starting_area_multiplier\z
                  * control:hyarion_ruby:richness / hyarion_ruby_geode_size"
  },


    ------------------Sapphire
  {
    type = "noise-expression",
    name = "hyarion_sapphire_geode_size",
    expression = "slider_rescale(control:hyarion_sapphire:size, 2)"
  },
  {
    type = "noise-expression",
    name = "hyarion_sapphire_geode_region",
    -- -1 to 1: needs a positive region for resources & decoratives plus a subzero baseline and skirt for surrounding decoratives.
    expression = "max(hyarion_starting_sapphire,\z
                      min(1 - hyarion_starting_circle,\z
                          hyarion_place_geode_spots(824, 11, 0,\z
                                                      hyarion_sapphire_geode_size * min(0.8, hyarion_ore_dist) * 25,\z
                                                      control:hyarion_sapphire:frequency,\z
                                                      hyarion_valley_resource_favorability)))"
  },
  {
    type = "noise-expression",
    name = "hyarion_sapphire_geode_patches",
    -- small wavelength noise (5 tiles-ish) to make geodes placement patchy but consistent between resources and decoratives
    expression = "0.8 * abs(multioctave_noise{x = x, y = y, persistence = 0.7, seed0 = map_seed, seed1 = 21000, octaves = 2, input_scale = 1/3})"
  },
  {
    type = "noise-expression",
    name = "hyarion_sapphire_geode_region_patchy",
    expression = "(1 + hyarion_sapphire_geode_region) * (0.5 + 0.5 * hyarion_sapphire_geode_patches) - 1"
  },
  {
    type = "noise-expression",
    name = "hyarion_sapphire_geode_probability",
    expression = "(control:hyarion_sapphire:size > 0) * (0.025 * ((hyarion_sapphire_geode_region_patchy > 0) + 2 * hyarion_sapphire_geode_region_patchy))"
  },
  {
    type = "noise-expression",
    name = "hyarion_sapphire_geode_richness",
    expression = "(hyarion_sapphire_geode_region > 0) * random_penalty_between(0.5, 1, 1)\z
                  * 80000 * 40 * hyarion_richness_multiplier * hyarion_starting_area_multiplier\z
                  * control:hyarion_sapphire:richness / hyarion_sapphire_geode_size"
  },


  {
    type = "noise-expression",
    name = "hyarion_ore_dist",
    expression = "max(1, distance / 2000)"
  },
}