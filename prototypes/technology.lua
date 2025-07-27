local lib = require("lib")
local merge = lib.merge

data:extend({
    {
      type = "technology",
      name = "planet-discovery-arig",
      icons = PlanetsLib.technology_icon_constant_planet("__planetaris-unbounded__/graphics/technology/arig-discovery.png", 256),
      essential = true,
      localised_description = {"space-location-description.arig"},
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
  
    -- Sand Sifting Technology
    {
      type = "technology",
      name = "sand-sifting",
      icon = "__planetaris-unbounded__/graphics/technology/sifting.png",  -- Main icon
      icon_size = 256,
      essential = true,
      localised_description = {"space-location-description.sand-sifting"},
      effects = {
        {
          type = "unlock-recipe",
          recipe = "sifter"
        },
        {
            type = "unlock-recipe",
            recipe = "sand-sifting"
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
      name = "glass",
      icon = "__planetaris-unbounded__/graphics/technology/glass-panel.png",  -- Main icon
      icon_size = 256,
      essential = true,
      localised_description = {"space-location-description.glass"},
      effects = {
        {
          type = "unlock-recipe",
          recipe = "glass-panel"
        },
      },
      prerequisites = {"sand-sifting"},
      research_trigger = {
        type = "craft-item",
        item = "sifter",
      },
      order = "ea[arig]",
    },
    {
      type = "technology",
      name = "compression",
      icon = "__planetaris-unbounded__/graphics/technology/compression.png",
      icon_size = 256,
      essential = true,
      localised_description = {"space-location-description.compression"},
      effects = {
        {
          type = "unlock-recipe",
          recipe = "press"
        },
        {
          type = "unlock-recipe",
          recipe = "sandstone-brick"
        },
        {
          type = "unlock-recipe",
          recipe = "quartz"
        },
                {
          type = "unlock-recipe",
          recipe = "compression-rocket-fuel"
        },
      },
      prerequisites = {"sand-sifting"},
      research_trigger =     {
        type = "craft-item",
        item = "glass-panel",
        count = 100
      },
      order = "ea[arig]",
    },
    {
      type = "technology",
      name = "compression-science",
      icon = "__planetaris-unbounded__/graphics/technology/compression-science-pack.png",
      icon_size = 256,
      essential = true,
      localised_description = {"space-location-description.compression-science"},
      effects = {
        {
          type = "unlock-recipe",
          recipe = "compression-science-pack"
        },
      },
      prerequisites = {"compression"},
      research_trigger =     {
        type = "craft-item",
        item = "quartz",
        count = 100
      },
      order = "ea[arig]",
    },
    {
      type = "technology",
      name = "sandstone-foundation",
      icon = "__planetaris-unbounded__/graphics/technology/sandstone-foundation.png",
      icon_size = 256,
      essential = true,
      localised_description = {"space-location-description.sandstone-foundation"},
      effects = {
        {
          type = "unlock-recipe",
          recipe = "sandstone-foundation"
        },
      },
      prerequisites = {"compression-science"},
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
          {"compression-science-pack", 1},
        },
        time = 120
      },
      order = "ea[arig]",
    },
    {
      type = "technology",
      name = "advanced-sand-sifting",
      icon = "__planetaris-unbounded__/graphics/technology/advanced-sand-sifting.png",
      icon_size = 64,
      essential = true,
      localised_description = {"space-location-description.advanced-sifting"},
      effects = {
        {
          type = "unlock-recipe",
          recipe = "advanced-sand-sifting"
        },
      },
      prerequisites = {"compression-science"},
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
          {"compression-science-pack", 1},
        },
        time = 120
      },
      order = "ea[arig]",
    },
    {
      type = "technology",
      name = "heavy-glass",
      icon = "__planetaris-unbounded__/graphics/technology/heavy-glass.png",
      icon_size = 256,
      essential = true,
      localised_description = {"space-location-description.simulating-unit"},
      effects = {
        {
          type = "unlock-recipe",
          recipe = "heavy-glass"
        },
      },
      prerequisites = {"compression-science","glass"},
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
          {"compression-science-pack", 1},
        },
        time = 60
      },
      order = "ea[arig]",
    },
    {
      type = "technology",
      name = "silica-processing",
      icon = "__planetaris-unbounded__/graphics/technology/silica.png",
      icon_size = 256,
      essential = true,
      localised_description = {"space-location-description.silica-processing"},
      effects = {
        {
          type = "unlock-recipe",
          recipe = "silica"
        },
      },
      prerequisites = {"compression-science"},
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
          {"compression-science-pack", 1},
        },
        time = 120
      },
      order = "ea[arig]",
    },
    {
      type = "technology",
      name = "simulating-unit",
      icon = "__planetaris-unbounded__/graphics/technology/simulating-unit.png",
      icon_size = 256,
      essential = true,
      localised_description = {"space-location-description.simulating-unit"},
      effects = {
        {
          type = "unlock-recipe",
          recipe = "simulating-unit"
        },
      },
      prerequisites = {"silica-processing"},
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
          {"compression-science-pack", 1},
        },
        time = 120
      },
      order = "ea[arig]",
    },
    {
      type = "technology",
      name = "hyper-transport-belt",
      icon = "__planetaris-unbounded__/graphics/technology/logistics-5.png",
      icon_size = 256,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "hyper-transport-belt"
        },
        {
          type = "unlock-recipe",
          recipe = "hyper-underground-belt"
        },
        {
          type = "unlock-recipe",
          recipe = "hyper-splitter"
        },
      },
      prerequisites = {"simulating-unit", "turbo-transport-belt"},
      unit =
      {
        count = 5000,
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"production-science-pack", 1},
          {"space-science-pack", 1},
          {"metallurgic-science-pack", 1},
          {"compression-science-pack", 1},
        },
        time = 60
      }
    },
    {
        type = "technology",
        name = "automation-4",
        icon = "__planetaris-unbounded__/graphics/technology/automation-4.png",
        icon_size = 256,
        localised_description = {"technology-description.automation-4"},
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "assembling-machine-4"
          }
        },
        prerequisites = {"simulating-unit","automation-3","heavy-glass"},
        unit =
        {
          count = 5000,
          ingredients =
          {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"production-science-pack", 1},
            {"space-science-pack", 1},
            {"compression-science-pack", 1},
          },
          time = 120
        }
    },
    {
      type = "technology",
      name = "big-chest",
      icon = "__planetaris-unbounded__/graphics/technology/container.png",
      icon_size = 256,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "big-chest"
        },
      },
      prerequisites = {"silica-processing", "heavy-glass"},
      unit =
      {
        count = 5000,
        ingredients =
        {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1},
          {"chemical-science-pack", 1},
          {"production-science-pack", 1},
          {"space-science-pack", 1},
          {"metallurgic-science-pack", 1},
          {"compression-science-pack", 1},
        },
        time = 60
      }
    },
      {
    type = "technology",
    name = "quartz-productivity",
    icons = util.technology_icon_constant_recipe_productivity("__planetaris-unbounded__/graphics/technology/quartz.png"),
    icon_size = 256,
    effects =
    {
      {
        type = "change-recipe-productivity",
        recipe = "quartz",
        change = 0.1
      },
    },
    prerequisites = {"silica-processing", "compression-science"},
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
          {"compression-science-pack", 1},
        },
      time = 60
    },
    max_level = "infinite",
    upgrade = true
  },
  })
  
  local cargo_drops_base =
	PlanetsLib.cargo_drops_technology_base("arig", "__planetaris-unbounded__/graphics/technology/arig-cargo-drops.png", 256)

  data:extend({
    merge(cargo_drops_base, {
      unit = {
        count =  500,
        ingredients = {
          { "automation-science-pack", 1 },
          { "logistic-science-pack", 1 },
          { "utility-science-pack", 1 },
          { "compression-science-pack", 1 },
        },
        time = 60,
      },
      prerequisites = { "compression-science" },
    })
  })