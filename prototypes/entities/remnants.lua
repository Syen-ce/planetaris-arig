data:extend({
  {
    type = "corpse",
    name = "planetaris-sifter-remnants",
    icon = "__planetaris-arig__/graphics/icons/sifter.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "production-machine-remnants",
    order = "a-e-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__planetaris-arig__/graphics/entity/sifter/remnants/sifter-remnants.png",
      line_length = 1,
      width = 446,
      height = 342,
      direction_count = 1,
      shift = util.by_pixel(16, -5.5),
      scale = 0.5
    }
  },
  {
    type = "corpse",
    name = "planetaris-press-remnants",
    icon = "__planetaris-arig__/graphics/icons/press.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "production-machine-remnants",
    order = "a-e-a",
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    tile_width = 2,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__planetaris-arig__/graphics/entity/press/remnants/press-remnants.png",
      line_length = 1,
      width = 274,
      height = 274,
      direction_count = 1,
      shift = util.by_pixel(0, 0),
      scale = 0.5
    }
  },
  {
    type = "corpse",
    name = "planetaris-big-chest-remnants",
    icon = "__planetaris-arig__/graphics/icons/container.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "production-machine-remnants",
    order = "a-a-a",
    selection_box = {{-1, -1}, {1, 1}},
    tile_width = 2,
    tile_height = 2,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (1,
    {
      filename = "__planetaris-arig__/graphics/entity/container/remnants/container-remnants.png",
      line_length = 1,
      width = 130,
      height = 189,
      direction_count = 1,
      shift = util.by_pixel(2.5, 0),
      scale = 0.5
    })
  },
  {
    type = "corpse",
    name = "planetaris-hyper-transport-belt-remnants",
    icon = "__planetaris-arig__/graphics/icons/hyper-transport-belt.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "belt-remnants",
    order = "a-c-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =  make_rotated_animation_variations_from_sheet (2,
    {
      filename = "__planetaris-arig__/graphics/entity/hyper-transport-belt/hyper-transport-belt-remnants.png",
      line_length = 1,
      width = 106,
      height = 102,
      direction_count = 4,
      shift = util.by_pixel(1, -0.5),
      scale = 0.5
    })
  },
  {
    type = "corpse",
    name = "planetaris-hyper-splitter-remnants",
    icon = "__planetaris-arig__/graphics/icons/hyper-splitter.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "belt-remnants",
    order = "a-i-a",
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    tile_width = 2,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__planetaris-arig__/graphics/entity/hyper-splitter/remnants/hyper-splitter-remnants.png",
      line_length = 1,
      width = 190,
      height = 190,
      direction_count = 4,
      shift = util.by_pixel(3.5, 1.5),
      scale = 0.5
    }
  },
  {
    type = "corpse",
    name = "planetaris-hyper-splitter-remnants",
    icon = "__planetaris-arig__/graphics/icons/hyper-splitter.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "belt-remnants",
    order = "a-i-a",
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    tile_width = 2,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__planetaris-arig__/graphics/entity/hyper-splitter/remnants/hyper-splitter-remnants.png",
      line_length = 1,
      width = 190,
      height = 190,
      direction_count = 4,
      shift = util.by_pixel(3.5, 1.5),
      scale = 0.5
    }
  },
  {
    type = "corpse",
    name = "planetaris-hyper-underground-belt-remnants",
    icon = "__planetaris-arig__/graphics/icons/hyper-underground-belt.png",
    flags = {"placeable-neutral", "not-on-map", "building-direction-8-way"},
    hidden_in_factoriopedia = true,
    subgroup = "belt-remnants",
    order = "a-f-a",
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    tile_width = 1,
    tile_height = 1,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation =
    {
      filename = "__planetaris-arig__/graphics/entity/hyper-underground-belt/remnants/hyper-underground-belt-remnants.png",
      line_length = 1,
      width = 156,
      height = 144,
      direction_count = 8,
      shift = util.by_pixel(10.5, 3),
      scale = 0.5
    }
  },
  {
    type = "corpse",
    name = "arig-roboport-remnants",
    icon = "__planetaris-arig__/graphics/icons/arig-roboport.png",
    flags = {"placeable-neutral", "not-on-map"},
    hidden_in_factoriopedia = true,
    subgroup = "logistic-network-remnants",
    order = "a-h-b",
    selection_box = {{-2, -2}, {2, 2}},
    tile_width = 3,
    tile_height = 3,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    remove_on_tile_placement = false,
    animation = make_rotated_animation_variations_from_sheet (2,
    {
      filename = "__planetaris-arig__/graphics/entity/arig-roboport/remnants/roboport-remnants.png",
      line_length = 1,
      width = 364,
      height = 358,
      direction_count = 1,
      shift = util.by_pixel(2, 8),
      scale = 0.5
    })
  }
})