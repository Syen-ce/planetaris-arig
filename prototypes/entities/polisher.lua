local hit_effects = require("__base__/prototypes/entity/hit-effects")

-- part of code from maraxis mod

local polisher_animation =
    {
        layers =
        {
            {
                filename = "__planetaris-unbounded-assets__/graphics/entity/polisher/polisher-animation-1.png",
                priority = "high",
                width = 2240 / 8,
                height = 2560 / 8,
                shift = {0, -0.5},
                frame_count = 60,
                line_length = 8,
                animation_speed = 1,
                scale = 0.5,
                flags = {"no-scale"}
            },
            {
                filename = "__planetaris-unbounded-assets__/graphics/entity/polisher/polisher-shadow.png",
                priority = "high",
                width = 700,
                height = 500,
                shift = util.by_pixel(0, -16),
                repeat_count = 60,
                scale = 0.5,
                draw_as_shadow = true,
            }
        }
    }

local working_visualisations = {
        {
          fadeout = true,
          effect = "flicker",
          animation =
          {
            filename = "__planetaris-unbounded-assets__/graphics/entity/polisher/polisher-hr-emission-1.png",
            blend_mode = "additive",
            width = 2240 / 8,
            height = 2560 / 8,
            shift = {0, -0.5},
            frame_count = 60,
            line_length = 8,
            animation_speed = 1,
            draw_as_light = true,
            scale = 0.5,
          },
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

data.extend({
  {
    type = "assembling-machine",
    name = "planetaris-polisher",
    icon = "__planetaris-unbounded-assets__/graphics/icons/polisher.png",
    icon_size = 64,
    open_sound = table.deepcopy(data.raw["assembling-machine"]["chemical-plant"].open_sound),
    close_sound = table.deepcopy(data.raw["assembling-machine"]["chemical-plant"].close_sound),
    working_sound = table.deepcopy(data.raw["assembling-machine"]["chemical-plant"].working_sound),
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.5, results = {{type = "item", name = "planetaris-polisher", amount = 1}}},
    max_health = 800,
    fast_replaceable_group = nil,
    corpse = data.raw["assembling-machine"]["electromagnetic-plant"].corpse,
    dying_explosion = "big-explosion",
    circuit_connector = circuit_connector_definitions["polisher"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    resistances = {
        {type = "physical", percent = 50},
        {type = "fire",     percent = 50},
        {type = "impact",   percent = 100},
    },
    heating_energy = "500kW",
    module_slots = 4,
    icons_positioning = {
        {inventory_index = defines.inventory.furnace_modules, shift = {0, 1}}
    },
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    water_reflection = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").water_reflection,
    collision_box = {{-1.9, -1.9}, {1.9, 1.9}},
    selection_box = {{-2, -2}, {2, 2}},
    drawing_box_vertical_extension = 1,
    damaged_trigger_effect = hit_effects.entity(),
    fluid_boxes = {
        {
            production_type = "input",
            pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
            pipe_picture_frozen = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures_frozen,
            pipe_covers = pipecoverspictures(),
            volume = 100,
            pipe_connections = {{direction = defines.direction.south, flow_direction = "input-output", position = {0.5, 1.5}}},
            secondary_draw_orders = {north = -1},
        },
        {
            production_type = "output",
            pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
            pipe_picture_frozen = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures_frozen,
            pipe_covers = pipecoverspictures(),
            volume = 100,
            pipe_connections = {{direction = defines.direction.east, flow_direction = "input-output", position = {1.5, 0.5}}},
            secondary_draw_orders = {north = -1},
        },
        {
            production_type = "input",
            pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
            pipe_picture_frozen = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures_frozen,
            pipe_covers = pipecoverspictures(),
            volume = 100,
            pipe_connections = {{direction = defines.direction.north, flow_direction = "input-output", position = {-0.5, -1.5}}},
            secondary_draw_orders = {north = -1},
        },
        {
            production_type = "output",
            pipe_picture = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures,
            pipe_picture_frozen = require("__space-age__.prototypes.entity.electromagnetic-plant-pictures").pipe_pictures_frozen,
            pipe_covers = pipecoverspictures(),
            volume = 100,
            pipe_connections = {{direction = defines.direction.west, flow_direction = "input-output", position = {-1.5, -0.5}}},
            secondary_draw_orders = {north = -1},
        },
    },
    perceived_performance = {minimum = 0.25, performance_to_activity_rate = 20.0, maximum = 5},
    off_when_no_fluid_recipe = true,
    graphics_set = {
        animation = polisher_animation,
        working_visualisations = working_visualisations
    },
    crafting_categories = {"polishing",},
    scale_entity_info_icon = true,
    impact_category = data.raw["assembling-machine"]["electromagnetic-plant"].impact_category,
    idle_sound = {filename = "__base__/sound/idle1.ogg"},
    crafting_speed = 2,
    energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
        emissions_per_minute = {
            pollution = 4,
        }
    },
    icon_draw_specification = {scale = 1.75, shift = {0, -0.3}},
    energy_usage = "200kW",
    collision_mask = {layers = {item = true, object = true, player = true, water_tile = true}},
}
})