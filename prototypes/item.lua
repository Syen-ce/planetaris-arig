local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")

data:extend({
{
    type = "item",
    name = "planetaris-press",
    icon = "__planetaris-unbounded__/graphics/icons/press.png",
    subgroup = "production-machine",
    order = "e[chemical-plant]-c",
    inventory_move_sound = item_sounds.fluid_inventory_move,
    pick_sound = item_sounds.fluid_inventory_pickup,
    drop_sound = item_sounds.fluid_inventory_move,
    place_result = "planetaris-press",
    stack_size = 50
  },
{
    type = "item",
    name = "planetaris-sifter",
    icon = "__planetaris-unbounded__/graphics/icons/sifter.png",
    subgroup = "production-machine",
    order = "e[chemical-plant]-b",
    inventory_move_sound = item_sounds.fluid_inventory_move,
    pick_sound = item_sounds.fluid_inventory_pickup,
    drop_sound = item_sounds.fluid_inventory_move,
    place_result = "planetaris-sifter",
    stack_size = 10
  },
  {
    type = "item",
    name = "planetaris-assembling-machine-4",
    icon = "__planetaris-unbounded__/graphics/icons/assembling-machine-4.png",
    icon_size = 64,
    icon_mipmaps = 4, -- Optional, depending on how you want it to display
    subgroup = "production-machine",
    order = "c[assembling-machine-4]",
    place_result = "planetaris-assembling-machine-4",
    stack_size = 50,
    },
    {
    type = "item",
    name = "planetaris-sandstone-brick",
    icon = "__planetaris-unbounded__/graphics/icons/sandstone-brick.png",
    subgroup = "terrain",
    order = "d[sandstone_brick]",
    icon_size = 64,
    stack_size = 100,
    weight = 10 * kg,
    place_as_tile = {
        result = "planetaris-sandstone-path",
        condition_size = 1,
        condition = {layers={water_tile=true}}
    },
    drop_sound = {
        aggregation = {
            max_count = 1,
            remove = true
        },
        filename = "__base__/sound/item/concrete-inventory-move.ogg",
        volume = 0.6
    },
    pick_sound = {
        aggregation = {
            max_count = 1,
            remove = true
        },
        filename = "__base__/sound/item/concrete-inventory-pickup.ogg",
        volume = 0.8
    },
    inventory_move_sound = {
        filename = "__base__/sound/item/concrete-inventory-move.ogg",
        volume = 0.5
    }},
    {
        type = "item",
        name = "planetaris-sandstone-foundation",
        icon = "__planetaris-unbounded__/graphics/icons/sandstone-foundation.png",
        subgroup = "terrain",
        order = "d[sandstone_brick]-b",
        stack_size = 100,
        weight = 10 * kg,
        place_as_tile = {
            result = "planetaris-sandstone-foundation",
            condition_size = 1,
            condition = {layers = {ground_tile = true}},
            tile_condition = {"arig-sand"}
        },
        inventory_move_sound = item_sounds.landfill_inventory_move,
        pick_sound = item_sounds.landfill_inventory_pickup,
        drop_sound = item_sounds.landfill_inventory_move,
    },
    {
        type = "item",
        name = "planetaris-glass-panel",
        icon = "__planetaris-unbounded__/graphics/icons/glass-panel.png",
        subgroup = "arig-processes",
        order = "a[basic]-b",
        stack_size = 100,
        weight = 5*kg,

        inventory_move_sound = item_sounds.low_density_inventory_move,
        pick_sound = item_sounds.low_density_inventory_pickup,
        drop_sound = item_sounds.low_density_inventory_move,
    },
    {
        type = "item",
        name = "planetaris-heavy-glass",
        icon = "__planetaris-unbounded__/graphics/icons/heavy-glass.png",
        subgroup = "arig-processes",
        order = "c[advance]-a",
        stack_size = 50,
        weight = 10*kg,

        inventory_move_sound = item_sounds.metal_small_inventory_move,
        pick_sound = item_sounds.metal_small_inventory_pickup,
        drop_sound = item_sounds.metal_small_inventory_move,
        random_tint_color = item_tints.iron_rust
    },
    {
        type = "item",
        name = "planetaris-raw-quartz",
        icon = "__planetaris-unbounded__/graphics/icons/quartz.png",
        subgroup = "arig-processes",
        order = "a[basic]-c",
        stack_size = 100,
        weight = 5*kg,

        inventory_move_sound = item_sounds.sulfur_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.sulfur_inventory_move,
    },
    {
        type = "item",
        name = "planetaris-silica",
        icon = "__planetaris-unbounded__/graphics/icons/silica.png",
        subgroup = "arig-processes",
        order = "c[advance]-b",
        stack_size = 100,

        inventory_move_sound = item_sounds.sulfur_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.sulfur_inventory_move,
        weight = 10*kg,
    },
    {
        type = "item",
        name = "planetaris-simulating-unit",
        icon = "__planetaris-unbounded__/graphics/icons/simulating-unit.png",
        subgroup = "arig-processes",
        order = "c[advance]-c",
        stack_size = 100,

        inventory_move_sound = item_sounds.sulfur_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.sulfur_inventory_move,
        weight = 10*kg,
    },
    {
        type = "tool",
        name = "planetaris-compression-science-pack",
        icon = "__planetaris-unbounded__/graphics/icons/compression-science-pack.png",
        localised_description = {"item-description.science-pack"},
        subgroup = "science-pack",
        order = "h-b",
        stack_size = 200,
        default_import_location = "arig",

        inventory_move_sound = item_sounds.science_inventory_move,
        pick_sound = item_sounds.science_inventory_pickup,
        drop_sound = item_sounds.science_inventory_move,
        weight = 1*kg,
        durability = 1,
        durability_description_key = "description.science-pack-remaining-amount-key",
        factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
        durability_description_value = "description.science-pack-remaining-amount-value",
    },
    {
        type = "item",
        name = "planetaris-hyper-transport-belt",
        icon = "__planetaris-unbounded__/graphics/icons/hyper-transport-belt.png",
        subgroup = "belt",
        color_hint = { text = "5" },
        order = "a[transport-belt]-f[hyper-transport-belt]",
        inventory_move_sound = item_sounds.transport_belt_inventory_move,
        pick_sound = item_sounds.transport_belt_inventory_pickup,
        drop_sound = item_sounds.transport_belt_inventory_move,
        place_result = "planetaris-hyper-transport-belt",
        default_import_location = "arig",
        stack_size = 100,
        weight = 20*kg
      },
      {
        type = "item",
        name = "planetaris-hyper-splitter",
        icon = "__planetaris-unbounded__/graphics/icons/hyper-splitter.png",
        subgroup = "belt",
        color_hint = { text = "5" },
        order = "c[splitter]-f[hyper-splitter]",
        inventory_move_sound = item_sounds.mechanical_inventory_move,
        pick_sound = item_sounds.mechanical_inventory_pickup,
        drop_sound = item_sounds.mechanical_inventory_move,
        place_result = "planetaris-hyper-splitter",
        default_import_location = "arig",
        stack_size = 50,
        weight = 40*kg
      },
      {
        type = "item",
        name = "planetaris-hyper-underground-belt",
        icon = "__planetaris-unbounded__/graphics/icons/hyper-underground-belt.png",
        subgroup = "belt",
        color_hint = { text = "5" },
        order = "b[underground-belt]-f[hyper-underground-belt]",
        inventory_move_sound = item_sounds.mechanical_inventory_move,
        pick_sound = item_sounds.mechanical_inventory_pickup,
        drop_sound = item_sounds.mechanical_inventory_move,
        place_result = "planetaris-hyper-underground-belt",
        stack_size = 50,
        default_import_location = "arig",
        weight = 40*kg
      },
      {
        type = "item",
        name = "planetaris-big-chest",
        icon = "__planetaris-unbounded__/graphics/icons/container.png",
        subgroup = "storage",
        order = "a[items]-d[big-chest]",
        inventory_move_sound = item_sounds.metal_chest_inventory_move,
        pick_sound = item_sounds.metal_chest_inventory_pickup,
        drop_sound = item_sounds.metal_chest_inventory_move,
        place_result = "planetaris-big-chest",
        stack_size = 50
      },
})