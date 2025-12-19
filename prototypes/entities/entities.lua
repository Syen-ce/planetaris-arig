require ("util")
require ("circuit-connector-sprites")
require ("__space-age__/prototypes/entity/circuit-network")
require ("__base__/prototypes/entity/circuit-network")
require ("__base__/prototypes/entity/pipecovers")
require ("prototypes.tile.tile-collision-masks")

local simulations = require("prototypes.factoriopedia-simulations")
local sounds = require("__base__/prototypes/entity/sounds")

local hit_effects = require("__base__/prototypes/entity/hit-effects")

local logistic_chest_opened_duration = 7

local wall_shift = 20
local wall_shift_adjust = wall_shift - 7

data:extend({
    scaled_cliff(
      {
        mod_name = "__planetaris-arig__",
        name = "arig-cliff",
        map_color = {144, 119, 87},
        suffix = "arig",
        scale = 1.0,
        has_lower_layer = true,
        icon = "__planetaris-arig__/graphics/icons/cliff-arig.png",
        factoriopedia_simulation = simulations.factoriopedia_cliff_arig
      }
    )
})

-- Machines

data:extend({
    {
    type = "assembling-machine",
    name = "planetaris-sifter",
    icon = "__planetaris-arig__/graphics/icons/sifter.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.1, result = "planetaris-sifter"},
    fast_replaceable_group = nil,
    max_health = 350,
    corpse = "planetaris-sifter-remnants",
    dying_explosion = "planetaris-sifter-explosion",
    icon_draw_specification = {shift = {0, -0.25}},
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["chemical-plant"],
    heating_energy = "100kW",
    resistances =
    {
      {
        type = "fire",
        percent = 80
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.7,
    crafting_speed = 2,
    energy_usage = "250kW",
    module_slots = 2,
    crafting_categories = {"sifting"},
    icons_positioning =
    {
      {inventory_index = defines.inventory.furnace_modules, shift = {0, 1}}
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    graphics_set =
    {
      animation = make_4way_animation_from_spritesheet({ layers =
      {
        {
          filename = "__planetaris-arig__/graphics/entity/sifter/sifter.png",
          width = 220,
          height = 292,
          frame_count = 24,
          line_length = 12,
          shift = util.by_pixel(0.5, -9),
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/entity/sifter/sifter-shadow.png",
          width = 312,
          height = 222,
          repeat_count = 24,
          shift = util.by_pixel(27, 6),
          draw_as_shadow = true,
          scale = 0.5
        }
      }}),
      working_visualisations =
      {
        {
          apply_recipe_tint = "primary",
          north_animation =
          {
            filename = "__planetaris-arig__/graphics/entity/sifter/sifter-liquid-north.png",
            frame_count = 24,
            line_length = 6,
            width = 66,
            height = 44,
            shift = util.by_pixel(23, 15),
            scale = 0.5
          },
          east_animation =
          {
            filename = "__planetaris-arig__/graphics/entity/sifter/sifter-liquid-east.png",
            frame_count = 24,
            line_length = 6,
            width = 70,
            height = 36,
            shift = util.by_pixel(0, 22),
            scale = 0.5
          },
          south_animation =
          {
            filename = "__planetaris-arig__/graphics/entity/sifter/sifter-liquid-south.png",
            frame_count = 24,
            line_length = 6,
            width = 66,
            height = 42,
            shift = util.by_pixel(0, 17),
            scale = 0.5
          },
          west_animation =
          {
            filename = "__planetaris-arig__/graphics/entity/sifter/sifter-liquid-west.png",
            frame_count = 24,
            line_length = 6,
            width = 74,
            height = 36,
            shift = util.by_pixel(-10, 13),
            scale = 0.5
          }
        },
        {
          apply_recipe_tint = "secondary",
          north_animation =
          {
            filename = "__planetaris-arig__/graphics/entity/sifter/sifter-foam-north.png",
            frame_count = 24,
            line_length = 6,
            width = 62,
            height = 42,
            shift = util.by_pixel(24, 15),
            scale = 0.5
          },
          east_animation =
          {
            filename = "__planetaris-arig__/graphics/entity/sifter/sifter-foam-east.png",
            frame_count = 24,
            line_length = 6,
            width = 68,
            height = 36,
            shift = util.by_pixel(0, 22),
            scale = 0.5
          },
          south_animation =
          {
            filename = "__planetaris-arig__/graphics/entity/sifter/sifter-foam-south.png",
            frame_count = 24,
            line_length = 6,
            width = 60,
            height = 40,
            shift = util.by_pixel(1, 17),
            scale = 0.5
          },
          west_animation =
          {
            filename = "__planetaris-arig__/graphics/entity/sifter/sifter-foam-west.png",
            frame_count = 24,
            line_length = 6,
            width = 68,
            height = 28,
            shift = util.by_pixel(-9, 15),
            scale = 0.5
          }
        },
        {
          apply_recipe_tint = "tertiary",
          fadeout = true,
          constant_speed = true,
          north_position = util.by_pixel_hr(-30, -161),
          east_position = util.by_pixel_hr(29, -150),
          south_position = util.by_pixel_hr(12, -134),
          west_position = util.by_pixel_hr(-32, -130),
          render_layer = "wires",
          animation =
          {
            filename = "__planetaris-arig__/graphics/entity/sifter/sifter-smoke-outer.png",
            frame_count = 47,
            line_length = 16,
            width = 90,
            height = 188,
            animation_speed = 0.5,
            shift = util.by_pixel(-2, -40),
            scale = 0.5
          }
        },
        {
          apply_recipe_tint = "quaternary",
          fadeout = true,
          constant_speed = true,
          north_position = util.by_pixel_hr(-30, -161),
          east_position = util.by_pixel_hr(29, -150),
          south_position = util.by_pixel_hr(12, -134),
          west_position = util.by_pixel_hr(-32, -130),
          render_layer = "wires",
          animation =
          {
            filename = "__planetaris-arig__/graphics/entity/sifter/sifter-smoke-inner.png",
            frame_count = 47,
            line_length = 16,
            width = 40,
            height = 84,
            animation_speed = 0.5,
            shift = util.by_pixel(0, -14),
            scale = 0.5
          }
        }
      }
    },
    impact_category = "metal-large",
    open_sound = {filename = "__base__/sound/open-close/fluid-open.ogg", volume = 0.55},
    close_sound = {filename = "__base__/sound/open-close/fluid-close.ogg", volume = 0.54},
    working_sound =
    {
      sound = sound_variations("__base__/sound/chemical-plant", 3, 0.5),
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 4 }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction="input",
            direction = defines.direction.north,
            position = {-1, -1}
          }
        }
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction="input",
            direction = defines.direction.north,
            position = {1, -1}
          }
        }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.south,
            position = {-1, 1}
          }
        }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.south,
            position = {1, 1}
          }
        }
      }
    },
    water_reflection =
    {
      pictures =
      {
        filename = "__planetaris-arig__/graphics/entity/sifter/sifter-reflection.png",
        priority = "extra-high",
        width = 28,
        height = 36,
        shift = util.by_pixel(5, 60),
        variation_count = 4,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = true
    },
},
{
  type = "assembling-machine",
  name = "planetaris-press",
  icon = "__planetaris-arig__/graphics/icons/press.png",
  flags = {"placeable-neutral", "placeable-player", "player-creation"},
  minable = {mining_time = 0.5, result = "planetaris-press"},
  fast_replaceable_group = nil,
  max_health = 200,
  corpse = "planetaris-press-remnants",
  dying_explosion = "accumulator-explosion",
  open_sound = sounds.metallic_chest_open,
  close_sound = sounds.metallic_chest_close,
  effect_receiver = { base_effect = { productivity = 0.5 }},
  heating_energy = "100kW",
  resistances =
  {
    {
      type = "fire",
      percent = 50
    },
    {
      type = "impact",
      percent = 70
    }
  },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
  damaged_trigger_effect = hit_effects.entity(),
  drawing_box_vertical_extension = 0.5,
  impact_category = "metal",
  icon_draw_specification = {scale = 1, shift = {0, -0.5}},
graphics_set =
    {
      animation = make_4way_animation_from_spritesheet({ layers =
      {
        {
          filename = "__planetaris-arig__/graphics/entity/press/press.png",
          width = 384,
          height = 384,
          frame_count = 24,
          line_length = 12,
          animation_speed = 0.5,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/entity/press/press-shadow.png",
          width = 384,
          height = 384,
          repeat_count = 24,
          shift = util.by_pixel(0, 0),
          draw_as_shadow = true,
          scale = 0.5
        },
      }})
    },
      fluid_boxes =
    {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction="input",
            direction = defines.direction.north,
            position = {-1, -1}
          }
        }
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction="input",
            direction = defines.direction.north,
            position = {1, -1}
          }
        }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.south,
            position = {-1, 1}
          }
        }
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.south,
            position = {1, 1}
          }
        }
      }
    },
  crafting_categories = {"compressing"},
  crafting_speed = 1.75,
  energy_source =
  {
    type = "electric",
    usage_priority = "secondary-input",
    emissions_per_minute = { pollution = 1.8 }
  },
  energy_usage = "350kW",
  module_slots = 2,
  allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
  circuit_connector = circuit_connector_definitions["assembling-machine"],
  circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance
},
-- Containers
{
  type = "container",
  name = "planetaris-big-chest",
  icon = "__planetaris-arig__/graphics/icons/container.png",
  flags = {"placeable-neutral", "player-creation"},
  minable = {mining_time = 0.2, result = "planetaris-big-chest"},
  max_health = 450,
  corpse = "planetaris-big-chest-remnants",
  dying_explosion = "accumulator-explosion",
  open_sound = sounds.metallic_chest_open,
  close_sound = sounds.metallic_chest_close,
  resistances =
  {
    {
      type = "fire",
      percent = 90
    },
    {
      type = "impact",
      percent = 90
    }
  },
  collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
  selection_box = {{-1, -1}, {1, 1}},
  damaged_trigger_effect = hit_effects.entity(),
  inventory_size = 180,
  impact_category = "metal",
  icon_draw_specification = {scale = 0.7},
  picture =
  {
    layers =
    {
      {
        filename = "__planetaris-arig__/graphics/entity/container/container.png",
        priority = "high",
        width = 264,
        height = 264,
        shift = util.by_pixel(0, -2),
        scale = 0.3
      },
      {
        filename = "__planetaris-arig__/graphics/entity/container/container-shadow.png",
        priority = "high",
        width = 384,
        height = 384,
        shift = util.by_pixel(12, -6),
        draw_as_shadow = true,
        scale = 0.3
      }
    }
  },
  surface_conditions =
    {
      {
        property = "gravity",
        min = 0.1,
      }
    },
  circuit_connector = circuit_connector_definitions["accumulator"],
  circuit_wire_max_distance = default_circuit_wire_max_distance
},
{
  type = "logistic-container",
  name = "planetaris-active-provider-big-chest",
  icon = "__planetaris-arig__/graphics/icons/active-provider-container.png",
  flags = {"placeable-neutral", "player-creation"},
  minable = {mining_time = 0.2, result = "planetaris-active-provider-big-chest"},
  max_health = 450,
  corpse = "planetaris-big-chest-remnants",
  dying_explosion = "accumulator-explosion",
  resistances =
  {
    {
      type = "fire",
      percent = 90
    },
    {
      type = "impact",
      percent = 90
    }
  },
  logistic_mode = "active-provider",
  collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
  selection_box = {{-1, -1}, {1, 1}},
  damaged_trigger_effect = hit_effects.entity(),
  inventory_size = 180,
  impact_category = "metal",
  icon_draw_specification = {scale = 0.7},
  open_sound = sounds.metallic_chest_open,
  close_sound = sounds.metallic_chest_close,
  animation_sound = sounds.logistics_chest_open,
  opened_duration = logistic_chest_opened_duration,
  animation =
  {
    layers =
    {
      {
        filename = "__planetaris-arig__/graphics/entity/container/active-provider-container.png",
        priority = "high",
        width = 264,
        height = 264,
        frame_count = 7,
        shift = util.by_pixel(0, -2),
        scale = 0.3
      },
      {
        filename = "__planetaris-arig__/graphics/entity/container/container-shadow.png",
        priority = "high",
        width = 384,
        height = 384,
        repeat_count = 7,
        shift = util.by_pixel(12, -6),
        draw_as_shadow = true,
        scale = 0.3
      }
    }
  },
  surface_conditions =
    {
      {
        property = "gravity",
        min = 0.1,
      }
    },
  circuit_connector = circuit_connector_definitions["accumulator"],
  circuit_wire_max_distance = default_circuit_wire_max_distance
},
{
  type = "logistic-container",
  name = "planetaris-passive-provider-big-chest",
  icon = "__planetaris-arig__/graphics/icons/passive-provider-container.png",
  flags = {"placeable-neutral", "player-creation"},
  minable = {mining_time = 0.2, result = "planetaris-passive-provider-big-chest"},
  max_health = 450,
  corpse = "planetaris-big-chest-remnants",
  dying_explosion = "accumulator-explosion",
  resistances =
  {
    {
      type = "fire",
      percent = 90
    },
    {
      type = "impact",
      percent = 90
    }
  },
  logistic_mode = "active-provider",
  collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
  selection_box = {{-1, -1}, {1, 1}},
  damaged_trigger_effect = hit_effects.entity(),
  inventory_size = 180,
  impact_category = "metal",
  icon_draw_specification = {scale = 0.7},
  open_sound = sounds.metallic_chest_open,
  close_sound = sounds.metallic_chest_close,
  animation_sound = sounds.logistics_chest_open,
  opened_duration = logistic_chest_opened_duration,
  animation =
  {
    layers =
    {
      {
        filename = "__planetaris-arig__/graphics/entity/container/passive-provider-container.png",
        priority = "high",
        width = 264,
        height = 264,
        frame_count = 7,
        shift = util.by_pixel(0, -2),
        scale = 0.3
      },
      {
        filename = "__planetaris-arig__/graphics/entity/container/container-shadow.png",
        priority = "high",
        width = 384,
        height = 384,
        repeat_count = 7,
        shift = util.by_pixel(12, -6),
        draw_as_shadow = true,
        scale = 0.3
      }
    }
  },
  surface_conditions =
    {
      {
        property = "gravity",
        min = 0.1,
      }
    },
  circuit_connector = circuit_connector_definitions["accumulator"],
  circuit_wire_max_distance = default_circuit_wire_max_distance
},
{
  type = "logistic-container",
  name = "planetaris-storage-big-chest",
  icon = "__planetaris-arig__/graphics/icons/storage-container.png",
  flags = {"placeable-neutral", "player-creation"},
  minable = {mining_time = 0.2, result = "planetaris-storage-big-chest"},
  max_health = 450,
  corpse = "planetaris-big-chest-remnants",
  dying_explosion = "accumulator-explosion",
  resistances =
  {
    {
      type = "fire",
      percent = 90
    },
    {
      type = "impact",
      percent = 90
    }
  },
  logistic_mode = "storage",
  max_logistic_slots = 1,
  collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
  selection_box = {{-1, -1}, {1, 1}},
  damaged_trigger_effect = hit_effects.entity(),
  inventory_size = 180,
  impact_category = "metal",
  icon_draw_specification = {scale = 0.7},
  open_sound = sounds.metallic_chest_open,
  close_sound = sounds.metallic_chest_close,
  animation_sound = sounds.logistics_chest_open,
  opened_duration = logistic_chest_opened_duration,
  animation =
  {
    layers =
    {
      {
        filename = "__planetaris-arig__/graphics/entity/container/storage-container.png",
        priority = "high",
        width = 264,
        height = 264,
        frame_count = 7,
        shift = util.by_pixel(0, -2),
        scale = 0.3
      },
      {
        filename = "__planetaris-arig__/graphics/entity/container/container-shadow.png",
        priority = "high",
        width = 384,
        height = 384,
        repeat_count = 7,
        shift = util.by_pixel(12, -6),
        draw_as_shadow = true,
        scale = 0.3
      }
    }
  },
  surface_conditions =
    {
      {
        property = "gravity",
        min = 0.1,
      }
    },
  circuit_connector = circuit_connector_definitions["accumulator"],
  circuit_wire_max_distance = default_circuit_wire_max_distance
},
{
  type = "logistic-container",
  name = "planetaris-buffer-big-chest",
  icon = "__planetaris-arig__/graphics/icons/buffer-container.png",
  flags = {"placeable-neutral", "player-creation"},
  minable = {mining_time = 0.2, result = "planetaris-buffer-big-chest"},
  max_health = 450,
  corpse = "planetaris-big-chest-remnants",
  dying_explosion = "accumulator-explosion",
  resistances =
  {
    {
      type = "fire",
      percent = 90
    },
    {
      type = "impact",
      percent = 90
    }
  },
  logistic_mode = "buffer",
  trash_inventory_size = 30,
  collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
  selection_box = {{-1, -1}, {1, 1}},
  damaged_trigger_effect = hit_effects.entity(),
  inventory_size = 180,
  impact_category = "metal",
  icon_draw_specification = {scale = 0.7},
  open_sound = sounds.metallic_chest_open,
  close_sound = sounds.metallic_chest_close,
  animation_sound = sounds.logistics_chest_open,
  opened_duration = logistic_chest_opened_duration,
  animation =
  {
    layers =
    {
      {
        filename = "__planetaris-arig__/graphics/entity/container/buffer-container.png",
        priority = "high",
        width = 264,
        height = 264,
        frame_count = 7,
        shift = util.by_pixel(0, -2),
        scale = 0.3
      },
      {
        filename = "__planetaris-arig__/graphics/entity/container/container-shadow.png",
        priority = "high",
        width = 384,
        height = 384,
        repeat_count = 7,
        shift = util.by_pixel(12, -6),
        draw_as_shadow = true,
        scale = 0.3
      }
    }
  },
  surface_conditions =
    {
      {
        property = "gravity",
        min = 0.1,
      }
    },
  circuit_connector = circuit_connector_definitions["accumulator"],
  circuit_wire_max_distance = default_circuit_wire_max_distance
},
{
  type = "logistic-container",
  name = "planetaris-requester-big-chest",
  icon = "__planetaris-arig__/graphics/icons/requester-container.png",
  flags = {"placeable-neutral", "player-creation"},
  minable = {mining_time = 0.2, result = "planetaris-requester-big-chest"},
  max_health = 450,
  corpse = "planetaris-big-chest-remnants",
  dying_explosion = "accumulator-explosion",
  resistances =
  {
    {
      type = "fire",
      percent = 90
    },
    {
      type = "impact",
      percent = 90
    }
  },
  logistic_mode = "requester",
  trash_inventory_size = 30,
  collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
  selection_box = {{-1, -1}, {1, 1}},
  damaged_trigger_effect = hit_effects.entity(),
  inventory_size = 180,
  impact_category = "metal",
  icon_draw_specification = {scale = 0.7},
  open_sound = sounds.metallic_chest_open,
  close_sound = sounds.metallic_chest_close,
  animation_sound = sounds.logistics_chest_open,
  opened_duration = logistic_chest_opened_duration,
  animation =
  {
    layers =
    {
      {
        filename = "__planetaris-arig__/graphics/entity/container/requester-container.png",
        priority = "high",
        width = 264,
        height = 264,
        frame_count = 7,
        shift = util.by_pixel(0, -2),
        scale = 0.3
      },
      {
        filename = "__planetaris-arig__/graphics/entity/container/container-shadow.png",
        priority = "high",
        width = 384,
        height = 384,
        repeat_count = 7,
        shift = util.by_pixel(12, -6),
        draw_as_shadow = true,
        scale = 0.3
      }
    }
  },
  surface_conditions =
    {
      {
        property = "gravity",
        min = 0.1,
      }
    },
  circuit_connector = circuit_connector_definitions["accumulator"],
  circuit_wire_max_distance = default_circuit_wire_max_distance
},

---

  {
    type = "solar-panel",
    name = "planetaris-advanced-solar-panel",
    icon = "__planetaris-arig__/graphics/icons/advanced-solar-panel.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.2, result = "planetaris-advanced-solar-panel"},
    fast_replaceable_group = "solar-panel",
    max_health = 400,
    corpse = "solar-panel-remnants",
    dying_explosion = "solar-panel-explosion",
    collision_box = data.raw["solar-panel"]["solar-panel"].collision_box,
    selection_box = data.raw["solar-panel"]["solar-panel"].selection_box,
    damaged_trigger_effect = hit_effects.entity(),
    energy_source =
    {
      type = "electric",
      usage_priority = "solar"
    },
    picture =
    {
      layers =
      {
        {
          filename = "__planetaris-arig__/graphics/entity/advanced-solar-panel/advanced-solar-panel.png",
          priority = "high",
          width = 384,
          height = 384,
          
          shift = util.by_pixel(0, 5),
          scale = 0.38
        },
        {
          filename = "__planetaris-arig__/graphics/entity/advanced-solar-panel/advanced-solar-panel-shadow.png",
          priority = "high",
          width = 384,
          height = 384,
          shift = util.by_pixel(6.5, 7.5),
          draw_as_shadow = true,
          scale = 0.38
        }
      }
    },
    impact_category = "glass",
    production = "120kW"
  },
  {
    type = "roboport",
    name = "planetaris-arig-roboport",
    icon = "__planetaris-arig__/graphics/icons/arig-roboport.png",
    flags = {"placeable-player", "player-creation"},
    fast_replaceable_group = "roboport",
    minable = {mining_time = 0.1, result = "planetaris-arig-roboport"},
    max_health = 500,
    corpse = "arig-roboport-remnants",
    dying_explosion = "roboport-explosion",
    collision_box = {{-1.7, -1.7}, {1.7, 1.7}},
    selection_box = {{-2, -2}, {2, 2}},
    damaged_trigger_effect = hit_effects.entity(),
    resistances =
    {
      {
        type = "fire",
        percent = 30
      },
      {
        type = "impact",
        percent = 20
      }
    },
    surface_conditions =
      {
        {
          property = "planetaris-dust-concentration",
          min = 50,
          max = 100,
        }
      },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      input_flow_limit = "4MW",
      buffer_capacity = "80MJ"
    },
    recharge_minimum = "40MJ",
    energy_usage = "50kW",
    -- per one charge slot
    charging_energy = "550kW",
    logistics_radius = 20,
    construction_radius = 50,
    charge_approach_distance = 5,
    robot_slots_count = 7,
    material_slots_count = 7,
    stationing_offset = {0, 0},
    charging_offsets =
    {
      {-1.5, -1}, {1.5, -1}, {1.5, 1}, {-1.5, 1}
    },
    base =
    {
      layers =
      {
        {
          filename = "__planetaris-arig__/graphics/entity/arig-roboport/roboport-base.png",
          width = 228,
          height = 277,
          shift = util.by_pixel(2, -2.25),
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/entity/arig-roboport/roboport-shadow.png",
          width = 294,
          height = 201,
          draw_as_shadow = true,
          shift = util.by_pixel(28.5, 9.25),
          scale = 0.5
        }
      }
    },
    base_patch =
    {
      filename = "__planetaris-arig__/graphics/entity/arig-roboport/roboport-base-patch.png",
      priority = "medium",
      width = 138,
      height = 100,
      shift = util.by_pixel(1.5, -5),
      scale = 0.5
    },
    base_animation =
    {
      filename = "__planetaris-arig__/graphics/entity/arig-roboport/roboport-base-animation.png",
      priority = "medium",
      width = 83,
      height = 59,
      frame_count = 8,
      animation_speed = 0.5,
      shift = util.by_pixel(-17.75, -71.25),
      scale = 0.5
    },
    door_animation_up =
    {
      filename = "__planetaris-arig__/graphics/entity/arig-roboport/roboport-door-up.png",
      priority = "medium",
      width = 97,
      height = 38,
      frame_count = 16,
      shift = util.by_pixel(-0.25, -39.5),
      scale = 0.5
    },
    door_animation_down =
    {
      filename = "__planetaris-arig__/graphics/entity/arig-roboport/roboport-door-down.png",
      priority = "medium",
      width = 97,
      height = 41,
      frame_count = 16,
      shift = util.by_pixel(-0.25, -19.75),
      scale = 0.5
    },
    recharging_animation =
    {
      filename = "__planetaris-arig__/graphics/entity/arig-roboport/roboport-recharging.png",
      draw_as_glow = true,
      priority = "high",
      width = 37,
      height = 35,
      frame_count = 16,
      scale = 1.5,
      animation_speed = 0.5,
    },
    impact_category = "metal",
    open_sound = {filename = "__base__/sound/open-close/roboport-open.ogg", volume = 0.5},
    close_sound = {filename = "__base__/sound/open-close/roboport-close.ogg", volume = 0.4},
    working_sound =
    {
      sound = {filename = "__base__/sound/roboport-working.ogg", volume = 0.4, audible_distance_modifier = 0.75},
      max_sounds_per_prototype = 3,
    },
    recharging_light = {intensity = 0.2, size = 3, color = {0.5, 0.5, 1}},
    request_to_open_door_timeout = 15,
    spawn_and_station_height = 0.3,
    stationing_render_layer_swap_height = 0.87,
    radar_visualisation_color = {0.059, 0.092, 0.235, 0.275},

    draw_logistic_radius_visualization = true,
    draw_construction_radius_visualization = true,

    open_door_trigger_effect = sounds.roboport_door_open,
    close_door_trigger_effect = sounds.roboport_door_close,

    circuit_connector = circuit_connector_definitions["roboport"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,

    default_available_logistic_output_signal = {type = "virtual", name = "signal-X"},
    default_total_logistic_output_signal = {type = "virtual", name = "signal-Y"},
    default_available_construction_output_signal = {type = "virtual", name = "signal-Z"},
    default_total_construction_output_signal = {type = "virtual", name = "signal-T"},
    default_roboport_count_output_signal = {type = "virtual", name = "signal-R"},

    water_reflection =
    {
      pictures =
      {
        filename = "__planetaris-arig__/graphics/entity/arig-roboport/roboport-reflection.png",
        priority = "extra-high",
        width = 28,
        height = 28,
        shift = util.by_pixel(0, 65),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  },
  {
    type = "solar-panel",
    name = "planetaris-supported-solar-panel",
    icon = "__planetaris-arig__/graphics/icons/supported-solar-panel.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "planetaris-supported-solar-panel"},
    fast_replaceable_group = nil,
    max_health = 300,
    corpse = "solar-panel-remnants",
    dying_explosion = "solar-panel-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    collision_mask = {layers = {ground_tile = true, rail_support = true, lava_tile=true, ["deepsea"] = true}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 1.2,
    tile_buildability_rules =
    {
      {
        area = {{-1.8, -2.8}, {1.8, 2.8}},
        required_tiles = {layers = {water_tile = true}},
        colliding_tiles = {layers = {ground_tile = true}},
        remove_on_collision = true
      }
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "solar"
    },
    picture =
    {
      layers =
      {
        {
          filename = "__planetaris-arig__/graphics/entity/supported-solar-panel/supported-solar-panel.png",
          priority = "high",
          width = 200,
          height = 245,
          shift = util.by_pixel(0, -10),
          scale = 0.6
        },
        {
          filename = "__planetaris-arig__/graphics/entity/supported-solar-panel/supported-solar-panel-shadow.png",
          priority = "high",
          width = 384,
          height = 384,
          shift = util.by_pixel(28, 34),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    water_reflection = {
      pictures = {
          filename = "__planetaris-arig__/graphics/entity/supported-solar-panel/supported-solar-panel-reflection.png",
          priority = "high",
          width = 424,
          height = 424,
          shift = util.by_pixel(0, 5),
          scale = 0.6
        },
    },
    impact_category = "glass",
    production = "120kW"
  },
  {
    type = "electric-pole",
    name = "planetaris-high-support-electric-pole",
    icon = "__planetaris-arig__/graphics/icons/high-support-electric-pole.png",
    quality_indicator_scale = 0.75,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "planetaris-high-support-electric-pole"},
    max_health = 150,
    corpse = "small-electric-pole-remnants",
    dying_explosion = "small-electric-pole-explosion",
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    collision_mask = {layers = {ground_tile = true, rail_support = true, lava_tile=true, ["deepsea"] = true}},
    selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
    damaged_trigger_effect = hit_effects.entity({{-0.2, -2.2}, {0.2, 0.2}}),
    drawing_box_vertical_extension = 2.2,
    maximum_wire_distance = 6.5,
    supply_area_distance = 1.5,
    impact_category = "wood",
    open_sound = sounds.electric_network_open,
    close_sound = sounds.electric_network_close,
    fast_replaceable_group = "electric-pole",
--    tile_buildability_rules = {
--      area = {{-0.5, -0.5}, {0.5, 0.5}},
--      colliding_tiles = {layers = {["deepsea"] = true}},
--      remove_on_collision = true,
--    },
    pictures =
    {
      layers =
      {
        {
          filename = "__planetaris-arig__/graphics/entity/high-support-electric-pole/high-support-electric-pole.png",
          priority = "extra-high",
          width = 72,
          height = 220,
          direction_count = 4,
          shift = util.by_pixel(1.5, -42.5),
          scale = 0.5
        },
        {
          filename = "__planetaris-arig__/graphics/entity/high-support-electric-pole/high-support-electric-pole-shadow.png",
          priority = "extra-high",
          width = 256,
          height = 74,
          direction_count = 4,
          shift = util.by_pixel(51, 3),
          draw_as_shadow = true,
          scale = 0.5
        }
      }
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = util.by_pixel(48.5, 2.5),
          red = util.by_pixel(61.0, 4.5),
          green = util.by_pixel(35.5, 4.0)
        },
        wire =
        {
          copper = util.by_pixel(0.0, -32.5),
          red = util.by_pixel(13.0, -31.0),
          green = util.by_pixel(-12.5, -31.0)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel(49.5, 4.0),
          red = util.by_pixel(60.0, 9.0),
          green = util.by_pixel(42.5, -4.0)
        },
        wire =
        {
          copper = util.by_pixel(1.5, -31.0),
          red = util.by_pixel(12.0, -26.0),
          green = util.by_pixel(-6.0, -39.5)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel(50.5, 5.5),
          red = util.by_pixel(52.5, 14.5),
          green = util.by_pixel(53.5, -3.5)
        },
        wire =
        {
          copper = util.by_pixel(2.5, -29.5),
          red = util.by_pixel(4.0, -21.0),
          green = util.by_pixel(5.0, -39.5)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel(48.5, -1.5),
          red = util.by_pixel(38.0, 3.5),
          green = util.by_pixel(56.0, -9.0)
        },
        wire =
        {
          copper = util.by_pixel(0.5, -36.5),
          red = util.by_pixel(-10.5, -31.5),
          green = util.by_pixel(8.0, -43.5)
        }
      }
    },
    radius_visualisation_picture =
    {
      filename = "__planetaris-arig__/graphics/entity/high-support-electric-pole/high-support-electric-pole-visualization.png",
      width = 12,
      height = 12,
      priority = "extra-high-no-scale"
    },
    water_reflection =
    {
      pictures =
      {
        filename = "__planetaris-arig__/graphics/entity/high-support-electric-pole/high-support-electric-pole-reflection.png",
        priority = "extra-high",
        width = 12,
        height = 28,
        shift = util.by_pixel(5, 40),
        variation_count = 4,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = true
    }
  },
  {
  type = "assembling-machine",
  name = "planetaris-water-harvester",
  icon = "__planetaris-arig__/graphics/icons/water-harvester.png",
  flags = {"placeable-neutral", "placeable-player", "player-creation"},
  minable = {mining_time = 0.5, result = "planetaris-water-harvester"},
  fast_replaceable_group = nil,
  max_health = 200,
  corpse = "planetaris-press-remnants",
  dying_explosion = "accumulator-explosion",
  open_sound = sounds.metallic_chest_open,
  close_sound = sounds.metallic_chest_close,
  heating_energy = "100kW",
  resistances =
  {
    {
      type = "fire",
      percent = 20
    },
    {
      type = "impact",
      percent = 20
    }
  },
  collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
  selection_box = {{-1, -1}, {1, 1}},
  damaged_trigger_effect = hit_effects.entity(),
  drawing_box_vertical_extension = 0.3,
  impact_category = "metal",
  icon_draw_specification = {scale = 0.5},
  graphics_set =
    {
      animation = make_4way_animation_from_spritesheet({ layers =
      {
        {
          filename = "__planetaris-arig__/graphics/entity/water-harvester/water-harvester.png",
          width = 384,
          height = 384,
          frame_count = 1,
          line_length = 1,
          animation_speed = 0.5,
          shift = util.by_pixel(0, 0),
          scale = 0.32
        },
        {
          filename = "__planetaris-arig__/graphics/entity/water-harvester/water-harvester-shadow.png",
          width = 384,
          height = 384,
          repeat_count = 1,
          shift = util.by_pixel(0, 0),
          draw_as_shadow = true,
          scale = 0.32
        }
      }}),
    },
      fluid_boxes =
    {
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        volume = 100,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.east,
            position = {0.5, -0.5}
          }
        }
      },
    },
  surface_conditions =
    {
      {
        property = "gravity",
        min = 1,
      }
    },
  crafting_categories = {"water-production"},
  crafting_speed = 1,
  energy_source =
  {
    type = "electric",
    usage_priority = "secondary-input",
    emissions_per_minute = { pollution = 0.5 }
  },
  energy_usage = "10kW",
  module_slots = 1,
  allowed_effects = {"speed", "productivity"},
  circuit_connector = circuit_connector_definitions["assembling-machine"],
  circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance
},
})