local lib = require("lib")
local merge = lib.merge

data:extend({
    {
      type = "technology",
      name = "planet-discovery-arig",
      icons = PlanetsLib.technology_icon_constant_planet("__planetaris-unbounded__/graphics/technology/arig-discovery.png", 256),
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
  
    -- Sand Sifting Technology
    {
      type = "technology",
      name = "planetaris-sand-sifting",
      icon = "__planetaris-unbounded__/graphics/technology/sifting.png",
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
      icon = "__planetaris-unbounded__/graphics/technology/glass-panel.png",
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
      name = "planetaris-compression",
      icon = "__planetaris-unbounded__/graphics/technology/compression.png",
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
      name = "planetaris-compression-science",
      icon = "__planetaris-unbounded__/graphics/technology/compression-science-pack.png",
      icon_size = 256,
      essential = true,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "planetaris-compression-science-pack"
        },
      },
      prerequisites = {"planetaris-compression"},
      research_trigger =     {
        type = "craft-item",
        item = "planetaris-raw-quartz",
        count = 100
      },
      order = "ea[arig]",
    },
    {
      type = "technology",
      name = "planetaris-sandstone-foundation",
      icon = "__planetaris-unbounded__/graphics/technology/sandstone-foundation.png",
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
      icon = "__planetaris-unbounded__/graphics/technology/advanced-sand-sifting.png",
      icon_size = 64,
      essential = true,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "planetaris-advanced-sand-sifting"
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
      icon = "__planetaris-unbounded__/graphics/technology/heavy-glass.png",
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
      icon = "__planetaris-unbounded__/graphics/technology/silica.png",
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
      name = "planetaris-simulating-unit",
      icon = "__planetaris-unbounded__/graphics/technology/simulating-unit.png",
      icon_size = 256,
      essential = true,
      effects = {
        {
          type = "unlock-recipe",
          recipe = "planetaris-simulating-unit"
        },
      },
      prerequisites = {"planetaris-silica-processing"},
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
      name = "planetaris-hyper-transport-belt",
      icon = "__planetaris-unbounded__/graphics/technology/logistics-5.png",
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
      prerequisites = {"planetaris-simulating-unit", "turbo-transport-belt"},
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
          {"planetaris-compression-science-pack", 1},
        },
        time = 60
      }
    },
    {
        type = "technology",
        name = "planetaris-automation-4",
        icon = "__planetaris-unbounded__/graphics/technology/automation-4.png",
        icon_size = 256,
        localised_name = {"technology-name.planetaris-automation-4"},
        localised_description = {"technology-description.planetaris-automation-4"},
        effects =
        {
          {
            type = "unlock-recipe",
            recipe = "planetaris-assembling-machine-4"
          }
        },
        prerequisites = {"planetaris-simulating-unit","automation-3","planetaris-heavy-glass"},
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
            {"planetaris-compression-science-pack", 1},
          },
          time = 120
        }
    },
    {
      type = "technology",
      name = "planetaris-big-chest",
      icon = "__planetaris-unbounded__/graphics/technology/container.png",
      icon_size = 256,
      effects =
      {
        {
          type = "unlock-recipe",
          recipe = "planetaris-big-chest"
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
      icon = "__planetaris-unbounded__/graphics/technology/advanced-solar-panel.png",
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
    name = "planetaris-raw-quartz-productivity",
    icons = util.technology_icon_constant_recipe_productivity("__planetaris-unbounded__/graphics/technology/quartz.png"),
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
          { "planetaris-compression-science-pack", 1 },
        },
        time = 60,
      },
      prerequisites = { "planetaris-compression-science" },
    })
  })