local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")

data:extend({
{
    ------------------- Arig
    type = "item",
    name = "planetaris-press",
    icon = "__planetaris-unbounded__/graphics/icons/press.png",
    subgroup = "arig-production",
    order = "a-b",
    inventory_move_sound = item_sounds.fluid_inventory_move,
    pick_sound = item_sounds.fluid_inventory_pickup,
    drop_sound = item_sounds.fluid_inventory_move,
    place_result = "planetaris-press",
    stack_size = 50,
    default_import_location = "arig",
  },
{
    type = "item",
    name = "planetaris-sifter",
    icon = "__planetaris-unbounded__/graphics/icons/sifter.png",
    subgroup = "arig-production",
    order = "a-a",
    inventory_move_sound = item_sounds.fluid_inventory_move,
    pick_sound = item_sounds.fluid_inventory_pickup,
    drop_sound = item_sounds.fluid_inventory_move,
    place_result = "planetaris-sifter",
    stack_size = 10,
    default_import_location = "arig",
  },
  {
    type = "item",
    name = "planetaris-assembling-machine-4",
    icon = "__planetaris-unbounded__/graphics/icons/assembling-machine-4.png",
    icon_size = 64,
    icon_mipmaps = 4, -- Optional, depending on how you want it to display
    subgroup = "production-machine",
    order = "c[assembling-machine-4]-a",
    place_result = "planetaris-assembling-machine-4",
    stack_size = 50,
    default_import_location = "arig",
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
    default_import_location = "arig",
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
        default_import_location = "arig",

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
        default_import_location = "arig",

        inventory_move_sound = item_sounds.metal_small_inventory_move,
        pick_sound = item_sounds.metal_small_inventory_pickup,
        drop_sound = item_sounds.metal_small_inventory_move,
        random_tint_color = item_tints.iron_rust,
    },
    {
        type = "item",
        name = "planetaris-raw-quartz",
        icon = "__planetaris-unbounded__/graphics/icons/quartz.png",
        subgroup = "arig-processes",
        order = "a[basic]-c",
        stack_size = 100,
        weight = 5*kg,
        default_import_location = "arig",

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
        default_import_location = "arig",

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
        default_import_location = "arig",

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
        weight = 20*kg,
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
        weight = 40*kg,
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
        weight = 40*kg,
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
        stack_size = 50,
      },
        {
        type = "item",
        name = "planetaris-arig-roboport",
        icon = "__planetaris-unbounded__/graphics/icons/arig-roboport.png",
        subgroup = "logistic-network",
        order = "c[signal]-a[roboport]-b",
        localised_description = {"item-description.roboport"},
        inventory_move_sound = item_sounds.roboport_inventory_move,
        pick_sound = item_sounds.roboport_inventory_pickup,
        drop_sound = item_sounds.roboport_inventory_move,
        place_result = "planetaris-arig-roboport",
        stack_size = 10,
        weight = 100*kg,
        default_import_location = "arig",
     },
        {
        type = "item",
        name = "planetaris-advanced-solar-panel",
        icon = "__planetaris-unbounded__/graphics/icons/advanced-solar-panel.png",
        subgroup = "energy",
        order = "d[solar-panel]-b[advanced-solar-panel]",
        inventory_move_sound = item_sounds.electric_large_inventory_move,
        pick_sound = item_sounds.electric_large_inventory_pickup,
        drop_sound = item_sounds.electric_large_inventory_move,
        place_result = "planetaris-advanced-solar-panel",
        stack_size = 20,
        weight = 20*kg,
        default_import_location = "arig",

     },
     {
        type = "item",
        name = "planetaris-supported-solar-panel",
        icon = "__planetaris-unbounded__/graphics/icons/supported-solar-panel.png",
        subgroup = "energy",
        order = "d[solar-panel]-c[supported-solar-panel]",
        inventory_move_sound = item_sounds.electric_large_inventory_move,
        pick_sound = item_sounds.electric_large_inventory_pickup,
        drop_sound = item_sounds.electric_large_inventory_move,
        place_result = "planetaris-supported-solar-panel",
        stack_size = 20,
        weight = 20*kg,
        default_import_location = "arig",
     },
     {
        type = "item",
        name = "planetaris-high-support-electric-pole",
        icon = "__planetaris-unbounded__/graphics/icons/high-support-electric-pole.png",
        subgroup = "energy-pipe-distribution",
        order = "a[energy]-e[planetaris-high-support-electric-pole]",
        inventory_move_sound = item_sounds.electric_large_inventory_move,
        pick_sound = item_sounds.electric_large_inventory_pickup,
        drop_sound = item_sounds.electric_large_inventory_move,
        place_result = "planetaris-high-support-electric-pole",
        stack_size = 50,
        weight = 10*kg,
        default_import_location = "arig",
     },
     {
        type = "item",
        name = "planetaris-water-harvester",
        icon = "__planetaris-unbounded__/graphics/icons/water-harvester.png",
        subgroup = "arig-production",
        order = "a-c",
        inventory_move_sound = item_sounds.electric_large_inventory_move,
        pick_sound = item_sounds.electric_large_inventory_pickup,
        drop_sound = item_sounds.electric_large_inventory_move,
        place_result = "planetaris-water-harvester",
        stack_size = 50,
        weight = 20*kg,
        default_import_location = "arig",
     },
  {
    type = "item",
    name = "planetaris-raw-diamond",
    icon = "__planetaris-unbounded-assets__/graphics/icons/raw-diamond-1.png",
    pictures =
    {
      { size = 64, filename = "__planetaris-unbounded-assets__/graphics/icons/raw-diamond-1.png",   scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-unbounded-assets__/graphics/icons/raw-diamond-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-unbounded-assets__/graphics/icons/raw-diamond-3.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-unbounded-assets__/graphics/icons/raw-diamond-4.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "hyarion-processes",
    order = "b-a[raw]",
    stack_size = 100,
    weight = 5*kg,
    default_import_location = "arig",

    inventory_move_sound = item_sounds.sulfur_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.sulfur_inventory_move,
  },
  {
    type = "item",
    name = "planetaris-polished-diamond",
    icon = "__planetaris-unbounded-assets__/graphics/icons/polished-diamond.png",
    subgroup = "hyarion-processes",
    order = "b-b[polished]",
    stack_size = 50,
    weight = 5*kg,
    default_import_location = "hyarion",

    inventory_move_sound = item_sounds.sulfur_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.sulfur_inventory_move,
  }, 

-----------------------------------------------------------------
--------------------------- Hyarion
-----------------------------------------------------------------
     
  {
    type = "item",
    name = "planetaris-quartz-furnace",
    icon = "__planetaris-unbounded-assets__/graphics/icons/quartz-furnace.png",
    subgroup = "hyarion-production",
    order = "a-a-c",
    place_result = "planetaris-quartz-furnace",
    stack_size = 50,
    weight = 20*kg,
    default_import_location = "hyarion",

    inventory_move_sound = item_sounds.fluid_inventory_move,
    pick_sound = item_sounds.brick_inventory_pickup,
    drop_sound = item_sounds.brick_inventory_move,
  },
  {
    type = "item",
    name = "planetaris-refraction-ray-collector",
    icon = "__planetaris-unbounded-assets__/graphics/icons/refraction-ray-collector.png",
    subgroup = "hyarion-production",
    order = "a-a-a",
    place_result = "planetaris-refraction-ray-collector",
    stack_size = 50,
    weight = 20*kg,
    default_import_location = "hyarion",

    inventory_move_sound = item_sounds.fluid_inventory_move,
    pick_sound = item_sounds.brick_inventory_pickup,
    drop_sound = item_sounds.brick_inventory_move,
  },
  {
    type = "item",
    name = "planetaris-big-refraction-ray-collector",
    icon = "__planetaris-unbounded-assets__/graphics/icons/big-refraction-ray-collector.png",
    subgroup = "hyarion-production",
    order = "a-a-b",
    place_result = "planetaris-big-refraction-ray-collector",
    stack_size = 50,
    weight = 20*kg,
    default_import_location = "hyarion",

    inventory_move_sound = item_sounds.fluid_inventory_move,
    pick_sound = item_sounds.brick_inventory_pickup,
    drop_sound = item_sounds.brick_inventory_move,
  },
  {
    type = "item",
    name = "planetaris-polisher",
    icon = "__planetaris-unbounded-assets__/graphics/icons/polisher.png",
    subgroup = "hyarion-production",
    order = "a-b",
    place_result = "planetaris-polisher",
    stack_size = 50,
    weight = 40*kg,
    default_import_location = "hyarion",

    inventory_move_sound = item_sounds.fluid_inventory_move,
    pick_sound = item_sounds.brick_inventory_pickup,
    drop_sound = item_sounds.brick_inventory_move,
  },
     {
    type = "item",
    name = "hyarion-geode-mining-drill",
    icon = "__space-age__/graphics/icons/big-mining-drill.png",
    subgroup = "extraction-machine",
    color_hint = { text = "1" },
    order = "a[items]-d[big-mining-drill]",
    inventory_move_sound = item_sounds.drill_inventory_move,
    pick_sound = item_sounds.drill_inventory_pickup,
    drop_sound = item_sounds.drill_inventory_move,
    place_result = "hyarion-geode-mining-drill",
    stack_size = 20,
    weight = 40*kg,
    random_tint_color = item_tints.iron_rust
  },

    --- Metallic
    
  {
    type = "item",
    name = "planetaris-metallic-ore",
    icon = "__planetaris-unbounded-assets__/graphics/icons/metallic-ore.png",
    subgroup = "hyarion-processes",
    order = "a-a[ore]-a",
    stack_size = 100,
    weight = 5*kg,
    default_import_location = "hyarion",

    inventory_move_sound = item_sounds.sulfur_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.sulfur_inventory_move,
  },

    --- Gems

  {
    type = "item",
    name = "planetaris-polished-quartz",
    icon = "__planetaris-unbounded-assets__/graphics/icons/polished-quartz.png",
    pictures =
    {
      { size = 64, filename = "__planetaris-unbounded-assets__/graphics/icons/polished-quartz-1.png",   scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-unbounded-assets__/graphics/icons/polished-quartz-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-unbounded-assets__/graphics/icons/polished-quartz-3.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "hyarion-processes",
    order = "b-b[polished]",
    stack_size = 50,
    weight = 5*kg,
    default_import_location = "hyarion",

    inventory_move_sound = item_sounds.sulfur_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.sulfur_inventory_move,
  },
  {
    type = "item",
    name = "planetaris-raw-emerald",
    icon = "__planetaris-unbounded-assets__/graphics/icons/raw-emerald-1.png",
    pictures =
    {
      { size = 64, filename = "__planetaris-unbounded-assets__/graphics/icons/raw-emerald-1.png",   scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-unbounded-assets__/graphics/icons/raw-emerald-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-unbounded-assets__/graphics/icons/raw-emerald-3.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-unbounded-assets__/graphics/icons/raw-emerald-4.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "hyarion-processes",
    order = "b-a[raw]",
    stack_size = 100,
    weight = 5*kg,
    default_import_location = "hyarion",

    inventory_move_sound = item_sounds.sulfur_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.sulfur_inventory_move,
  },
  {
    type = "item",
    name = "planetaris-polished-emerald",
    icon = "__planetaris-unbounded-assets__/graphics/icons/polished-emerald.png",
    subgroup = "hyarion-processes",
    order = "b-b[polished]",
    stack_size = 50,
    weight = 5*kg,
    default_import_location = "hyarion",

    inventory_move_sound = item_sounds.sulfur_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.sulfur_inventory_move,
  },
  {
    type = "item",
    name = "planetaris-raw-ruby",
    icon = "__planetaris-unbounded-assets__/graphics/icons/raw-ruby-1.png",
    pictures =
    {
      { size = 64, filename = "__planetaris-unbounded-assets__/graphics/icons/raw-ruby-1.png",   scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-unbounded-assets__/graphics/icons/raw-ruby-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-unbounded-assets__/graphics/icons/raw-ruby-3.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-unbounded-assets__/graphics/icons/raw-ruby-4.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "hyarion-processes",
    order = "b-a[raw]",
    stack_size = 100,
    weight = 5*kg,
    default_import_location = "hyarion",

    inventory_move_sound = item_sounds.sulfur_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.sulfur_inventory_move,
  },
  {
    type = "item",
    name = "planetaris-polished-ruby",
    icon = "__planetaris-unbounded-assets__/graphics/icons/polished-ruby.png",
    subgroup = "hyarion-processes",
    order = "b-b[polished]",
    stack_size = 50,
    weight = 5*kg,
    default_import_location = "hyarion",

    inventory_move_sound = item_sounds.sulfur_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.sulfur_inventory_move,
  },
  {
    type = "item",
    name = "planetaris-raw-sapphire",
    icon = "__planetaris-unbounded-assets__/graphics/icons/raw-sapphire-1.png",
    pictures =
    {
      { size = 64, filename = "__planetaris-unbounded-assets__/graphics/icons/raw-sapphire-1.png",   scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-unbounded-assets__/graphics/icons/raw-sapphire-2.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-unbounded-assets__/graphics/icons/raw-sapphire-3.png", scale = 0.5, mipmap_count = 4 },
      { size = 64, filename = "__planetaris-unbounded-assets__/graphics/icons/raw-sapphire-4.png", scale = 0.5, mipmap_count = 4 },
    },
    subgroup = "hyarion-processes",
    order = "b-a[raw]",
    stack_size = 100,
    weight = 5*kg,
    default_import_location = "hyarion",

    inventory_move_sound = item_sounds.sulfur_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.sulfur_inventory_move,
  },
  {
    type = "item",
    name = "planetaris-polished-sapphire",
    icon = "__planetaris-unbounded-assets__/graphics/icons/polished-sapphire.png",
    subgroup = "hyarion-processes",
    order = "b-b[polished]",
    stack_size = 50,
    weight = 5*kg,
    default_import_location = "hyarion",

    inventory_move_sound = item_sounds.sulfur_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.sulfur_inventory_move,
  },
  {
    type = "item",
    name = "planetaris-charged-gem",
    icon = "__planetaris-unbounded-assets__/graphics/icons/charged-gem-1.png",
    subgroup = "hyarion-processes",
    order = "c[refraction]-d[charged]-b",
    fuel_category = "refraction",
    burnt_result = "planetaris-unstable-shard",
    fuel_value = "1GJ",
    stack_size = 50,
    weight = 100*kg,
    default_import_location = "hyarion",

    spoil_ticks = 5 * minute,
    spoil_result = "planetaris-polished-quartz",

    inventory_move_sound = item_sounds.sulfur_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.sulfur_inventory_move,
  },
  {
    type = "capsule",
    name = "planetaris-unstable-gem",
    icon = "__planetaris-unbounded-assets__/graphics/icons/unstable-gem-1.png",
    subgroup = "hyarion-processes",
    order = "c[refraction]-d[charged]-d",
    flags = {"hide-from-bonus-gui"},
    capsule_action =
    {
      type = "destroy-cliffs",
      radius = 4,
      attack_parameters =
      {
        type = "projectile",
        activation_type = "throw",
        ammo_category = "grenade",
        cooldown = 30,
        projectile_creation_distance = 0.6,
        range = 10,
        ammo_type =
        {
          target_type = "position",
          action =
          {
            type = "direct",
            action_delivery =
            {
              type = "projectile",
              projectile = "unstable-gem",
              starting_speed = 0.3
            }
          }
        }
      }
    },

    spoil_ticks = 15 * minute,
    spoil_to_trigger_result =
    {
      items_per_trigger = 25,
      trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "create-entity",
                entity_name = "medium-explosion"
              },
              {
                type = "create-entity",
                entity_name = "small-scorchmark-tintable",
                check_buildability = true
              },
              {
                type = "invoke-tile-trigger",
                repeat_count = 1
              },
              {
                type = "destroy-decoratives",
                from_render_layer = "decorative",
                to_render_layer = "object",
                include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
                include_decals = false,
                invoke_decorative_trigger = true,
                decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
                radius = 1.25 -- large radius for demostrative purposes
              }
            }
          }
        },
        {
          type = "area",
          radius = 1,
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "damage",
                damage = {amount = 150, type = "explosion"}
              },
              {
                type = "create-entity",
                entity_name = "explosion"
              }
            }
          }
        }
      }
    },

    stack_size = 20,
    weight = 5*kg,
    default_import_location = "hyarion",

    inventory_move_sound = item_sounds.explosive_inventory_move,
    pick_sound = item_sounds.explosive_inventory_pickup,
    drop_sound = item_sounds.explosive_inventory_move,
  },
  {
    type = "item",
    name = "planetaris-unstable-shard",
    icon = "__planetaris-unbounded-assets__/graphics/icons/unstable-shard-1.png",
    subgroup = "hyarion-processes",
    order = "c[refraction]-d[charged]-c",
    stack_size = 50,
    weight = 5*kg,
    default_import_location = "hyarion",

    spoil_ticks = 2.5 * minute,
    spoil_to_trigger_result =
    {
      items_per_trigger = 25,
      trigger =
      {
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "create-entity",
                entity_name = "medium-explosion"
              },
              {
                type = "create-entity",
                entity_name = "small-scorchmark-tintable",
                check_buildability = true
              },
              {
                type = "invoke-tile-trigger",
                repeat_count = 1
              },
              {
                type = "destroy-decoratives",
                from_render_layer = "decorative",
                to_render_layer = "object",
                include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
                include_decals = false,
                invoke_decorative_trigger = true,
                decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
                radius = 1.25 -- large radius for demostrative purposes
              }
            }
          }
        },
        {
          type = "area",
          radius = 1,
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "damage",
                damage = {amount = 80, type = "explosion"}
              },
              {
                type = "create-entity",
                entity_name = "explosion"
              }
            }
          }
        }
      }
    },

    inventory_move_sound = item_sounds.sulfur_inventory_move,
    pick_sound = item_sounds.resource_inventory_pickup,
    drop_sound = item_sounds.sulfur_inventory_move,
  },
   {
      type = "tool",
      name = "planetaris-polishing-science-pack",
      icon = "__planetaris-unbounded-assets__/graphics/icons/polishing-science-pack.png",
      localised_description = {"item-description.science-pack"},
      subgroup = "science-pack",
      order = "h-c",
      stack_size = 200,
      default_import_location = "hyarion",

      inventory_move_sound = item_sounds.science_inventory_move,
      pick_sound = item_sounds.science_inventory_pickup,
      drop_sound = item_sounds.science_inventory_move,
      weight = 1*kg,
      durability = 1,
      durability_description_key = "description.science-pack-remaining-amount-key",
      factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
      durability_description_value = "description.science-pack-remaining-amount-value",
  },
    --- Refraction
  {
    type = "item",
    name = "planetaris-refraction-plant",
    icon = "__planetaris-unbounded-assets__/graphics/icons/refraction-plant.png",
    subgroup = "hyarion-production",
    order = "a-d",
    place_result = "planetaris-refraction-plant",
    stack_size = 50,
    weight = 40*kg,
    default_import_location = "hyarion",

    inventory_move_sound = item_sounds.fluid_inventory_move,
    pick_sound = item_sounds.brick_inventory_pickup,
    drop_sound = item_sounds.brick_inventory_move,
  },
  {
    type = "item",
    name = "planetaris-fiber-optics-cable",
    icon = "__planetaris-unbounded-assets__/graphics/icons/fiber-optics-cable.png",
    subgroup = "hyarion-processes",
    order = "c[refraction]-a",
    stack_size = 200,
    weight = 5*kg,
    default_import_location = "hyarion",

    inventory_move_sound = item_sounds.wire_inventory_move,
    pick_sound = item_sounds.wire_inventory_pickup,
    drop_sound = item_sounds.wire_inventory_move,
  },
  {
    type = "item",
    name = "planetaris-nanoscale-lens",
    icon = "__planetaris-unbounded-assets__/graphics/icons/nanoscale-lens.png",
    subgroup = "hyarion-processes",
    order = "c[refraction]-b",
    stack_size = 100,
    weight = 10*kg,
    default_import_location = "hyarion",

    inventory_move_sound = item_sounds.wire_inventory_move,
    pick_sound = item_sounds.wire_inventory_pickup,
    drop_sound = item_sounds.wire_inventory_move,
  },
  {
    type = "item",
    name = "planetaris-ruby-laser",
    icon = "__planetaris-unbounded-assets__/graphics/icons/ruby-laser.png",
    subgroup = "hyarion-processes",
    order = "c[refraction]-c",
    stack_size = 50,
    weight = 10*kg,
    default_import_location = "hyarion",

    inventory_move_sound = item_sounds.wire_inventory_move,
    pick_sound = item_sounds.wire_inventory_pickup,
    drop_sound = item_sounds.wire_inventory_move,
  },
  {
    type = "item",
    name = "planetaris-crystalization-motor",
    icon = "__planetaris-unbounded-assets__/graphics/icons/crystalization-motor.png",
    subgroup = "hyarion-processes",
    order = "c[refraction]-d-a",
    stack_size = 200,
    weight = 5*kg,
    default_import_location = "hyarion",

    inventory_move_sound = item_sounds.wire_inventory_move,
    pick_sound = item_sounds.wire_inventory_pickup,
    drop_sound = item_sounds.wire_inventory_move,
  },
  {
    type = "tool",
    name = "planetaris-refraction-science-pack",
    icon = "__planetaris-unbounded-assets__/graphics/icons/refraction-science-pack.png",
      subgroup = "science-pack",
      order = "h-d-b",
    stack_size = 200,
    default_import_location = "hyarion",

    inventory_move_sound = item_sounds.science_inventory_move,
    pick_sound = item_sounds.science_inventory_pickup,
    drop_sound = item_sounds.science_inventory_move,
    weight = 1*kg,
    durability = 1,
    durability_description_key = "description.science-pack-remaining-amount-key",
    factoriopedia_durability_description_key = "description.factoriopedia-science-pack-remaining-amount-key",
    durability_description_value = "description.science-pack-remaining-amount-value",
  },

    --- space facilities

   {
    type = "item",
    name = "planetaris-beryllium-coating",
    icon = "__base__/graphics/icons/wall.png",
    subgroup = "space-facilities",
    order = "a-a",
    stack_size = 100,
    weight = 20*kg,
    default_import_location = "hyarion",

    inventory_move_sound = item_sounds.concrete_inventory_move,
    pick_sound = item_sounds.concrete_inventory_pickup,
    drop_sound = item_sounds.concrete_inventory_move,
  },   
})