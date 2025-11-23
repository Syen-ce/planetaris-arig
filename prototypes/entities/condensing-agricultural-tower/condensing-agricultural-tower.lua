require ("sound-util")
require ("util")

local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")
local item_sounds = require("__base__.prototypes.item_sounds")

data.extend({
{
    type = "item",
    name = "planetaris-condensing-agricultural-tower",
    icon = "__planetaris-arig__/graphics/icons/condensing-agricultural-tower.png",
    subgroup = "agriculture",
    order = "a[agricultural-tower]-b",
    localised_name = {"entity-name.planetaris-condensing-agricultural-tower"},
    localised_description = {"entity-description.planetaris-condensing-agricultural-tower"},
    inventory_move_sound = item_sounds.mechanical_large_inventory_move,
    pick_sound = item_sounds.mechanical_large_inventory_pickup,
    drop_sound = item_sounds.mechanical_large_inventory_move,
    place_result = "planetaris-condensing-agricultural-tower",
    stack_size = 20,
    weight = 50*kg,
    default_import_location = "arig",
},
{
    type = "recipe",
    name = "planetaris-condensing-agricultural-tower",
    energy_required = 5,
    ingredients =
    {
      {type = "item", name = "steel-plate", amount = 15},
      {type = "item", name = "electronic-circuit", amount = 5},
      {type = "item", name = "wood", amount = 20},
      {type = "item", name = "planetaris-glass-panel", amount = 10},
      {type = "item", name = "landfill", amount = 1}
    },
    results = {{type="item", name="planetaris-condensing-agricultural-tower", amount=1}},
    enabled = false
},
{
    type = "agricultural-tower",
    name = "planetaris-condensing-agricultural-tower",
    icon = "__planetaris-arig__/graphics/icons/condensing-agricultural-tower.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "planetaris-condensing-agricultural-tower"},
    fast_replaceable_group = nil,
    max_health = 300,
    corpse = "planetaris-condensing-agricultural-tower-remnants",
    dying_explosion = "agricultural-tower-explosion",
    open_sound = sounds.mech_large_open,
    close_sound = sounds.mech_large_close,
    input_inventory_size = 3,
    radius_visualisation_picture =
    {
      filename = "__core__/graphics/white-square.png",
      priority = "extra-high-no-scale",
      width = 10,
      height = 10
    },
    radius = 2,
    growth_grid_tile_size = 3,
    growth_area_radius = 0.95, -- 0.95
    crane = require("__planetaris-arig__.prototypes.entities.condensing-agricultural-tower.condensing-agricultural-tower-crane"),
    planting_procedure_points =
    {
      {0.0, 0.0, 0.75},
      {0.0, 0.0, 0.0},
      {0.0, 0.05, -0.05},
      {0.0353553, 0.0353553, -0.1},
      {0.05, 0.0, -0.15},
      {0.0353553, -0.0353553, -0.2},
      {0.0, -0.05, -0.25},
      {-0.0353553, -0.0353553, -0.3},
      {-0.05, 0.0, -0.35},
      {-0.0353553, 0.0353553, -0.4},
      {0.0, 0.0, -0.45},
      {0.0, 0.0, 0.0}
    },
    harvesting_procedure_points =
    {
      {0.0, 0.0, 1.0}
    },
    drawing_box_vertical_extension = 4,
    heating_energy = "100kW",
    energy_usage = "100kW",
    crane_energy_usage = "50kW",
    working_sound =
    {
      sound =
      {
        filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-hub-loop.ogg",
        volume = 0.7,
        audible_distance_modifier = 0.7,
      },
      max_sounds_per_prototype = 4,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    central_orienting_sound =
    {
      sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-rotation-loop.ogg", volume = 0.3},
      stopped_sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-rotation-stop.ogg", volume = 0.5}
    },
    central_orienting_sound_source = "hub",
    arm_extending_sound =
    {
      sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-arm-extend-loop.ogg", volume = 0.25},
      stopped_sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-arm-extend-stop.ogg", volume = 0.6}
    },
    arm_extending_sound_source = "arm_central_joint",
    grappler_orienting_sound =
    {
      sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-grappler-orient-loop.ogg", volume = 0.25},
      stopped_sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-grappler-orient-stop.ogg", volume = 0.4}
    },
    grappler_orienting_sound_source = "grappler-hub",
    grappler_extending_sound =
    {
      sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-grappler-extend-loop.ogg", volume = 0.4},
      stopped_sound = {filename = "__space-age__/sound/entity/agricultural-tower/agricultural-tower-grappler-extend-stop.ogg", volume = 0.45}
    },
    grappler_extending_sound_source = "grappler-hub",
    planting_sound = sound_variations("__space-age__/sound/entity/agricultural-tower/agricultural-tower-planting", 5, 0.7),
    harvesting_sound = sound_variations("__space-age__/sound/entity/agricultural-tower/agricultural-tower-harvesting", 6, 0.6),
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 0.5}},
    collision_mask = {layers={item=true, object=true, player=true, water_tile=true, elevated_rail=true, is_object=true, is_lower_object=true}},
    surface_conditions =
    {
      {
        property = "pressure",
        min = 0,
        max = 2000
      }
    },
    damaged_trigger_effect = hit_effects.entity(),
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      --emissions_per_minute = { spores = 4 } -- necessary so attack groups find the entity
    },
    circuit_connector = circuit_connector_definitions["agricultural-tower"],
    circuit_wire_max_distance = 30,
    graphics_set =
    {
      animation =
      {
        layers =
        {
          util.sprite_load("__planetaris-arig__/graphics/entity/condensing-agricultural-tower/condensing-agricultural-tower-base",
          {
            priority = "high",
            animation_speed = 0.25,
            frame_count = 64,
            scale = 0.5
          }),
          util.sprite_load("__planetaris-arig__/graphics/entity/condensing-agricultural-tower/condensing-agricultural-tower-base-shadow",
          {
            priority = "high",
            frame_count = 1,
            repeat_count = 64,
            draw_as_shadow = true,
            scale = 0.5
          })
        }
      },
      recipe_not_set_tint = { primary = {r = 0.6, g = 0.6, b =  0.5, a = 1}, secondary = {r = 0.6, g =  0.6, b = 0.5, a = 1} },
      working_visualisations =
      {
        {
          always_draw = true,
          fog_mask = { rect = {{-30, -30}, {30, -2.75}}, falloff = 1 },
          animation = util.sprite_load("__planetaris-arig__/graphics/entity/condensing-agricultural-tower/condensing-agricultural-tower-base",
          {
            frame_count = 1,
            scale = 0.5
          }),
        },

        {
          --constant_speed = true,
          always_draw = true,
          --apply_recipe_tint = "primary",
          animation = util.sprite_load("__planetaris-arig__/graphics/entity/condensing-agricultural-tower/condensing-agricultural-tower-base-plant-mask",
          {
            priority = "high",
            frame_count = 64,
            animation_speed = 0.25,
            tint_as_overlay = true,
            scale = 0.5,
            tint = {r = 0.7, g =  1.0, b = 0.2,a =  1},
          }),
        },
        {
          --constant_speed = true,
          apply_recipe_tint = "secondary",
          effect = "flicker",
          fadeout = true,
          animation = util.sprite_load("__planetaris-arig__/graphics/entity/condensing-agricultural-tower/condensing-agricultural-tower-base-light",
          {
            priority = "high",
            frame_count = 64,
            animation_speed = 0.25,
            blend_mode = "additive",
            scale = 0.5
          }),
        },
        {
          effect = "flicker",
          fadeout = true,
          light = {intensity = 1.0, size = 6, shift = {-0.45, -0.25}, color = {r = 1, g = 1, b = 1}}
        },
        {
          apply_recipe_tint = "secondary",
          effect = "flicker",
          fadeout = true,
          light = {intensity = 1.0, size = 16, shift = {-1.2, -0.5}, color = {r = 1, g = 1, b = 1}}
        }
      },
      water_reflection =
      {
        pictures =
        {
          filename = "__planetaris-arig__/graphics/entity/condensing-agricultural-tower/condensing-agricultural-tower-base-reflection.png",
          priority = "extra-high",
          width = 24,
          height = 36,
          shift = util.by_pixel(0, 20),
          variation_count = 1,
          scale = 5
        },
        rotate = false,
        orientation_to_variation = false
      }
    }
  },

--------------------------------------------------------------------------
--- Water Tank
--------------------------------------------------------------------------

{
    type = "storage-tank",
    name = "hidden-condensing-agricultural-tower-tank",
    icon = "__base__/graphics/icons/storage-tank.png",
    icon_size = 64,
    flags = {"not-rotatable", "placeable-off-grid", "not-on-map", "not-deconstructable", "not-blueprintable"},
    max_health = 1000,
    corpse = "small-remnants",
    collision_box = {{-1.4, -1.4}, {1.4, 1.4}},
    selection_box = {{-1.5, -1.5}, {1.5, -0.5}},
    show_fluid_icon = false,
    collision_mask = {layers={item=true, object=true, player=true, water_tile=true}},
    surface_conditions =
    {
      {
        property = "planetaris-dust-concentration",
        min = 50,
        max = 100,
      }
    },
    fluid_box = {
        --pipe_covers = pipecoverspictures(),
        volume = 30000,
        filter = "water",
        pipe_connections = {
            { direction = defines.direction.west, position = { -1, 0 }},
            { direction = defines.direction.east, position = { 1, 0 }},
            { direction = defines.direction.north, position = { 0, -1 }},
            { direction = defines.direction.south, position = { 0, 1 }},
        },
    },
    two_direction_only = false,
    window_bounding_box = {{0, 0}, {0, 0}},
    circuit_connector = circuit_connector_definitions["storage-tank"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,
    pictures = {
      picture = {
        sheets = {
          {
            filename = "__core__/graphics/empty.png",
            priority = "extra-high",
            width = 1,
            height = 1,
            shift = {0, 0}
          }
        }
      },
      fluid_background = {
        filename = "__core__/graphics/empty.png",
        priority = "extra-high",
        width = 1,
        height = 1
      },
      window_background = {
        filename = "__core__/graphics/empty.png",
        priority = "extra-high",
        width = 1,
        height = 1
      },
      flow_sprite = {
        filename = "__core__/graphics/empty.png",
        priority = "extra-high",
        width = 1,
        height = 1
      },
      gas_flow = {
        filename = "__core__/graphics/empty.png",
        priority = "extra-high",
        width = 1,
        height = 1,
        frame_count = 1
      }
    },
    flow_length_in_ticks = 1,
  }
})