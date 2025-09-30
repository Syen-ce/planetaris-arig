require ("util")
require ("circuit-connector-sprites")
require ("prototypes.circuit-connector-definitions")
require ("__space-age__/prototypes/entity/circuit-network")
require ("__base__/prototypes/entity/circuit-network")
require ("__base__/prototypes/entity/pipecovers")

local simulations = require("prototypes.factoriopedia-simulations")
local sounds = require("__base__/prototypes/entity/sounds")

local hit_effects = require("__base__/prototypes/entity/hit-effects")

local wall_shift = 20
local wall_shift_adjust = wall_shift - 7

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
        factoriopedia_simulation = simulations.factoriopedia_cliff_arig
      }
    ),
    scaled_cliff(
    {
      mod_name = "__planetaris-unbounded-assets__",
      name = "hyarion-cliff",
      map_color = {180, 180, 180},
      suffix = "hyarion",
      subfolder = "hyarion",
      scale = 1.0,
      has_lower_layer = true,
      sprite_size_multiplier = 2,
      icon = "__planetaris-unbounded-assets__/graphics/icons/cliff-hyarion.png",
      factoriopedia_simulation = simulations.factoriopedia_cliff_hyarion
    }
  ),
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
  {
    type = "roboport",
    name = "planetaris-arig-roboport",
    icon = "__planetaris-unbounded__/graphics/icons/arig-roboport.png",
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
    charging_energy = "400kW",
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
          filename = "__planetaris-unbounded__/graphics/entity/arig-roboport/roboport-base.png",
          width = 228,
          height = 277,
          shift = util.by_pixel(2, -2.25),
          scale = 0.5
        },
        {
          filename = "__planetaris-unbounded__/graphics/entity/arig-roboport/roboport-shadow.png",
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
      filename = "__planetaris-unbounded__/graphics/entity/arig-roboport/roboport-base-patch.png",
      priority = "medium",
      width = 138,
      height = 100,
      shift = util.by_pixel(1.5, -5),
      scale = 0.5
    },
    base_animation =
    {
      filename = "__planetaris-unbounded__/graphics/entity/arig-roboport/roboport-base-animation.png",
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
      filename = "__planetaris-unbounded__/graphics/entity/arig-roboport/roboport-door-up.png",
      priority = "medium",
      width = 97,
      height = 38,
      frame_count = 16,
      shift = util.by_pixel(-0.25, -39.5),
      scale = 0.5
    },
    door_animation_down =
    {
      filename = "__planetaris-unbounded__/graphics/entity/arig-roboport/roboport-door-down.png",
      priority = "medium",
      width = 97,
      height = 41,
      frame_count = 16,
      shift = util.by_pixel(-0.25, -19.75),
      scale = 0.5
    },
    recharging_animation =
    {
      filename = "__planetaris-unbounded__/graphics/entity/arig-roboport/roboport-recharging.png",
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
        filename = "__planetaris-unbounded__/graphics/entity/arig-roboport/roboport-reflection.png",
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
    icon = "__planetaris-unbounded__/graphics/icons/supported-solar-panel.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.5, result = "planetaris-supported-solar-panel"},
    fast_replaceable_group = nil,
    max_health = 300,
    corpse = "solar-panel-remnants",
    dying_explosion = "solar-panel-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    collision_mask = {layers = {ground_tile = true},{rail_support = true}},
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
          filename = "__planetaris-unbounded__/graphics/entity/supported-solar-panel/supported-solar-panel.png",
          priority = "high",
          width = 200,
          height = 245,
          shift = util.by_pixel(0, -10),
          scale = 0.6
        },
        {
          filename = "__planetaris-unbounded__/graphics/entity/supported-solar-panel/supported-solar-panel-shadow.png",
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
          filename = "__planetaris-unbounded__/graphics/entity/supported-solar-panel/supported-solar-panel-reflection.png",
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
    icon = "__planetaris-unbounded__/graphics/icons/high-support-electric-pole.png",
    quality_indicator_scale = 0.75,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "planetaris-high-support-electric-pole"},
    max_health = 150,
    corpse = "small-electric-pole-remnants",
    dying_explosion = "small-electric-pole-explosion",
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    collision_mask = {layers = {ground_tile = true},{rail_support = true}},
    selection_box = {{-0.4, -0.4}, {0.4, 0.4}},
    damaged_trigger_effect = hit_effects.entity({{-0.2, -2.2}, {0.2, 0.2}}),
    drawing_box_vertical_extension = 2.2,
    maximum_wire_distance = 6.5,
    supply_area_distance = 1.5,
    impact_category = "wood",
    open_sound = sounds.electric_network_open,
    close_sound = sounds.electric_network_close,
    fast_replaceable_group = "electric-pole",
    pictures =
    {
      layers =
      {
        {
          filename = "__planetaris-unbounded__/graphics/entity/high-support-electric-pole/high-support-electric-pole.png",
          priority = "extra-high",
          width = 72,
          height = 220,
          direction_count = 4,
          shift = util.by_pixel(1.5, -42.5),
          scale = 0.5
        },
        {
          filename = "__planetaris-unbounded__/graphics/entity/high-support-electric-pole/high-support-electric-pole-shadow.png",
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
      filename = "__planetaris-unbounded__/graphics/entity/high-support-electric-pole/high-support-electric-pole-visualization.png",
      width = 12,
      height = 12,
      priority = "extra-high-no-scale"
    },
    water_reflection =
    {
      pictures =
      {
        filename = "__planetaris-unbounded__/graphics/entity/high-support-electric-pole/high-support-electric-pole-reflection.png",
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
  icon = "__planetaris-unbounded__/graphics/icons/water-harvester.png",
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
          filename = "__planetaris-unbounded__/graphics/entity/water-harvester/water-harvester.png",
          width = 384,
          height = 384,
          frame_count = 1,
          line_length = 1,
          animation_speed = 0.5,
          shift = util.by_pixel(0, 0),
          scale = 0.32
        },
        {
          filename = "__planetaris-unbounded__/graphics/entity/water-harvester/water-harvester-shadow.png",
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
        property = "planetaris-dust-concentration",
        min = 50,
        max = 100,
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

-----------------------------------------------------------------
--------------------------- Hyarion
-----------------------------------------------------------------

data:extend({
{
    type = "furnace",
    name = "planetaris-quartz-furnace",
    icon = "__planetaris-unbounded-assets__/graphics/icons/quartz-furnace.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "planetaris-quartz-furnace"},
    fast_replaceable_group = "furnace",
    next_upgrade = "steel-furnace",
    circuit_wire_max_distance = furnace_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["stone-furnace"],
    max_health = 50,
    corpse = "planetaris-quartz-furnace-remnants",
    dying_explosion = "stone-furnace-explosion",
    repair_sound = sounds.manual_repair,
    mined_sound = sounds.deconstruct_bricks(0.8),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    allowed_effects = {"speed", "consumption", "pollution"},
    effect_receiver = {uses_module_effects = false, uses_beacon_effects = false, uses_surface_effects = true},
    impact_category = "stone",
    icon_draw_specification = {scale = 0.66, shift = {0, -0.1}},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/furnace.ogg",
        volume = 0.6,
        modifiers = {volume_multiplier("main-menu", 1.5), volume_multiplier("tips-and-tricks", 1.4)},
        audible_distance_modifier = 0.4
      },
      fade_in_ticks = 4,
      fade_out_ticks = 20,
    },
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "explosion",
        percent = 30
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-0.8, -1}, {0.8, 1}},
    damaged_trigger_effect = hit_effects.rock(),
    crafting_categories = {"smelting"},
    result_inventory_size = 2,
    energy_usage = "100kW",
    crafting_speed = 1,
    source_inventory_size = 1,
    energy_source =
    {
      type = "burner",
      fuel_categories = {"chemical"},
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions_per_minute = { pollution = 1 },
      light_flicker =
      {
        color = {0,0,0},
        minimum_intensity = 0.6,
        maximum_intensity = 0.95
      },
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 5,
          position = {0.0, -0.8},
          starting_vertical_speed = 0.08,
          starting_frame_deviation = 60
        }
      }
    },
    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/quartz-furnace/quartz-furnace.png",
            priority = "extra-high",
            width = 151,
            height = 146,
            shift = util.by_pixel(-0.25, 6),
            scale = 0.5
          },
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/quartz-furnace/quartz-furnace-shadow.png",
            priority = "extra-high",
            width = 164,
            height = 74,
            draw_as_shadow = true,
            shift = util.by_pixel(14.5, 13),
            scale = 0.5
          }
        }
      },
      working_visualisations =
      {
        {
          fadeout = true,
          effect = "flicker",
          animation =
          {
            layers =
            {
              {
                filename = "__planetaris-unbounded-assets__/graphics/entity/quartz-furnace/quartz-furnace-fire.png",
                priority = "extra-high",
                line_length = 8,
                width = 41,
                height = 100,
                frame_count = 48,
                draw_as_glow = true,
                shift = util.by_pixel(-0.75, 5.5),
                scale = 0.5
              },
              {
                filename = "__planetaris-unbounded-assets__/graphics/entity/quartz-furnace/quartz-furnace-light.png",
                blend_mode = "additive",
                width = 106,
                height = 144,
                repeat_count = 48,
                draw_as_glow = true,
                shift = util.by_pixel(0, 5),
                scale = 0.5,
              },
            }
          }
        },
        {
          fadeout = true,
          effect = "flicker",
          animation =
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/quartz-furnace/quartz-furnace-ground-light.png",
            blend_mode = "additive",
            width = 116,
            height = 110,
            repeat_count = 48,
            draw_as_light = true,
            shift = util.by_pixel(-1, 44),
            scale = 0.5,
          },
        },
      },
      water_reflection =
      {
        pictures =
        {
          filename = "__planetaris-unbounded-assets__/graphics/entity/quartz-furnace/quartz-furnace-reflection.png",
          priority = "extra-high",
          width = 16,
          height = 16,
          shift = util.by_pixel(0, 35),
          variation_count = 1,
          scale = 5
        },
        rotate = false,
        orientation_to_variation = false
      }
    }
  },
})

-----------------------------------------------------------------
--------------------------- Hyarion
-----------------------------------------------------------------

data:extend({
{
    type = "furnace",
    name = "planetaris-quartz-furnace",
    icon = "__planetaris-unbounded-assets__/graphics/icons/quartz-furnace.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "planetaris-quartz-furnace"},
    fast_replaceable_group = "furnace",
    next_upgrade = "steel-furnace",
    circuit_wire_max_distance = furnace_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions["stone-furnace"],
    max_health = 50,
    corpse = "planetaris-quartz-furnace-remnants",
    dying_explosion = "stone-furnace-explosion",
    repair_sound = sounds.manual_repair,
    mined_sound = sounds.deconstruct_bricks(0.8),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    allowed_effects = {"speed", "consumption", "pollution"},
    effect_receiver = {uses_module_effects = false, uses_beacon_effects = false, uses_surface_effects = true},
    impact_category = "stone",
    icon_draw_specification = {scale = 0.66, shift = {0, -0.1}},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/furnace.ogg",
        volume = 0.6,
        modifiers = {volume_multiplier("main-menu", 1.5), volume_multiplier("tips-and-tricks", 1.4)},
        audible_distance_modifier = 0.4
      },
      fade_in_ticks = 4,
      fade_out_ticks = 20,
    },
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "explosion",
        percent = 30
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-0.8, -1}, {0.8, 1}},
    damaged_trigger_effect = hit_effects.rock(),
    crafting_categories = {"smelting"},
    result_inventory_size = 2,
    energy_usage = "100kW",
    crafting_speed = 1,
    source_inventory_size = 1,
    energy_source =
    {
      type = "burner",
      fuel_categories = {"chemical"},
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions_per_minute = { pollution = 1 },
      light_flicker =
      {
        color = {0,0,0},
        minimum_intensity = 0.6,
        maximum_intensity = 0.95
      },
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 5,
          position = {0.0, -0.8},
          starting_vertical_speed = 0.08,
          starting_frame_deviation = 60
        }
      }
    },
    graphics_set =
    {
      animation =
      {
        layers =
        {
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/quartz-furnace/quartz-furnace.png",
            priority = "extra-high",
            width = 151,
            height = 146,
            shift = util.by_pixel(-0.25, 6),
            scale = 0.5
          },
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/quartz-furnace/quartz-furnace-shadow.png",
            priority = "extra-high",
            width = 164,
            height = 74,
            draw_as_shadow = true,
            shift = util.by_pixel(14.5, 13),
            scale = 0.5
          }
        }
      },
      working_visualisations =
      {
        {
          fadeout = true,
          effect = "flicker",
          animation =
          {
            layers =
            {
              {
                filename = "__planetaris-unbounded-assets__/graphics/entity/quartz-furnace/quartz-furnace-fire.png",
                priority = "extra-high",
                line_length = 8,
                width = 41,
                height = 100,
                frame_count = 48,
                draw_as_glow = true,
                shift = util.by_pixel(-0.75, 5.5),
                scale = 0.5
              },
              {
                filename = "__planetaris-unbounded-assets__/graphics/entity/quartz-furnace/quartz-furnace-light.png",
                blend_mode = "additive",
                width = 106,
                height = 144,
                repeat_count = 48,
                draw_as_glow = true,
                shift = util.by_pixel(0, 5),
                scale = 0.5,
              },
            }
          }
        },
        {
          fadeout = true,
          effect = "flicker",
          animation =
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/quartz-furnace/quartz-furnace-ground-light.png",
            blend_mode = "additive",
            width = 116,
            height = 110,
            repeat_count = 48,
            draw_as_light = true,
            shift = util.by_pixel(-1, 44),
            scale = 0.5,
          },
        },
      },
      water_reflection =
      {
        pictures =
        {
          filename = "__planetaris-unbounded-assets__/graphics/entity/quartz-furnace/quartz-furnace-reflection.png",
          priority = "extra-high",
          width = 16,
          height = 16,
          shift = util.by_pixel(0, 35),
          variation_count = 1,
          scale = 5
        },
        rotate = false,
        orientation_to_variation = false
      }
    }
  },
{
    type = "lightning-attractor",
    name = "planetaris-refraction-ray-collector",
    efficiency = 0.2,
    range_elongation = 15.0,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "500MJ",
      usage_priority = "primary-output",
      output_flow_limit = "500MJ",
      drain = "2.5MJ"
    },
    icon = "__planetaris-unbounded-assets__/graphics/icons/refraction-ray-collector.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.2, result = "planetaris-refraction-ray-collector"},
    max_health = 200,
    corpse = "lightning-rod-remnants",
    dying_explosion = "medium-electric-pole-explosion",
    factoriopedia_simulation = simulations.factoriopedia_refraction_ray_collector,
    resistances =
    {
      {
        type = "fire",
        percent = 50
      },
      {
        type = "electric",
        percent = 100
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    lightning_strike_offset = {0, -1},
    damaged_trigger_effect = hit_effects.entity({{-0.2, -2.2},{0.2, 0.2}}),
    drawing_box_vertical_extension = 1.5,
    open_sound = sounds.electric_network_open,
    close_sound = sounds.electric_network_close,
    working_sound =
    {
      main_sounds =
      {
        {
          sound =
          {
            filename = "__space-age__/sound/entity/lightning-attractor/lightning-attractor-charge.ogg",
            volume = 0.5,
            audible_distance_modifier = 0.5,
          },
          match_volume_to_activity = true,
          activity_to_volume_modifiers = {offset = 2, inverted = true},
        },
        {
          sound =
          {
            filename = "__space-age__/sound/entity/lightning-attractor/lightning-attractor-discharge.ogg",
            volume = 0.5,
            audible_distance_modifier = 0.5,
          },
          match_volume_to_activity = true,
          activity_to_volume_modifiers = {offset = 1},
        }
      },
      max_sounds_per_prototype = 3,
    },
    chargable_graphics = require("__planetaris-unbounded__.prototypes.entities.refraction-ray-collector"),
    water_reflection =
    {
      pictures =
      {
        filename = "__planetaris-unbounded-assets__/graphics/entity/refraction-ray-collector/refraction-ray-collector-reflection.png",
        priority = "extra-high",
        width = 11,
        height = 30,
        shift = util.by_pixel(0, 50),
        variation_count = 1,
        scale = 1
      },
      rotate = false,
      orientation_to_variation = false
    },
      surface_conditions =
    {
      {
        property = "planetaris-crystalization-resistance",
        min = 50,
        max = 100,
      }
    },
  },
{
    type = "lightning-attractor",
    name = "planetaris-big-refraction-ray-collector",
    efficiency = 0.7,
    range_elongation = 25.0,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "1000MJ",
      usage_priority = "primary-output",
      output_flow_limit = "1000MJ",
      drain = "3.5MJ"
    },
    icon = "__planetaris-unbounded-assets__/graphics/icons/big-refraction-ray-collector.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.3, result = "planetaris-big-refraction-ray-collector"},
    max_health = 350,
    corpse = "accumulator-remnants",
    dying_explosion = "accumulator-explosion",
    factoriopedia_simulation = simulations.factoriopedia_big_refraction_ray_collector,
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "electric",
        percent = 100
      }
    },
    collision_box = {{-0.85, -0.85}, {0.85, 0.85}},
    selection_box = {{-1, -1}, {1, 1}},
    lightning_strike_offset = {0, -1},
    damaged_trigger_effect = hit_effects.entity({{-0.2, -2.2},{0.2, 0.2}}),
    open_sound = sounds.electric_network_open,
    close_sound = sounds.electric_network_close,
    working_sound =
    {
      main_sounds =
      {
        {
          sound =
          {
            filename = "__space-age__/sound/entity/lightning-attractor/lightning-attractor-charge.ogg",
            volume = 0.5,
            audible_distance_modifier = 0.5,
          },
          match_volume_to_activity = true,
          activity_to_volume_modifiers = {offset = 2, inverted = true},
        },
        {
          sound =
          {
            filename = "__space-age__/sound/entity/lightning-attractor/lightning-attractor-discharge.ogg",
            volume = 0.5,
            audible_distance_modifier = 0.5,
          },
          match_volume_to_activity = true,
          activity_to_volume_modifiers = {offset = 1},
        }
      },
      max_sounds_per_prototype = 3,
    },
    chargable_graphics = require("__planetaris-unbounded__.prototypes.entities.big-refraction-ray-collector"),
    water_reflection =
    {
      pictures =
      {
        filename = "__planetaris-unbounded-assets__/graphics/entity/big-refraction-ray-collector/big-refraction-ray-collector-reflection.png",
        priority = "extra-high",
        width = 11,
        height = 30,
        shift = util.by_pixel(0, 28),
        variation_count = 1,
        scale = 1
      },
      rotate = false,
      orientation_to_variation = false
    },
      surface_conditions =
    {
      {
        property = "planetaris-crystalization-resistance",
        min = 50,
        max = 100,
      }
    },
  },
{
    type = "burner-generator",
    name = "planetaris-refraction-plant",
    icon = "__planetaris-unbounded-assets__/graphics/icons/refraction-plant.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.8, results = {{type = "item", name = "planetaris-refraction-plant", amount = 1}}},
    max_health = 1000,
    fast_replaceable_group = nil,
    corpse = data.raw["fusion-reactor"]["fusion-reactor"].corpse,
    dying_explosion = "big-explosion",
    resistances = {
        {type = "physical", percent = 50},
        {type = "fire",     percent = 20},
        {type = "impact",   percent = 100},
    },

    heating_energy = "500kW",
    neighbour_bonus = 1,
    module_slots = nil,

    collision_box = {{-2.7, -2.7}, {2.7, 2.7}},
    selection_box = {{-3, -3}, {3, 3}},
    drawing_box_vertical_extension = 1,
    damaged_trigger_effect = hit_effects.entity(),
  
    impact_category = data.raw["assembling-machine"]["electromagnetic-plant"].impact_category,
    open_sound = table.deepcopy(data.raw["assembling-machine"]["chemical-plant"].open_sound),
    close_sound = table.deepcopy(data.raw["assembling-machine"]["chemical-plant"].close_sound),
    working_sound = {
      sound = sound_variations("__base__/sound/nuclear-reactor", 2, 0.55, volume_multiplier("main-menu", 0.8)),
      max_sounds_per_prototype = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    idle_sound = {filename = "__base__/sound/idle1.ogg"},

    result_inventory_size = 2,
    consumption = "10MW",
    max_power_output = "20MW",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-output"
    },
    burner =
    {
      type = "burner",
      fuel_categories = {"refraction"},
      effectivity = 1,
      fuel_inventory_size = 1,
      burnt_inventory_size = 1,
      light_flicker =
      {
        color = {0,0,0},
        minimum_intensity = 0.7,
        maximum_intensity = 0.95
      }
    },

    animation =
    {
      north = {
        layers =
        {
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/refraction-plant/refraction-plant-hr-working-glow.png",
            width = 400,
            height = 450,
            frame_count = 60,
            line_length = 8,
            animation_speed = 1,
            shift = util.by_pixel(0, -10),
            scale = 0.5
          },
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/refraction-plant/refraction-plant-hr-shadow.png",
            width = 700,
            height = 600,          
            repeat_count = 60,
            draw_as_shadow = true,
            shift = util.by_pixel(0, -10),
            scale = 0.5
          },
        }
      }
    },

    idle_animation =
    {
      north = {
        layers = {
      {
      filename = "__planetaris-unbounded-assets__/graphics/entity/refraction-plant/refraction-plant-hr-animation-1.png",
      frame_count = 60,
      line_length = 8,
      width = 400,
      height = 450,
      animation_speed = 0.5,
      shift = util.by_pixel(0, -10),
      scale = 0.5
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/entity/refraction-plant/refraction-plant-hr-shadow.png",
        width = 700,
        height = 600,          
        repeat_count = 60,
        draw_as_shadow = true,
        shift = util.by_pixel(0, -10),
        scale = 0.5
      },
    }}},

    icon_draw_specification = {scale = 1.75, shift = {0, -0.3}},
    circuit_connector = circuit_connector_definitions["foundry"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
},
{
    type = "wall",
    name = "planetaris-beryllium-coating",
    icon = "__planetaris-unbounded-assets__/graphics/icons/beryllium-coating.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.wall(),
    minable = {mining_time = 0.4, result = "planetaris-beryllium-coating"},
    fast_replaceable_group = nil,
    max_health = 650,
    repair_speed_modifier = 3,
    corpse = "planetaris-beryllium-coating-remnants",
    dying_explosion = "wall-explosion",
    repair_sound = sounds.manual_repair,
    mined_sound = sounds.deconstruct_bricks(0.8),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    impact_category = "stone",

    connected_gate_visualization =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "high",
      width = 64,
      height = 64,
      scale = 1
    },
    resistances =
    {
      {
        type = "physical",
        decrease = 3,
        percent = 40
      },
      {
        type = "impact",
        decrease = 45,
        percent = 70
      },
      {
        type = "explosion",
        decrease = 10,
        percent = 60
      },
      {
        type = "fire",
        percent = 100
      },
      {
        type = "acid",
        percent = 20
      },
      {
        type = "laser",
        percent = 70
      }
    },
    surface_conditions =
    {
      {
        property = "gravity",
        min = 0,
        max = 0
      }
    },
    visual_merge_group = 1, -- different walls will visually connect to each other if their merge group is same (defaults to 0)
    pictures =
    {
      single =
      {
        layers =
        {
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/beryllium-coating/wall-single.png",
            priority = "extra-high",
            width = 64,
            height = 86,
            variation_count = 2,
            line_length = 2,
            shift = util.by_pixel(0, -5 - wall_shift),
            scale = 1
          },
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/beryllium-coating/wall-single-shadow.png",
            priority = "extra-high",
            width = 98,
            height = 60,
            repeat_count = 2,
            shift = util.by_pixel(10, 17 - wall_shift),
            draw_as_shadow = true,
            scale = 1
          }
        }
      },
      straight_vertical =
      {
        layers =
        {
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/beryllium-coating/wall-vertical.png",
            priority = "extra-high",
            width = 64,
            height = 134,
            variation_count = 5,
            line_length = 5,
            shift = util.by_pixel(0, 8 - wall_shift),
            scale = 1
          },
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/beryllium-coating/wall-vertical-shadow.png",
            priority = "extra-high",
            width = 98,
            height = 110,
            repeat_count = 5,
            shift = util.by_pixel(10, 29 - wall_shift),
            draw_as_shadow = true,
            scale = 1
          }
        }
      },
      straight_horizontal =
      {
        layers =
        {
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/beryllium-coating/wall-horizontal.png",
            priority = "extra-high",
            width = 64,
            height = 92,
            variation_count = 6,
            line_length = 6,
            shift = util.by_pixel(0, -2 - wall_shift),
            scale = 1
          },
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/beryllium-coating/wall-horizontal-shadow.png",
            priority = "extra-high",
            width = 124,
            height = 68,
            repeat_count = 6,
            shift = util.by_pixel(14, 15 - wall_shift),
            draw_as_shadow = true,
            scale = 1
          }
        }
      },
      corner_right_down =
      {
        layers =
        {
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/beryllium-coating/wall-corner-right.png",
            priority = "extra-high",
            width = 64,
            height = 128,
            variation_count = 2,
            line_length = 2,
            shift = util.by_pixel(0, 7 - wall_shift_adjust),
            scale = 1
          },
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/beryllium-coating/wall-corner-right-shadow.png",
            priority = "extra-high",
            width = 124,
            height = 120,
            repeat_count = 2,
            shift = util.by_pixel(17, 28 - wall_shift_adjust),
            draw_as_shadow = true,
            scale = 1
          }
        }
      },
      corner_left_down =
      {
        layers =
        {
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/beryllium-coating/wall-corner-left.png",
            priority = "extra-high",
            width = 64,
            height = 134,
            variation_count = 2,
            line_length = 2,
            shift = util.by_pixel(0, 7 - wall_shift_adjust),
            scale = 1
          },
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/beryllium-coating/wall-corner-left-shadow.png",
            priority = "extra-high",
            width = 102,
            height = 120,
            repeat_count = 2,
            shift = util.by_pixel(9, 28 - wall_shift_adjust),
            draw_as_shadow = true,
            scale = 1
          }
        }
      },
      t_up =
      {
        layers =
        {
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/beryllium-coating/wall-t.png",
            priority = "extra-high",
            width = 64,
            height = 134,
            variation_count = 4,
            line_length = 4,
            shift = util.by_pixel(0, 7 - wall_shift_adjust),
            scale = 1
          },
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/beryllium-coating/wall-t-shadow.png",
            priority = "extra-high",
            width = 124,
            height = 120,
            repeat_count = 4,
            shift = util.by_pixel(14, 28 - wall_shift_adjust),
            draw_as_shadow = true,
            scale = 1
          }
        }
      },
      ending_right =
      {
        layers =
        {
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/beryllium-coating/wall-ending-right.png",
            priority = "extra-high",
            width = 64,
            height = 92,
            variation_count = 2,
            line_length = 2,
            shift = util.by_pixel(0, -3 - wall_shift),
            scale = 1
          },
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/beryllium-coating/wall-ending-right-shadow.png",
            priority = "extra-high",
            width = 124,
            height = 68,
            repeat_count = 2,
            shift = util.by_pixel(17, 15 - wall_shift),
            draw_as_shadow = true,
            scale = 1
          }
        }
      },
      ending_left =
      {
        layers =
        {
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/beryllium-coating/wall-ending-left.png",
            priority = "extra-high",
            width = 64,
            height = 92,
            variation_count = 2,
            line_length = 2,
            shift = util.by_pixel(0, -3 - wall_shift),
            scale = 1
          },
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/beryllium-coating/wall-ending-left-shadow.png",
            priority = "extra-high",
            width = 102,
            height = 68,
            repeat_count = 2,
            shift = util.by_pixel(9, 15 - wall_shift),
            draw_as_shadow = true,
            scale = 1
          }
        }
      },
      filling =
      {
        filename = "__planetaris-unbounded-assets__/graphics/entity/beryllium-coating/wall-filling.png",
        priority = "extra-high",
        width = 48,
        height = 56,
        variation_count = 8,
        line_length = 8,
        shift = util.by_pixel(0 + 0, -1 - wall_shift - 17),
        scale = 0.5
      },
      water_connection_patch =
      {
        sheets =
        {
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/beryllium-coating/wall-patch.png",
            priority = "extra-high",
            width = 116,
            height = 128,
            shift = util.by_pixel(0, -2 - wall_shift),
            scale = 1
          },
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/beryllium-coating/wall-patch-shadow.png",
            priority = "extra-high",
            width = 144,
            height = 100,
            shift = util.by_pixel(9, 15 - wall_shift),
            draw_as_shadow = true,
            scale = 1
          }
        }
      },
      gate_connection_patch =
      {
        sheets =
        {
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/beryllium-coating/wall-gate.png",
            priority = "extra-high",
            width = 82,
            height = 108,
            shift = util.by_pixel(0, -7 - wall_shift),
            scale = 1
          },
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/beryllium-coating/wall-gate-shadow.png",
            priority = "extra-high",
            width = 130,
            height = 78,
            shift = util.by_pixel(14, 18 - wall_shift),
            draw_as_shadow = true,
            scale = 1
          }
        }
      }
    },

    wall_diode_green =
    {
      sheet =
      {
        filename = "__planetaris-unbounded-assets__/graphics/entity/beryllium-coating/wall-diode-green.png",
        priority = "extra-high",
        width = 72,
        height = 44,
        draw_as_glow = true,
        --frames = 4,
        shift = util.by_pixel(-1, -23 - wall_shift),
        scale = 1
      }
    },
    wall_diode_green_light_top =
    {
      minimum_darkness = 0.3,
      color = {g=1},
      shift = util.by_pixel(0, -30 - wall_shift),
      size = 1,
      intensity = 0.2
    },
    wall_diode_green_light_right =
    {
      minimum_darkness = 0.3,
      color = {g=1},
      shift = util.by_pixel(12, -23 - wall_shift),
      size = 1,
      intensity = 0.2
    },
    wall_diode_green_light_bottom =
    {
      minimum_darkness = 0.3,
      color = {g=1},
      shift = util.by_pixel(0, -17 - wall_shift),
      size = 1,
      intensity = 0.2
    },
    wall_diode_green_light_left =
    {
      minimum_darkness = 0.3,
      color = {g=1},
      shift = util.by_pixel(-12, -23 - wall_shift),
      size = 1,
      intensity = 0.2
    },

    wall_diode_red =
    {
      sheet =
      {
        filename = "__planetaris-unbounded-assets__/graphics/entity/beryllium-coating/wall-diode-red.png",
        priority = "extra-high",
        width = 72,
        height = 44,
        draw_as_glow = true,
        --frames = 4,
        shift = util.by_pixel(-1, -23 - wall_shift),
        scale = 1
      }
    },
    wall_diode_red_light_top =
    {
      minimum_darkness = 0.3,
      color = {r=1},
      shift = util.by_pixel(0, -30 - wall_shift),
      size = 1,
      intensity = 0.2
    },
    wall_diode_red_light_right =
    {
      minimum_darkness = 0.3,
      color = {r=1},
      shift = util.by_pixel(12, -23 - wall_shift),
      size = 1,
      intensity = 0.2
    },
    wall_diode_red_light_bottom =
    {
      minimum_darkness = 0.3,
      color = {r=1},
      shift = util.by_pixel(0, -17 - wall_shift),
      size = 1,
      intensity = 0.2
    },
    wall_diode_red_light_left =
    {
      minimum_darkness = 0.3,
      color = {r=1},
      shift = util.by_pixel(-12, -23 - wall_shift),
      size = 1,
      intensity = 0.2
    },

    circuit_connector = circuit_connector_definitions["wall"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    default_output_signal = {type = "virtual", name = "signal-G"}
  },
{
    type = "assembling-machine",
    name = "planetaris-space-manufacturer",
    icon = "__planetaris-unbounded-assets__/graphics/icons/space-manufacturer.png",
    icon_size = 64,
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    subgroup = "space-facilities",
    order = "a-a",
    minable = {mining_time = 1, results = {{type = "item", name = "planetaris-space-manufacturer", amount = 1}}},
    fast_replaceable_group = nil,
    max_health = 1800,
    corpse = data.raw["fusion-reactor"]["fusion-reactor"].corpse,
    dying_explosion = "big-explosion",
    resistances = {
        {type = "physical", percent = 30},
        {type = "fire",     percent = 20},
        {type = "impact",   percent = 50},
    },
    heating_energy = "800kW",

    collision_box = {{-2.5, -2.5}, {2.5, 2.5}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    tile_buildability_rules =
    {
      {
        area = {{-5.5, -5.5}, {5.5, 5.5}},
        required_tiles = {layers = {ground_tile = true}},
        colliding_tiles = {layers = {empty_space = true}},
        remove_on_collision = true
      }
    },
    drawing_box_vertical_extension = 0.5,
    damaged_trigger_effect = hit_effects.entity(),
  
    impact_category = "metal",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound = {
      sound = sound_variations("__base__/sound/nuclear-reactor", 2, 0.55, volume_multiplier("main-menu", 0.8)),
      max_sounds_per_prototype = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    idle_sound = {filename = "__base__/sound/idle1.ogg"},

    crafting_speed = 1,
    crafting_categories = {"sifting"},
    result_inventory_size = 2,
    module_slots = 6,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    energy_usage = "250kW",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = 2 }
    },
    surface_conditions =
    {
      {
        property = "gravity",
        min = 0,
        max = 0
      }
    },

    graphics_set =
    {
      animation =
      {
      north = {
        layers =
        {
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/space-manufacturer/space-manufacturer-animation.png",
            priority = "high",
            animation_speed = 0.5,
            scale = 0.5,
            line_length= 10,
            frame_count= 100,
            draw_as_glow= false,
            width= 320,
            height= 350,
            shift = util.by_pixel(0, 0),
          },
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/space-manufacturer/space-manufacturer-shadow.png",
            priority = "extra-high",
            width = 320,
            height = 350,
            repeat_count = 100,
            shift = util.by_pixel(10, 0),
            draw_as_shadow = true,
            scale = 0.5
            }
          }
        },
      },
    idle_animation =
    {
      north = {
        layers = {
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/space-manufacturer/space-manufacturer-color2.png",
            priority = "extra-high",
            width = 320,
            height = 350,
            repeat_count = 100,
            scale = 0.5
          },
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/space-manufacturer/space-manufacturer-color1.png",
            priority = "extra-high",
            width = 320,
            height = 350,
            repeat_count = 100,
            scale = 0.5
          },
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/space-manufacturer/space-manufacturer-idle.png",
            priority = "extra-high",
            width = 320,
            height = 350,
            repeat_count = 100,
            scale = 0.5
          },
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/space-manufacturer/space-manufacturer-shadow.png",
            priority = "extra-high",
            width = 320,
            height = 350,
            shift = util.by_pixel(10, 0),
            draw_as_shadow = true,
            repeat_count = 100,
            scale = 0.5
          },
    }}
    },
    working_visualisations = {
      {
        animation =
            {
            filename = "__planetaris-unbounded-assets__/graphics/entity/space-manufacturer/space-manufacturer-emission3.png",
            priority = "high",
            scale= 0.5,
            line_length= 10,
            frame_count= 100,
            width= 320,
            height= 350,
            shift = util.by_pixel(0, 0),
            draw_as_glow= true,
            blend_mode= "additive",
          },
      },
      {
        animation =
            {
            filename = "__planetaris-unbounded-assets__/graphics/entity/space-manufacturer/space-manufacturer-emission2.png",
            priority = "high",
            scale= 0.5,
            line_length= 10,
            frame_count= 100,
            width= 320,
            height= 350,
            shift = util.by_pixel(0, 0),
            draw_as_glow= true,
            blend_mode= "additive",
          },
      },
      {
        animation =
            {
            filename = "__planetaris-unbounded-assets__/graphics/entity/space-manufacturer/space-manufacturer-emission1.png",
            priority = "high",
            scale= 0.5,
            line_length= 10,
            frame_count= 100,
            width= 320,
            height= 350,
            shift = util.by_pixel(0, 0),
            draw_as_glow= true,
            blend_mode= "additive",
          },
      },
      {
        animation =
            {
            filename = "__planetaris-unbounded-assets__/graphics/entity/space-manufacturer/space-manufacturer-color2.png",
            priority = "high",
            scale= 0.5,
            line_length= 10,
            frame_count= 100,
            draw_as_glow= false,
            width= 320,
            height= 350,
            shift = util.by_pixel(0, 0),
          },
      },
      {
        animation =
            {
            filename = "__planetaris-unbounded-assets__/graphics/entity/space-manufacturer/space-manufacturer-color1.png",
            priority = "high",
            scale= 0.5,
            line_length= 10,
            frame_count= 100,
            draw_as_glow= false,
            width= 320,
            height= 350,
            shift = util.by_pixel(0, 0),
          },
      }
    }
},


    icon_draw_specification = {scale = 1.75, shift = {0, -0.5}},
    circuit_connector = circuit_connector_definitions["manufacturer"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
},
})
