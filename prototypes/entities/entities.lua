require ("util")
require ("circuit-connector-sprites")
require ("__base__/prototypes/entity/pipecovers")

local simulations = require("__base__.prototypes.factoriopedia-simulations")
local sounds = require("__base__/prototypes/entity/sounds")

local hit_effects = require("__base__/prototypes/entity/hit-effects")

data:extend({
    scaled_cliff(
      {
        mod_name = "__planetaris-unbounded__",
        name = "arig-cliff",
        map_color = {144, 119, 87},
        suffix = "arig",
        scale = 1.0,
        has_lower_layer = true,
        icon = "__planetaris-unbounded__/graphics/icons/cliff-arig.png",
        factoriopedia_simulation = simulations.factoriopedia_cliff 
      }
    )
})

-- Machines

data:extend({
    {
    type = "assembling-machine",
    name = "planetaris-sifter",
    icon = "__planetaris-unbounded__/graphics/icons/sifter.png",
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
    crafting_categories = {"sand-processing"},
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
          filename = "__planetaris-unbounded__/graphics/entity/sifter/sifter.png",
          width = 220,
          height = 292,
          frame_count = 24,
          line_length = 12,
          shift = util.by_pixel(0.5, -9),
          scale = 0.5
        },
        {
          filename = "__planetaris-unbounded__/graphics/entity/sifter/sifter-shadow.png",
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
            filename = "__planetaris-unbounded__/graphics/entity/sifter/sifter-liquid-north.png",
            frame_count = 24,
            line_length = 6,
            width = 66,
            height = 44,
            shift = util.by_pixel(23, 15),
            scale = 0.5
          },
          east_animation =
          {
            filename = "__planetaris-unbounded__/graphics/entity/sifter/sifter-liquid-east.png",
            frame_count = 24,
            line_length = 6,
            width = 70,
            height = 36,
            shift = util.by_pixel(0, 22),
            scale = 0.5
          },
          south_animation =
          {
            filename = "__planetaris-unbounded__/graphics/entity/sifter/sifter-liquid-south.png",
            frame_count = 24,
            line_length = 6,
            width = 66,
            height = 42,
            shift = util.by_pixel(0, 17),
            scale = 0.5
          },
          west_animation =
          {
            filename = "__planetaris-unbounded__/graphics/entity/sifter/sifter-liquid-west.png",
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
            filename = "__planetaris-unbounded__/graphics/entity/sifter/sifter-foam-north.png",
            frame_count = 24,
            line_length = 6,
            width = 62,
            height = 42,
            shift = util.by_pixel(24, 15),
            scale = 0.5
          },
          east_animation =
          {
            filename = "__planetaris-unbounded__/graphics/entity/sifter/sifter-foam-east.png",
            frame_count = 24,
            line_length = 6,
            width = 68,
            height = 36,
            shift = util.by_pixel(0, 22),
            scale = 0.5
          },
          south_animation =
          {
            filename = "__planetaris-unbounded__/graphics/entity/sifter/sifter-foam-south.png",
            frame_count = 24,
            line_length = 6,
            width = 60,
            height = 40,
            shift = util.by_pixel(1, 17),
            scale = 0.5
          },
          west_animation =
          {
            filename = "__planetaris-unbounded__/graphics/entity/sifter/sifter-foam-west.png",
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
            filename = "__planetaris-unbounded__/graphics/entity/sifter/sifter-smoke-outer.png",
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
            filename = "__planetaris-unbounded__/graphics/entity/sifter/sifter-smoke-inner.png",
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
        filename = "__planetaris-unbounded__/graphics/entity/sifter/sifter-reflection.png",
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
  icon = "__planetaris-unbounded__/graphics/icons/press.png",
  flags = {"placeable-neutral", "placeable-player", "player-creation"},
  minable = {mining_time = 0.5, result = "planetaris-press"},
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
  icon_draw_specification = {scale = 1},
graphics_set =
    {
      animation = make_4way_animation_from_spritesheet({ layers =
      {
        {
          filename = "__planetaris-unbounded__/graphics/entity/press/press.png",
          width = 384,
          height = 384,
          frame_count = 24,
          line_length = 12,
          animation_speed = 0.5,
          shift = util.by_pixel(0, 0),
          scale = 0.5
        },
        {
          filename = "__planetaris-unbounded__/graphics/entity/press/press-shadow.png",
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
{
  type = "assembling-machine",
  name = "planetaris-assembling-machine-4",
  icon = "__planetaris-unbounded__/graphics/icons/assembling-machine-4.png",
  flags = {"placeable-neutral","placeable-player", "player-creation"},
  minable = {mining_time = 0.2, result = "planetaris-assembling-machine-4"},
  max_health = 400,
  corpse = "planetaris-assembling-machine-4-remnants",
  dying_explosion = "planetaris-assembling-machine-4-explosion",
  icon_draw_specification = {shift = {0, -0.3}},
  circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
  circuit_connector = circuit_connector_definitions["assembling-machine"],
  alert_icon_shift = util.by_pixel(0, -12),
  resistances =
  {
    {
      type = "fire",
      percent = 70
    }
  },
  fluid_boxes =
  {
    {
      production_type = "input",
      pipe_picture = assembler3pipepictures(),
      pipe_covers = pipecoverspictures(),
      volume = 1000,
      pipe_connections = {{ flow_direction="input", direction = defines.direction.north, position = {0, -1} }},
      secondary_draw_orders = { north = -1 }
    },
    {
      production_type = "output",
      pipe_picture = assembler3pipepictures(),
      pipe_covers = pipecoverspictures(),
      volume = 1000,
      pipe_connections = {{ flow_direction="output", direction = defines.direction.south, position = {0, 1} }},
      secondary_draw_orders = { north = -1 }
    }
  },
  fluid_boxes_off_when_no_fluid_recipe = true,
  open_sound = sounds.machine_open,
  close_sound = sounds.machine_close,
  impact_category = "metal",
  working_sound =
  {
    sound = {filename = "__base__/sound/assembling-machine-t3-1.ogg", volume = 0.45, audible_distance_modifier = 0.5},
    fade_in_ticks = 4,
    fade_out_ticks = 20
  },
  collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
  selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
  damaged_trigger_effect = hit_effects.entity(),
  drawing_box_vertical_extension = 0.2,
  fast_replaceable_group = "assembling-machine",
  graphics_set =
  {
    animation_progress = 0.3,
    animation =
    {
      layers =
      {
        {
          filename = "__planetaris-unbounded__/graphics/entity/assembling-machine-4/assembling-machine-4.png",
          priority = "high",
          width = 214,
          height = 237,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, -0.75),
          scale = 0.5
        },
        {
          filename = "__planetaris-unbounded__/graphics/entity/assembling-machine-4/assembling-machine-4-shadow.png",
          priority = "high",
          width = 260,
          height = 162,
          frame_count = 32,
          line_length = 8,
          draw_as_shadow = true,
          shift = util.by_pixel(28, 4),
          scale = 0.5
        }
      }
    }
  },
  crafting_categories = {"basic-crafting", "crafting", "advanced-crafting", "crafting-with-fluid", "electronics", "electronics-with-fluid", "pressing", "metallurgy-or-assembling", "organic-or-hand-crafting", "organic-or-assembling", "electronics-or-assembling", "cryogenics-or-assembling", "crafting-with-fluid-or-metallurgy"},
  crafting_speed = 1.75,
  energy_source =
  {
    type = "electric",
    usage_priority = "secondary-input",
    emissions_per_minute = { pollution = 1.8 }
  },
  energy_usage = "450kW",
  module_slots = 5,
  allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"}
},
{
  type = "container",
  name = "planetaris-big-chest",
  icon = "__planetaris-unbounded__/graphics/icons/container.png",
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
        filename = "__planetaris-unbounded__/graphics/entity/container/container.png",
        priority = "high",
        width = 152,
        height = 192,
        shift = util.by_pixel(0, -11),
        tint = tint,
        scale = 0.5
      },
      {
        filename = "__planetaris-unbounded__/graphics/entity/container/container-shadow.png",
        priority = "high",
        width = 234,
        height = 106,
        shift = util.by_pixel(29, 6),
        draw_as_shadow = true,
        scale = 0.5
      }
    }
  },
  circuit_connector = circuit_connector_definitions["accumulator"],
  circuit_wire_max_distance = default_circuit_wire_max_distance
},
  {
    type = "solar-panel",
    name = "planetaris-advanced-solar-panel",
    icon = "__planetaris-unbounded__/graphics/icons/advanced-solar-panel.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.2, result = "planetaris-advanced-solar-panel"},
    fast_replaceable_group = "solar-panel",
    max_health = 400,
    corpse = "solar-panel-remnants",
    dying_explosion = "solar-panel-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
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
          filename = "__planetaris-unbounded__/graphics/entity/advanced-solar-panel/advanced-solar-panel.png",
          priority = "high",
          width = 384,
          height = 384,
          shift = util.by_pixel(0, 5),
          scale = 0.38
        },
        {
          filename = "__planetaris-unbounded__/graphics/entity/advanced-solar-panel/advanced-solar-panel-shadow.png",
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
})
