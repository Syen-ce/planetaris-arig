local sounds = require("__base__.prototypes.entity.sounds")

local crash_site_sprite_priority = "very-low"
local inv_size = 18

local arig_crash_chest_1 = table.deepcopy(data.raw["container"]["crash-site-chest-1"])
arig_crash_chest_1.name = "arig-crash-chest-1"
arig_crash_chest_1.localised_name = {"entity-name.arig-site-crash"}
arig_crash_chest_1.collision_box = {{-1, -1}, {1, 1}}
arig_crash_chest_1.selection_box = {{-1, -1}, {1, 1}}
arig_crash_chest_1.collision_mask = {layers = {player = true}}
arig_crash_chest_1.inventory_size = inv_size
arig_crash_chest_1.minable = {mining_time = 1}
arig_crash_chest_1.resistances =
    {
      {
        type = "fire",
        percent = 100
      },
      {
        type = "impact",
        percent = 60
      }
    }
arig_crash_chest_1.integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-chests/crash-site-chest-1-ground.png",
      priority = crash_site_sprite_priority,
      width = 220,
      height = 148,
      shift = util.by_pixel(-6, 12),
      scale = 1
    }
arig_crash_chest_1.picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-chests/crash-site-chest-1.png",
          priority = "extra-high",
          width = 120,
          height = 76,
          shift = util.by_pixel(2, 8),
          scale = 1
        },
        {
          filename = "__base__/graphics/entity/crash-site-chests/crash-site-chest-1-shadow.png",
          priority = "extra-high",
          width = 210,
          height = 128,
          shift = util.by_pixel(-2, 3),
          draw_as_shadow = true,
          scale = 1
        }
      }
    }

local arig_crash_chest_2 = table.deepcopy(data.raw["container"]["crash-site-chest-2"])
arig_crash_chest_2.name = "arig-crash-chest-2"
arig_crash_chest_2.localised_name = {"entity-name.arig-site-crash"}
arig_crash_chest_2.collision_box = {{-1, -1}, {1, 1}}
arig_crash_chest_2.selection_box = {{-1, -1}, {1, 1}}
arig_crash_chest_2.collision_mask = {layers = {player = true}}
arig_crash_chest_2.inventory_size = inv_size
arig_crash_chest_2.minable = {mining_time = 1}
arig_crash_chest_2.resistances =
    {
      {
        type = "fire",
        percent = 100
      },
      {
        type = "impact",
        percent = 60
      }
    }
arig_crash_chest_2.integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-chests/crash-site-chest-2-ground.png",
      priority = crash_site_sprite_priority,
      width = 218,
      height = 186,
      shift = util.by_pixel(-6, 12),
      scale = 1
    }
arig_crash_chest_2.picture =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/crash-site-chests/crash-site-chest-2.png",
          priority = "extra-high",
          width = 116,
          height = 88,
          shift = util.by_pixel(0, 8),
          scale = 1
        },
        {
          filename = "__base__/graphics/entity/crash-site-chests/crash-site-chest-2-shadow.png",
          priority = "extra-high",
          width = 188,
          height = 126,
          shift = util.by_pixel(0, 5),
          draw_as_shadow = true,
          scale = 1
        }
      }
    }

data.extend({arig_crash_chest_1, arig_crash_chest_2})

data.extend({
    {
    type = "container",
    name = "arig-crash-site-chemical-plant",
    localised_name = {"entity-name.arig-site-crash"},
    icon = "__base__/graphics/icons/crash-site-chest.png",
    flags = {"not-deconstructable", "placeable-neutral", "player-creation"},
    hidden = true,
    max_health = 350,
    minable = {mining_time = 1},
    corpse = "small-remnants",
    open_sound = sounds.metallic_chest_open,
    close_sound = sounds.metallic_chest_close,
    resistances =
    {
      {
        type = "fire",
        percent = 100
      },
      {
        type = "impact",
        percent = 60
      }
    },
    collision_box = {{-1, -1}, {1, 1}},
    selection_box = {{-1, -1}, {1, 1}},
    collision_mask = {layers = {player = true}},
    fast_replaceable_group = "container",
    inventory_size = inv_size,
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-medium-1-ground.png",
      priority = crash_site_sprite_priority,
      width = 352,
      height = 206,
      shift = util.by_pixel(-10, 5),
      scale = 0.6
    },

    picture =
    {
      layers =
      {
        {
          filename = "__planetaris-arig__/graphics/entity/crash-site/spaceship-wreck-chem.png",
          priority = "extra-high",
          width = 228,
          height = 214,
          shift = util.by_pixel(0, -26),
          scale = 0.6
        },
        {
          filename = "__base__/graphics/entity/crash-site-chests/crash-site-chest-2-shadow.png",
          priority = "extra-high",
          width = 188,
          height = 126,
          shift = util.by_pixel(0, 5),
          draw_as_shadow = true,
          scale = 1
        }
      }
    },
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
     {
    type = "container",
    name = "arig-crash-site-furnace",
    localised_name = {"entity-name.arig-site-crash"},
    icon = "__base__/graphics/icons/crash-site-chest.png",
    flags = {"not-deconstructable", "placeable-neutral", "player-creation"},
    hidden = true,
    max_health = 350,
    minable = {mining_time = 1},
    corpse = "small-remnants",
    open_sound = sounds.metallic_chest_open,
    close_sound = sounds.metallic_chest_close,
    resistances =
    {
      {
        type = "fire",
        percent = 100
      },
      {
        type = "impact",
        percent = 60
      }
    },
    collision_box = {{-1, -1}, {1, 1}},
    selection_box = {{-1, -1}, {1, 1}},
    collision_mask = {layers = {player = true}},
    fast_replaceable_group = "container",
    inventory_size = inv_size,
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-5-ground.png",
      priority = crash_site_sprite_priority,
      width = 252,
      height = 128,
      shift = util.by_pixel(-10, 5),
      scale = 1.2
    },

    picture =
    {
      layers =
      {
        {
          filename = "__planetaris-arig__/graphics/entity/crash-site/spaceship-wreck-furnace.png",
          priority = "extra-high",
          width = 164,
          height = 120,
          shift = util.by_pixel(0, 8),
          scale = 1.2
        },
        {
          filename = "__base__/graphics/entity/crash-site-chests/crash-site-chest-2-shadow.png",
          priority = "extra-high",
          width = 188,
          height = 126,
          shift = util.by_pixel(0, 5),
          draw_as_shadow = true,
          scale = 1.2
        }
      }
    },
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },

  {
    type = "container",
    name = "arig-crash-cargo-drop-1",
    localised_name = {"entity-name.arig-site-crash"},
    icon = "__planetaris-arig__/graphics/icons/arig-crash.png",
    flags = {"not-deconstructable", "placeable-neutral", "player-creation"},
    hidden = true,
    max_health = 350,
    minable = {mining_time = 1},
    corpse = "small-remnants",
    open_sound = sounds.metallic_chest_open,
    close_sound = sounds.metallic_chest_close,
    resistances =
    {
      {
        type = "fire",
        percent = 100
      },
      {
        type = "impact",
        percent = 60
      }
    },
    collision_box = {{-1, -1}, {1, 1}},
    selection_box = {{-1, -1}, {1, 1}},
    collision_mask = {layers = {player = true}},
    fast_replaceable_group = "container",
    inventory_size = inv_size,
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-4-ground.png",
      priority = crash_site_sprite_priority,
      width = 256,
      height = 150,
      shift = util.by_pixel(-10, 15),
      scale = 0.5
    },
    picture =
    {
      layers =
      {
        {
          filename = "__planetaris-arig__/graphics/decorative/arig-crash/arig-crash-1.png",
          width = 229,
          height = 235,
          scale = 0.5,
          shift = {0.25, 0.0625}
        },
      }
    },
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
    {
    type = "container",
    name = "arig-crash-cargo-drop-2",
    localised_name = {"entity-name.arig-site-crash"},
    icon = "__planetaris-arig__/graphics/icons/arig-crash.png",
    flags = {"not-deconstructable", "placeable-neutral", "player-creation"},
    hidden = true,
    max_health = 350,
    minable = {mining_time = 1},
    corpse = "small-remnants",
    open_sound = sounds.metallic_chest_open,
    close_sound = sounds.metallic_chest_close,
    resistances =
    {
      {
        type = "fire",
        percent = 100
      },
      {
        type = "impact",
        percent = 60
      }
    },
    collision_box = {{-1, -1}, {1, 1}},
    selection_box = {{-1, -1}, {1, 1}},
    collision_mask = {layers = {player = true}},
    fast_replaceable_group = "container",
    inventory_size = inv_size,
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-4-ground.png",
      priority = crash_site_sprite_priority,
      width = 256,
      height = 150,
      shift = util.by_pixel(-10, 5),
      scale = 0.8
    },
    picture =
    {
      layers =
      {
          {
            filename = "__planetaris-arig__/graphics/decorative/arig-crash/arig-crash-2.png",
            width = 215,
            height = 235,
            scale = 0.6,
            shift = {0.429688, 0.046875}
          },
      }
    },
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
    {
    type = "container",
    name = "arig-crash-cargo-drop-3",
    localised_name = {"entity-name.arig-site-crash"},
    icon = "__planetaris-arig__/graphics/icons/arig-crash.png",
    flags = {"not-deconstructable", "placeable-neutral", "player-creation"},
    hidden = true,
    max_health = 350,
    minable = {mining_time = 1},
    corpse = "small-remnants",
    open_sound = sounds.metallic_chest_open,
    close_sound = sounds.metallic_chest_close,
    resistances =
    {
      {
        type = "fire",
        percent = 100
      },
      {
        type = "impact",
        percent = 60
      }
    },
    collision_box = {{-1, -1}, {1, 1}},
    selection_box = {{-1, -1}, {1, 1}},
    collision_mask = {layers = {player = true}},
    fast_replaceable_group = "container",
    inventory_size = inv_size,
    integration_patch =
    {
      filename = "__base__/graphics/entity/crash-site-spaceship/spaceship-wreck-small-4-ground.png",
      priority = crash_site_sprite_priority,
      width = 256,
      height = 150,
      shift = util.by_pixel(-10, 15),
      scale = 0.5
    },
    picture =
    {
      layers =
      {
          {
            filename = "__planetaris-arig__/graphics/decorative/arig-crash/arig-crash-3.png",
            width = 297,
            height = 235,
            scale = 0.5,
            shift = {0.398438, 0.3}
          },
      }
    },
    circuit_connector = circuit_connector_definitions["chest"],
    circuit_wire_max_distance = default_circuit_wire_max_distance
  }
})