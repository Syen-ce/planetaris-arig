local hit_effects = require("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require ("__space-age__.prototypes.entity.sounds")

local manipulator_animation =
    {
        layers =
        {
            {
                filename = "__planetaris-unbounded-assets__/graphics/entity/particle-manipulator/particle-manipulator-animation.png",
                priority = "high",
                width = 544,
                height = 544,
                shift = {0, -0.5},
                frame_count = 90,
                line_length = 10,
                animation_speed = 0.5,
                scale = 0.45,
                flags = {"no-scale"}
            },
            {
                filename = "__planetaris-unbounded-assets__/graphics/entity/particle-manipulator/particle-manipulator-shadow.png",
                priority = "high",
                width = 544,
                height = 544,
                shift = util.by_pixel(71, -13.5),
                repeat_count = 90,
                scale = 0.45,
                draw_as_shadow = true,
            }
        }
    }

local manipulator_idle =
    {
        layers =
        {
            {
                filename = "__planetaris-unbounded-assets__/graphics/entity/particle-manipulator/particle-manipulator-idle.png",
                priority = "high",
                width = 544,
                height = 544,
                shift = {0, -0.5},
                repeat_count = 90,
                animation_speed = 0.5,
                scale = 0.45,
                flags = {"no-scale"}
            },
            {
                filename = "__planetaris-unbounded-assets__/graphics/entity/particle-manipulator/particle-manipulator-shadow.png",
                priority = "high",
                width = 544,
                height = 544,
                shift = util.by_pixel(71, -13.5),
                repeat_count = 90,
                scale = 0.45,
                draw_as_shadow = true,
            }
        }
    }

local par_working_visualisations = {
    {
    apply_recipe_tint = "primary",
    fadeout = true,
    animation ={
                filename = "__planetaris-unbounded-assets__/graphics/entity/particle-manipulator/particle-manipulator-color.png",
                priority = "high",
                width = 544,
                height = 544,
                shift = {0, -0.5},
                frame_count = 90,
                line_length = 10,
                animation_speed = 0.5,
                scale = 0.45,
                apply_recipe_tint = "primary",
                flags = {"no-scale"}
        }
    },
    {
    fadeout = true,
    animation ={
        filename = "__planetaris-unbounded-assets__/graphics/entity/particle-manipulator/particle-manipulator-upper-light.png",
        priority = "high",
        always_draw = true,
        width = 544,
        height = 544,
        shift = {0, -0.5},
        frame_count = 90,
        line_length = 10,
        animation_speed = 0.5,
        scale = 0.45,
        draw_as_glow= true,
        blend_mode= "additive",
        }
    },
    {
    apply_recipe_tint = "secondary",
    fadeout = true,
    animation ={
        filename = "__planetaris-unbounded-assets__/graphics/entity/particle-manipulator/particle-manipulator-particle-light.png",
        priority = "high",
        always_draw = true,
        width = 544,
        height = 544,
        shift = {0, -0.5},
        frame_count = 90,
        line_length = 10,
        animation_speed = 0.5,
        scale = 0.45,
        draw_as_glow= true,
        blend_mode= "additive",
        }
    },
    {
        fadeout = true,
        constant_speed = true,
        light = {
            intensity = 0.65,
            size = 10,
            color = {r = 1, g = 1, b = 0.75},
        },
    },
}

local par_working_sound =     {
      sound =
      {
        filename = "__space-age__/sound/entity/electromagnetic-plant/electromagnetic-plant-loop.ogg",
        volume = 0.5,
        audible_distance_modifier = 0.6
      },
      fade_in_ticks = 4,
      fade_out_ticks = 20,
  sound_accents =
  {
    {
      sound =
      {
        filename = "__space-age__/sound/entity/electromagnetic-plant/emp-arm-retract.ogg",
        volume = 0.35,
        audible_distance_modifier = 0.4,
      },      
      frame = 11,
    },
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/entity/electromagnetic-plant/emp-coil", 2, 0.6),
        audible_distance_modifier = 0.4,
      },
      frame = 1,
    },
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/entity/electromagnetic-plant/emp-coil", 2, 0.6),
        audible_distance_modifier = 0.4,
      },
      frame = 40,
    },
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/entity/electromagnetic-plant/emp-coil", 2, 0.4),
        audible_distance_modifier = 0.4,
      },     
      frame = 102,
    },
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/entity/electromagnetic-plant/emp-riser-stop", 2, 0.6),
        audible_distance_modifier = 0.4,
      },
      frame = 85,
    },
    {
      sound =
      {
        filename = "__space-age__/sound/entity/electromagnetic-plant/emp-bridge-close.ogg", volume = 0.4,
        audible_distance_modifier = 0.4,
      },
      frame = 33,
    },
    {
      sound =
      {
        filename = "__space-age__/sound/entity/electromagnetic-plant/emp-bridge-open.ogg", volume = 0.4,
        audible_distance_modifier = 0.4,
      },  
      frame = 50,
    },
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/entity/electromagnetic-plant/emp-electric", 5, 0.4),
        audible_distance_modifier = 0.4,
      },   
      frame = 35, --electric sparks to match bridge section close
    },
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/entity/electromagnetic-plant/emp-electric", 5, 0.5),
        audible_distance_modifier = 0.5,
      },
      frame = 55,
    },
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/entity/electromagnetic-plant/emp-slide-stop", 2, 0.4),
        audible_distance_modifier = 0.4,
      },
      frame = 80,
    },
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/entity/electromagnetic-plant/emp-riser-stop", 2, 0.4),
        audible_distance_modifier = 0.4,
      },
      frame = 14,
    },
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/entity/electromagnetic-plant/emp-slide-stop", 2, 0.4),
        audible_distance_modifier = 0.4,
      },
      frame = 3,
    },
    {
      sound =
      {
        variations = sound_variations("__space-age__/sound/entity/electromagnetic-plant/emp-riser-stop", 2, 0.2),
        audible_distance_modifier = 0.4,
      },
      frame = 31,
    },
    {
      sound =
      {
        filename = "__space-age__/sound/entity/electromagnetic-plant/emp-arm-stop.ogg", volume = 0.45,
        audible_distance_modifier = 0.4,
      },
      frame = 12,
    },
    {
      sound =
      {
        filename = "__space-age__/sound/entity/electromagnetic-plant/emp-arm-extend.ogg", volume = 0.5,
        audible_distance_modifier = 0.4,
      },
      frame = 1,
    },
    {
      sound =
      {
        filename = "__space-age__/sound/entity/electromagnetic-plant/emp-arm-weld.ogg", volume = 0.9,
        audible_distance_modifier = 0.4,
      },
      frame = 12,
    },
  },
  max_sounds_per_prototype = 2
}

data.extend({
  {
    type = "assembling-machine",
    name = "planetaris-particle-manipulator",
    icon = "__planetaris-unbounded-assets__/graphics/icons/particle-manipulator.png",
    icon_size = 64,
    open_sound = sounds.electric_large_open,
    close_sound = sounds.electric_large_close,
    working_sound = par_working_sound,
    flags = {"placeable-neutral", "placeable-player", "player-creation", "not-rotatable"},
    minable = {mining_time = 0.5, results = {{type = "item", name = "planetaris-particle-manipulator", amount = 1}}},
    max_health = 800,
    fast_replaceable_group = nil,
    corpse = data.raw["assembling-machine"]["electromagnetic-plant"].corpse,
    dying_explosion = "big-explosion",
    circuit_connector = circuit_connector_definitions["manufacturer"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    resistances = {
        {type = "physical", percent = 30},
        {type = "fire",     percent = 60},
        {type = "impact",   percent = 80},
    },
    heating_energy = "500kW",
    module_slots = 6,
    icons_positioning = {
        {inventory_index = defines.inventory.furnace_modules, shift = {0, 1}}
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    water_reflection = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").water_reflection,
    collision_box = {{-2.5, -2.5}, {2.5, 2.5}},
    selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
    drawing_box_vertical_extension = 0.5,
    damaged_trigger_effect = hit_effects.entity(),
    fluid_boxes = {
        {
            production_type = "input",
            pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
            pipe_picture_frozen = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures_frozen,
            pipe_covers = pipecoverspictures(),
            volume = 100,
            pipe_connections = {{direction = defines.direction.south, flow_direction = "input-output", position = {0, 2}}},
            secondary_draw_orders = {north = -1},
        },
        {
            production_type = "output",
            pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
            pipe_picture_frozen = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures_frozen,
            pipe_covers = pipecoverspictures(),
            volume = 100,
            pipe_connections = {{direction = defines.direction.east, flow_direction = "input-output", position = {2, 1}}},
            secondary_draw_orders = {north = -1},
        },
        {
            production_type = "output",
            pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
            pipe_picture_frozen = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures_frozen,
            pipe_covers = pipecoverspictures(),
            volume = 100,
            pipe_connections = {{direction = defines.direction.west, flow_direction = "input-output", position = {-2, 1}}},
            secondary_draw_orders = {north = -1},
        },
    },
    perceived_performance = {minimum = 0.25, performance_to_activity_rate = 20.0, maximum = 5},
    graphics_set = {
        animation = manipulator_animation,
        idle_animation = manipulator_idle,
        working_visualisations = par_working_visualisations
    },
    crafting_categories = {"particle-manipulation",},
    scale_entity_info_icon = true,
    impact_category = data.raw["assembling-machine"]["electromagnetic-plant"].impact_category,
    idle_sound = {filename = "__base__/sound/idle1.ogg"},
    crafting_speed = 1,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = {
            pollution = 4,
        }
    },
    icon_draw_specification = {scale = 1.75, shift = {0, -0.3}},
    energy_usage = "1.5MW",
    collision_mask = {layers = {item = true, object = true, player = true, water_tile = true}},
}
})