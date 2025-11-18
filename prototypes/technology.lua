local lib = require("lib")
local merge = lib.merge


-- ARIG
data:extend({
    {
      type = "technology",
      name = "planet-discovery-arig",
      icons = PlanetsLib.technology_icon_constant_planet("__planetaris-arig__/graphics/technology/arig-discovery.png", 256),
      essential = true,
      effects = {
        {
          type = "unlock-space-location",
          space_location = "arig",
          use_icon_overlay_constant = true
        }
      },
      prerequisites = {
        "planet-discovery-vulcanus", "metallurgic-science-pack",
      },
      unit = {
        count = 1000,
        ingredients = {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"space-science-pack", 1},
          {"metallurgic-science-pack", 1}
        },
        time = 30,
      },
      order = "ea[arig]",
    },

    --Wood
        {
      type = "technology",
      name = "planetaris-cactus-wood",
      icon = "__planetaris-arig__/graphics/technology/cactus.png",
      icon_size = 256,
      essential = true,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "planetaris-cactus-wood"
        },
      },
      prerequisites = {"planet-discovery-arig"},
      research_trigger = {
        type = "mine-entity",
        entity = "arig-small-cactus-plant"
      },
      order = "ea[arig]",
    },
  
    -- Sand Sifting Technology
    {
      type = "technology",
      name = "planetaris-sand-sifting",
      icon = "__planetaris-arig__/graphics/technology/sifting.png",
      icon_size = 256,
      essential = true,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "planetaris-sifter"
        },
        {
            type = "unlock-recipe",
            recipe = "planetaris-sand-sifting"
        },
        {
            type = "unlock-recipe",
            recipe = "planetaris-steam-venting"
        },
      },
      prerequisites = {"planet-discovery-arig"},
      research_trigger = {
        type = "mine-entity",
        entity = "arig-big-sand-rock"
      },
      order = "ea[arig]",
    },
    {
    type = "technology",
    name = "planetaris-advanced-heavy-oil-cracking",
    icon = "__base__/graphics/technology/oil-gathering.png",
    icon_size = 256,
    prerequisites = {"planetaris-sand-sifting"},
    effects =
    {
      {
        type = "unlock-recipe",
        recipe = "planetaris-advanced-heavy-oil-cracking"
      }
    },
    research_trigger =
    {
      type = "mine-entity",
      entity = "heavy-oil-geyser"
    },
    order = "ea[arig]",
    },
    {
      type = "technology",
      name = "planetaris-glass",
      icon = "__planetaris-arig__/graphics/technology/glass-panel.png",
      icon_size = 256,
      essential = true,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "planetaris-glass-panel"
        },
      },
      prerequisites = {"planetaris-sand-sifting"},
      research_trigger = {
        type = "craft-item",
        item = "planetaris-sifter",
      },
      order = "ea[arig]",
    },
    {
      type = "technology",
      name = "planetaris-water-harvesting",
      icon = "__planetaris-arig__/graphics/technology/water-harvesting.png",
      icon_size = 256,
      essential = true,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "planetaris-water-harvester"
        },
        {
          type = "unlock-recipe",
          recipe = "planetaris-water-harvesting"
        },
      },
      prerequisites = {"planetaris-glass"},
      research_trigger =     {
        type = "craft-item",
        item = "planetaris-glass-panel",
        count = 25
      },
      order = "ea[arig]",
    },
    {
      type = "technology",
      name = "planetaris-compression",
      icon = "__planetaris-arig__/graphics/technology/compression.png",
      icon_size = 256,
      essential = true,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "planetaris-press"
        },
        {
          type = "unlock-recipe",
          recipe = "planetaris-sandstone-brick"
        },
        {
          type = "unlock-recipe",
          recipe = "planetaris-raw-quartz"
        },
        {
          type = "unlock-recipe",
          recipe = "planetaris-compression-rocket-fuel"
        },
        {
          type = "unlock-recipe",
          recipe = "planetaris-sulfur"
        },
        {
          type = "unlock-recipe",
          recipe = "planetaris-plastic-bar"
        },
        {
          type = "unlock-recipe",
          recipe = "planetaris-solid-fuel-from-heavy-oil"
        },
        {
          type = "unlock-recipe",
          recipe = "planetaris-solid-fuel-from-light-oil"
        },
        {
          type = "unlock-recipe",
          recipe = "planetaris-solid-fuel-from-petroleum-gas"
        },
        {
          type = "unlock-recipe",
          recipe = "planetaris-carbon"
        },
      },
      prerequisites = {"planetaris-sand-sifting"},
      research_trigger =     {
        type = "craft-item",
        item = "planetaris-glass-panel",
        count = 100
      },
      order = "ea[arig]",
    },
      {
      type = "technology",
      name = "planetaris-raw-diamond-production",
      icon = "__planetaris-arig__/graphics/technology/raw-diamond.png",
      icon_size = 256,
      essential = true,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "planetaris-raw-diamond"
        },
      },
      prerequisites = {"planetaris-compression"},
      research_trigger =     {
        type = "craft-item",
        item = "planetaris-raw-quartz",
        count = 50
      },
      order = "ea[arig]",
    },
    {
      type = "technology",
      name = "planetaris-compression-science",
      icon = "__planetaris-arig__/graphics/technology/compression-science-pack.png",
      icon_size = 256,
      essential = true,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "planetaris-compression-science-pack"
        },
      },
      prerequisites = {"planetaris-compression","planetaris-raw-diamond-production","planetaris-glass"},
      research_trigger =     {
        type = "craft-item",
        item = "planetaris-raw-diamond",
        count = 50
      },
      order = "ea[arig]",
    },
    {
      type = "technology",
      name = "planetaris-sandstone-foundation",
      icon = "__planetaris-arig__/graphics/technology/sandstone-foundation.png",
      icon_size = 256,
      essential = true,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "planetaris-sandstone-foundation"
        },
      },
      prerequisites = {"planetaris-compression-science"},
      unit =
      {
        count = 500,
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"production-science-pack", 1},
          {"space-science-pack", 1},
          {"planetaris-compression-science-pack", 1},
        },
        time = 120
      },
      order = "ea[arig]",
    },
    {
      type = "technology",
      name = "planetaris-advanced-sand-sifting",
      icon = "__planetaris-arig__/graphics/technology/advanced-sand-sifting.png",
      icon_size = 64,
      essential = true,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "planetaris-advanced-sand-sifting"
        },
       {
          type = "unlock-recipe",
          recipe = "planetaris-advanced-pure-sand-sifting"
        },
      },
      prerequisites = {"planetaris-compression-science"},
      unit =
      {
        count = 800,
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"production-science-pack", 1},
          {"space-science-pack", 1},
          {"planetaris-compression-science-pack", 1},
        },
        time = 120
      },
      order = "ea[arig]",
    },
    {
      type = "technology",
      name = "planetaris-heavy-glass",
      icon = "__planetaris-arig__/graphics/technology/heavy-glass.png",
      icon_size = 256,
      essential = true,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "planetaris-heavy-glass"
        },
      },
      prerequisites = {"planetaris-compression-science","planetaris-glass"},
      unit =
      {
        count = 500,
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"production-science-pack", 1},
          {"space-science-pack", 1},
          {"planetaris-compression-science-pack", 1},
        },
        time = 60
      },
      order = "ea[arig]",
    },
    {
      type = "technology",
      name = "planetaris-silica-processing",
      icon = "__planetaris-arig__/graphics/technology/silica.png",
      icon_size = 256,
      essential = true,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "planetaris-silica"
        },
      },
      prerequisites = {"planetaris-compression-science"},
      unit =
      {
        count = 800,
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"production-science-pack", 1},
          {"space-science-pack", 1},
          {"planetaris-compression-science-pack", 1},
        },
        time = 120
      },
      order = "ea[arig]",
    },
    {
      type = "technology",
      name = "planetaris-arig-roboport",
      icon = "__planetaris-arig__/graphics/technology/arig-roboport.png",
      icon_size = 256,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "planetaris-arig-roboport"
        },
      },
      prerequisites = {"planetaris-glass", "planetaris-compression-science"},
      unit =
      {
        count = 800,
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"production-science-pack", 1},
          {"space-science-pack", 1},
          {"metallurgic-science-pack", 1},
          {"planetaris-compression-science-pack", 1},
        },
        time = 120
      }
    },
    {
      type = "technology",
      name = "planetaris-hyper-transport-belt",
      icon = "__planetaris-arig__/graphics/technology/logistics-5.png",
      icon_size = 256,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "planetaris-hyper-transport-belt"
        },
        {
          type = "unlock-recipe",
          recipe = "planetaris-hyper-underground-belt"
        },
        {
          type = "unlock-recipe",
          recipe = "planetaris-hyper-splitter"
        },
      },
      prerequisites = {"planetaris-compression-science", "turbo-transport-belt"},
      unit =
      {
        count = 3000,
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"production-science-pack", 1},
          {"space-science-pack", 1},
          {"metallurgic-science-pack", 1},
          {"planetaris-compression-science-pack", 1}
        },
        time = 60
      }
    },
    {
      type = "technology",
      name = "planetaris-big-chest",
      icon = "__planetaris-arig__/graphics/technology/container.png",
      icon_size = 256,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "planetaris-big-chest"
        },
        {
          type = "unlock-recipe",
          recipe = "planetaris-active-provider-big-chest"
        },
        {
          type = "unlock-recipe",
          recipe = "planetaris-passive-provider-big-chest"
        },
        {
          type = "unlock-recipe",
          recipe = "planetaris-storage-big-chest"
        },
        {
          type = "unlock-recipe",
          recipe = "planetaris-buffer-big-chest"
        },
        {
          type = "unlock-recipe",
          recipe = "planetaris-requester-big-chest"
        },
      },
      prerequisites = {"planetaris-silica-processing", "planetaris-heavy-glass"},
      unit =
      {
        count = 2000,
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"production-science-pack", 1},
          {"space-science-pack", 1},
          {"metallurgic-science-pack", 1},
          {"planetaris-compression-science-pack", 1},
        },
        time = 60
      }
    },
    {
      type = "technology",
      name = "planetaris-advanced-solar-panel",
      icon = "__planetaris-arig__/graphics/technology/advanced-solar-panel.png",
      icon_size = 256,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "planetaris-advanced-solar-panel"
        },
      },
      prerequisites = {"planetaris-glass", "planetaris-silica-processing"},
      unit =
      {
        count = 2000,
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"production-science-pack", 1},
          {"space-science-pack", 1},
          {"metallurgic-science-pack", 1},
          {"planetaris-compression-science-pack", 1},
        },
        time = 60
      }
    },
    {
      type = "technology",
      name = "planetaris-supported-solar-panel",
      icon = "__planetaris-arig__/graphics/technology/supported-solar-panel.png",
      icon_size = 256,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "planetaris-supported-solar-panel"
        },
        {
          type = "unlock-recipe",
          recipe = "planetaris-high-support-electric-pole"
        },
      },
      prerequisites = {"planetaris-heavy-glass", "planetaris-advanced-solar-panel"},
      unit =
      {
        count = 2000,
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"production-science-pack", 1},
          {"space-science-pack", 1},
          {"metallurgic-science-pack", 1},
          {"planetaris-compression-science-pack", 1},
        },
        time = 60
      }
    },

--- Prod techs
      {
    type = "technology",
    name = "planetaris-raw-quartz-productivity",
    icons = util.technology_icon_constant_recipe_productivity("__planetaris-arig__/graphics/technology/quartz.png"),
    icon_size = 256,
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "planetaris-raw-quartz",
        change = 0.1
      },
    },
    prerequisites = {"planetaris-silica-processing", "planetaris-compression-science"},
    unit =
    {
      count_formula = "1.5^L*1000",
      ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"production-science-pack", 1},
          {"space-science-pack", 1},
          {"metallurgic-science-pack", 1},
          {"planetaris-compression-science-pack", 1},
        },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  {
    type = "technology",
    name = "planetaris-heavy-glass-productivity",
    icons = util.technology_icon_constant_recipe_productivity("__planetaris-arig__/graphics/technology/heavy-glass.png"),
    icon_size = 256,
    essential = true,
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "planetaris-heavy-glass",
        change = 0.1
      },
    },
    prerequisites = {"planetaris-heavy-glass"},
    unit =
    {
      count_formula = "1.5^L*1000",
      ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"production-science-pack", 1},
          {"space-science-pack", 1},
          {"metallurgic-science-pack", 1},
          {"planetaris-compression-science-pack", 1},
        },
      time = 60
    },
    max_level = 20,
    upgrade = true
  },
  })
  
 if settings.startup["enable-arig-cargo-drops"].value == false then 

  local arig_cargo_drops_base =
	PlanetsLib.cargo_drops_technology_base("arig", "__planetaris-arig__/graphics/technology/arig-cargo-drops.png", 256)

  data:extend({
    merge(arig_cargo_drops_base, {
      unit = {
        count =  500,
        ingredients = {
          { "automation-science-pack", 1 },
          { "logistic-science-pack", 1 },
          { "utility-science-pack", 1 },
          { "planetaris-compression-science-pack", 1 },
        },
        time = 60,
      },
      prerequisites = { "planetaris-compression-science" },
    })
  })

PlanetsLib.add_entity_type_to_planet_cargo_drops_whitelist("arig", "construction-robot")

end