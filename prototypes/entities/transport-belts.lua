require ("circuit-connector-sprites")
local meld = require("meld")
local hit_effects = require ("__base__/prototypes/entity/hit-effects")
local sounds = require("__base__/prototypes/entity/sounds")
local simulations = require("__base__/prototypes/factoriopedia-simulations")

local hyper_belt_animation_set =
{
  alternate = true,
  animation_set =
  {
    filename = "__planetaris-unbounded__/graphics/entity/hyper-transport-belt/hyper-transport-belt.png",
    priority = "extra-high",
    size = 128,
    scale = 0.5,
    frame_count = 64,
    direction_count = 20
  },
  frozen_patch = {
    filename = "__space-age__/graphics/entity/turbo-transport-belt/turbo-transport-belt-frozen.png",
    priority = "extra-high",
    size = 128,
    scale = 0.5,
    line_length = 1,
    direction_count = 20
  }
}

meld(hyper_belt_animation_set, belt_reader_gfx)

data.raw["transport-belt"]["turbo-transport-belt"].next_upgrade = "hyper-transport-belt";
data.raw["underground-belt"]["turbo-underground-belt"].next_upgrade = "hyper-underground-belt";
data.raw["splitter"]["turbo-splitter"].next_upgrade = "hyper-splitter";

data:extend({
{
    type = "transport-belt",
    name = "hyper-transport-belt",
    icon = "__planetaris-unbounded__/graphics/icons/hyper-transport-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "hyper-transport-belt"},
    max_health = 160,
    corpse = "hyper-transport-belt-remnants",
    dying_explosion = "hyper-transport-belt-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 50
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.transport_belt_open,
    close_sound = sounds.transport_belt_close,
    working_sound =
    {
      sound = { filename = "__base__/sound/express-transport-belt.ogg", volume = 0.3 },
      persistent = true
    },
    animation_speed_coefficient = 32,
    belt_animation_set = hyper_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    related_underground_belt = "turbo-underground-belt",
    next_upgrade = nil,
    speed = 0.200,
    connector_frame_sprites = transport_belt_connector_frame_sprites,
    circuit_connector = circuit_connector_definitions["belt"],
    circuit_wire_max_distance = transport_belt_circuit_wire_max_distance
  },
  {
    type = "underground-belt",
    name = "hyper-underground-belt",
    icon = "__planetaris-unbounded__/graphics/icons/hyper-underground-belt.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "hyper-underground-belt"},
    max_health = 170,
    corpse = "hyper-underground-belt-remnants",
    dying_explosion = "hyper-underground-belt-explosion",
    max_distance = 11,
    heating_energy = "250kW",
    underground_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5
    },
    underground_remove_belts_sprite =
    {
      filename = "__core__/graphics/arrows/underground-lines-remove.png",
      priority = "high",
      width = 64,
      height = 64,
      x = 64,
      scale = 0.5
    },
    resistances =
    {
      {
        type = "fire",
        percent = 60
      },
      {
        type = "impact",
        percent = 30
      }
    },
    collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    underground_collision_mask = {layers={lava_tile=true, empty_space=true}},
    damaged_trigger_effect = hit_effects.entity(),
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    working_sound =
    {
      sound = {filename = "__base__/sound/express-underground-belt.ogg", volume = 0.35, audible_distance_modifier = 0.5},
      max_sounds_per_prototype = 2,
      persistent = true,
      use_doppler_shift = false
    },
    animation_speed_coefficient = 32,
    belt_animation_set = hyper_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    speed = 0.200,
    structure =
    {
      direction_in =
      {
        sheet =
        {
          filename = "__planetaris-unbounded__/graphics/entity/hyper-underground-belt/hyper-underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192,
          scale = 0.5
        }
      },
      direction_out =
      {
        sheet =
        {
          filename = "__planetaris-unbounded__/graphics/entity/hyper-underground-belt/hyper-underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height =192,
          scale = 0.5
        }
      },
      direction_in_side_loading =
      {
        sheet =
        {
          filename = "__planetaris-unbounded__/graphics/entity/hyper-underground-belt/hyper-underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192*3,
          scale = 0.5
        }
      },
      direction_out_side_loading =
      {
        sheet =
        {
          filename = "__planetaris-unbounded__/graphics/entity/hyper-underground-belt/hyper-underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192*2,
          scale = 0.5
        }
      },
      back_patch =
      {
        sheet =
        {
          filename = "__space-age__/graphics/entity/turbo-underground-belt/turbo-underground-belt-structure-back-patch.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5
        }
      },
      front_patch =
      {
        sheet =
        {
          filename = "__space-age__/graphics/entity/turbo-underground-belt/turbo-underground-belt-structure-front-patch.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5
        }
      },
      frozen_patch_in =
      {
        sheet =
        {
          filename = "__space-age__/graphics/entity/frozen/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          y = 192,
          scale = 0.5
        }
      },
      frozen_patch_out =
      {
        sheet =
        {
          filename = "__space-age__/graphics/entity/frozen/underground-belt/underground-belt-structure.png",
          priority = "extra-high",
          width = 192,
          height = 192,
          scale = 0.5
        }
      }
    }
  },
  {
    type = "splitter",
    name = "hyper-splitter",
    icon = "__planetaris-unbounded__/graphics/icons/hyper-splitter.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "hyper-splitter"},
    max_health = 190,
    corpse = "hyper-splitter-remnants",
    dying_explosion = "hyper-splitter-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 60
      }
    },
    collision_box = {{-0.9, -0.4}, {0.9, 0.4}},
    selection_box = {{-0.9, -0.5}, {0.9, 0.5}},
    damaged_trigger_effect = hit_effects.entity(),
    animation_speed_coefficient = 32,
    structure_animation_speed_coefficient = 1.2,
    structure_animation_movement_cooldown = 10,
    icon_draw_specification = {scale = 0.5},
    belt_animation_set = hyper_belt_animation_set,
    fast_replaceable_group = "transport-belt",
    speed = 0.200,
    working_sound = sounds.express_splitter,
    related_transport_belt = "turbo-transport-belt",
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    heating_energy = "60kW",
    structure =
    {
      north =
      util.sprite_load("__planetaris-unbounded__/graphics/entity/hyper-splitter/hyper-splitter-north",
        {
          frame_count = 32,
          priority = "extra-high",
          scale = 0.5
        }
      ),
      east =
      util.sprite_load("__planetaris-unbounded__/graphics/entity/hyper-splitter/hyper-splitter-east",
        {
          frame_count = 32,
          priority = "extra-high",
          scale = 0.5
        }
      ),
      south =
      util.sprite_load("__planetaris-unbounded__/graphics/entity/hyper-splitter/hyper-splitter-south",
        {
          frame_count = 32,
          priority = "extra-high",
          scale = 0.5
        }
      ),
      west =
      util.sprite_load("__planetaris-unbounded__/graphics/entity/hyper-splitter/hyper-splitter-west",
        {
          frame_count = 32,
          priority = "extra-high",
          scale = 0.5
        }
      ),
    },
    structure_patch =
    {
      north = util.empty_sprite(),
      east =
      util.sprite_load("__planetaris-unbounded__/graphics/entity/hyper-splitter/hyper-splitter-east-top_patch",
        {
          frame_count = 32,
          priority = "extra-high",
          scale = 0.5
        }
      ),
      south = util.empty_sprite(),
      west =
      util.sprite_load("__planetaris-unbounded__/graphics/entity/hyper-splitter/hyper-splitter-west-top_patch",
        {
          frame_count = 32,
          priority = "extra-high",
          scale = 0.5
        }
      )
    },
    frozen_patch =
    {
      north =
      {
        filename = "__space-age__/graphics/entity/frozen/splitter/splitter.png",
        priority = "extra-high",
        width = 192,
        height = 128,
        scale = 0.5
      },
      east =
      {
        filename = "__space-age__/graphics/entity/frozen/splitter/splitter.png",
        priority = "extra-high",
        x = 192,
        width = 128,
        height = 192,
        scale = 0.5
      },
      south =
      {
        filename = "__space-age__/graphics/entity/frozen/splitter/splitter.png",
        priority = "extra-high",
        x = 192 + 128,
        width = 192,
        height = 128,
        scale = 0.5
      },
      west =
      {
        filename = "__space-age__/graphics/entity/frozen/splitter/splitter.png",
        priority = "extra-high",
        x = 192 * 2 + 128,
        width = 128,
        height = 192,
        scale = 0.5
      }
    }
  },
})