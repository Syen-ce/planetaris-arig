data:extend(
{

  -------------------------------------------------------------------------- Arig
    {

        type = "recipe",
        name = "planetaris-sifter",     
        energy_required = 5,
        enabled = false,
        auto_recycle = false,
        subgroup = "arig-production",
        ingredients =
        {
            {type = "item", name = "iron-plate", amount = 10},
            {type = "item", name = "iron-gear-wheel", amount = 10},
            {type = "item", name = "electronic-circuit", amount = 5},
            {type = "item", name = "pipe", amount = 2}
          },
          results = {{type="item", name="planetaris-sifter", amount=1}}
    },
    {
        type = "recipe",
        name = "planetaris-press",     
        energy_required = 5,
        enabled = false,
        auto_recycle = false,
        subgroup = "arig-production",
        surface_conditions =
    {
      {
        property = "planetaris-dust-concentration",
        min = 50,
        max = 100,
      }
    },
        ingredients =
        {
            {type = "item", name = "steel-plate", amount = 20},
            {type = "item", name = "iron-gear-wheel", amount = 15},
            {type = "item", name = "electronic-circuit", amount = 30},
            {type = "item", name = "plastic-bar", amount = 10}
          },
        results = {{type="item", name="planetaris-press", amount=1}}
    },  
    {
        type = "recipe",
        name = "planetaris-sand-sifting",
        icon = "__planetaris-arig__/graphics/icons/fluid/sand.png",
        icon_size = 64,
        category = "sifting",
        subgroup = "arig-processes",
        order = "a[sand-processing]-a[sifting]",
        enabled = false,
        auto_recycle = false,
        energy_required = 0.5,
        ingredients = {{type = "fluid", name = "planetaris-sand", amount = 200}},
        results =
        {
          {type = "fluid", name = "planetaris-pure-sand",   amount = 25, probability = 0.25, show_details_in_recipe_tooltip = false},
          {type = "fluid", name = "steam",                  amount = 20, probability = 0.22, temperature = 165, show_details_in_recipe_tooltip = false},         
          {type = "item", name = "iron-ore",                amount = 2,  probability = 0.20, show_details_in_recipe_tooltip = false},
          {type = "item", name = "copper-ore",              amount = 2,  probability = 0.20, show_details_in_recipe_tooltip = false},
          {type = "item", name = "coal",                    amount = 2,  probability = 0.08, show_details_in_recipe_tooltip = false},
          {type = "item", name = "stone",                   amount = 1,  probability = 0.04, show_details_in_recipe_tooltip = false}, 
          {type = "item", name = "sulfur",                  amount = 1,  probability = 0.01, show_details_in_recipe_tooltip = false},
        },
        allow_productivity = false,
      },
      {
        type = "recipe",
        name = "planetaris-advanced-sand-sifting",
        icon = "__planetaris-arig__/graphics/icons/advanced-sand-sifting.png",
        icon_size = 64,
        category = "sifting",
        subgroup = "arig-processes",
        order = "a[sand-processing]-a[sifting]-b",
        enabled = false,
        auto_recycle = false,
        energy_required = 0.5,
        ingredients = {{type = "fluid", name = "planetaris-sand", amount = 200}},
        results =
        {
          {type = "fluid", name = "planetaris-pure-sand", amount = 20, probability = 0.30, show_details_in_recipe_tooltip = false},
          {type = "fluid", name = "steam",                amount = 10, probability = 0.10, temperature = 165, show_details_in_recipe_tooltip = false},
          {type = "item", name = "calcite",               amount = 1,  probability = 0.25, show_details_in_recipe_tooltip = false},
          {type = "item", name = "sulfur",                amount = 1,  probability = 0.20, show_details_in_recipe_tooltip = false},
          {type = "item", name = "coal",                  amount = 1,  probability = 0.15, show_details_in_recipe_tooltip = false},
        },
        allow_productivity = false,
      },
      {
        type = "recipe",
        name = "planetaris-advanced-pure-sand-sifting",
        icon = "__planetaris-arig__/graphics/icons/advanced-pure-sand-sifting.png",
        icon_size = 64,
        category = "sifting",
        subgroup = "arig-processes",
        order = "a[sand-processing]-a[sifting]-c",
        enabled = false,
        auto_recycle = false,
        energy_required = 2,
        ingredients = {{type = "fluid", name = "planetaris-sand", amount = 200}},
        results =
        {
          {type = "fluid", name = "planetaris-pure-sand", amount = 20, show_details_in_recipe_tooltip = false},
        },
        allow_productivity = false,
      },
      {
        type = "recipe",
        name = "planetaris-sandstone-brick",
        category = "compressing",
        order = "a[sand-processing]-b[sand-processing]",
        enabled = false,
        auto_recycle = false,
        energy_required = 2,
        ingredients = { { type = "fluid", name = "planetaris-pure-sand", amount = 40 } },
        results = { { type = "item", name = "planetaris-sandstone-brick", amount = 1 } }
    },
    {
      type = "recipe",
      name = "planetaris-cactus-wood",
      icon = "__planetaris-arig__/graphics/icons/cactus-wood.png",
      icon_size = 64,
      category = "organic-or-assembling",
      subgroup = "arig-processes",
      order = "a-a-a[natural]",
      enabled = false,
      auto_recycle = false,
      energy_required = 1,
      ingredients =
      {
        { type = "item", name = "planetaris-cactus", amount = 3 },
      },
      results = { { type = "item", name = "wood", amount = 2 } }
  },
    {
      type = "recipe",
      name = "planetaris-sandstone-foundation",
      icon = "__planetaris-arig__/graphics/icons/sandstone-foundation.png",
      category = "compressing",
      order = "a[sand-processing]-b[sand-processing]-b",
      enabled = false,
      auto_recycle = false,
      energy_required = 10,
      ingredients = 
      { 
        { type = "item", name = "planetaris-sandstone-brick", amount = 5 },
        { type = "item", name = "stone-brick", amount = 5 },
        { type = "item", name = "steel-plate", amount = 2 }
      },
      results = { { type = "item", name = "planetaris-sandstone-foundation", amount = 10 } }
  },
  {
    type = "recipe",
    name = "planetaris-glass-panel",
    category = "smelting",
    subgroup = "arig-processes",
    auto_recycle = false,
    enabled = false,
    icon = "__planetaris-arig__/graphics/icons/glass-panel.png",
    energy_required = 3,
    ingredients = {
      {type = "item", name = "planetaris-pure-sand-barrel", amount = 2}
    },
    results = {
      {type="item", name="planetaris-glass-panel", amount=5},
      {type="item", name="barrel", amount=2}
  },
    main_product = "planetaris-glass-panel",
    allow_productivity = false
  },
  {
    type = "recipe",
    name = "planetaris-heavy-glass",
    category = "advanced-crafting",
    auto_recycle = false,
    enabled = false,
    energy_required = 5,
    surface_conditions =
    {
      {
        property = "planetaris-dust-concentration",
        min = 50,
        max = 100,
      }
    },
    ingredients = {
      {type="item", name="planetaris-glass-panel", amount=1},
      {type="item", name="tungsten-plate", amount=3},
    },
    results = {{type="item", name="planetaris-heavy-glass", amount=1}},
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "planetaris-raw-quartz",
    category = "compressing",
    enabled = false,
    auto_recycle = false,
    energy_required = 2,
    ingredients =
    {
      {type = "fluid", name = "steam", amount = 10},
      {type = "fluid", name = "light-oil", amount = 20},
      {type = "item", name = "planetaris-sandstone-brick", amount = 1},
    },
    results = {{type="item", name="planetaris-raw-quartz", amount=1}},
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "planetaris-advanced-raw-quartz",
    category = "compressing",
    enabled = false,
    auto_recycle = false,
    energy_required = 2,
    ingredients =
    {
      {type = "fluid", name = "steam", amount = 10},
      {type = "fluid", name = "light-oil", amount = 10},
      {type = "item", name = "planetaris-sandstone-brick", amount = 1},
      {type = "item", name = "coal", amount = 1},
    },
    results = {{type="item", name="planetaris-raw-quartz", amount=2}},
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "planetaris-silica",
    category = "compressing",
    enabled = false,
    energy_required = 2,
    ingredients =
    {
      {type = "fluid", name = "sulfuric-acid", amount = 20},
      {type = "item", name = "planetaris-raw-quartz", amount = 5},
      {type = "item", name = "calcite", amount = 1},
    },
    results = {{type="item", name="planetaris-silica", amount=1}},
    allow_productivity = true
  },
    {
    type = "recipe",
    name = "planetaris-compression-rocket-fuel",
    category = "compressing",
    subgroup = "arig-processes",
    enabled = false,
    auto_recycle = false,
    energy_required = 2,
    icon = "__planetaris-arig__/graphics/icons/compression-rocket-fuel.png",
    ingredients =
    {
      {type = "item", name = "solid-fuel", amount = 2},      
      {type = "item", name = "coal", amount = 1},
      {type = "item", name = "sulfur", amount = 1},
    },
    results = {{type="item", name="rocket-fuel", amount=1}},
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "planetaris-advanced-heavy-oil-cracking",
    category = "chemistry",
    subgroup = "arig-processes",
    order = "a[sand-processing]-c-a",
    enabled = false,
    energy_required = 2,
    icon = "__planetaris-arig__/graphics/icons/advanced-heavy-oil-cracking.png",
    ingredients =
    {
      {type = "fluid", name = "water", amount = 40},
      {type = "fluid", name = "heavy-oil", amount = 40}
    },
    results = {
      {type = "fluid", name = "light-oil", amount = 30},
      {type = "fluid", name = "petroleum-gas", amount = 20}
    },
    allow_productivity = true,
    surface_conditions =
    {
      {
        property = "planetaris-dust-concentration",
        min = 50,
        max = 100,
      }
    },
    crafting_machine_tint =
    {
      primary = {r = 1.000, g = 0.642, b = 0.261, a = 1.000}, -- #ffa342ff
      secondary = {r = 1.000, g = 0.722, b = 0.376, a = 1.000}, -- #ffb85fff
      tertiary = {r = 0.854, g = 0.659, b = 0.576, a = 1.000}, -- #d9a892ff
      quaternary = {r = 1.000, g = 0.494, b = 0.271, a = 1.000}, -- #ff7e45ff
    }
  },
  {
    type = "recipe",
    name = "planetaris-compression-science-pack",
    category = "compressing",
    enabled = false,
    auto_recycle = false,
    icon = "__planetaris-arig__/graphics/icons/compression-science-pack.png",
    surface_conditions =
    {
      {
        property = "planetaris-dust-concentration",
        min = 50,
        max = 100,
      }
    },
    ingredients =
    {
      {type = "item", name = "planetaris-glass-panel", amount = 2},
      {type = "item", name = "planetaris-raw-diamond", amount = 1},
      {type = "item", name = "planetaris-sandstone-brick", amount = 5},

    },
    energy_required = 10,
    results = {{type="item", name="planetaris-compression-science-pack", amount=1}},
    allow_productivity = true,
  },
    {
      type = "recipe",
      name = "planetaris-hyper-transport-belt",
      category = "electromagnetics",
      surface_conditions =
    {
      {
        property = "planetaris-dust-concentration",
        min = 50,
        max = 100,
      }
    },
      enabled = false,
      icon = "__planetaris-arig__/graphics/icons/hyper-transport-belt.png",
      ingredients =
      {
        {type = "item", name = "turbo-transport-belt", amount = 1},
        {type = "item", name = "planetaris-silica", amount = 2},
        {type = "item", name = "planetaris-raw-diamond", amount = 2},

      },
      results = {{type="item", name="planetaris-hyper-transport-belt", amount=1}},
      allow_productivity = false,
    },
    {
      type = "recipe",
      name = "planetaris-hyper-splitter",
      category = "electromagnetics",
      surface_conditions =
    {
      {
        property = "planetaris-dust-concentration",
        min = 50,
        max = 100,
      }
    },
      enabled = false,
      icon = "__planetaris-arig__/graphics/icons/hyper-splitter.png",
      ingredients =
      {
        {type = "item", name = "turbo-splitter", amount = 1},
        {type = "item", name = "processing-unit", amount = 2},
        {type = "item", name = "planetaris-silica", amount = 1},
        {type = "item", name = "planetaris-raw-diamond", amount = 1},
      },
      results = {{type="item", name="planetaris-hyper-splitter", amount=1}},
      allow_productivity = false,
    },
    {
      type = "recipe",
      name = "planetaris-hyper-underground-belt",
      category = "electromagnetics",
      surface_conditions =
    {
      {
        property = "planetaris-dust-concentration",
        min = 50,
        max = 100,
      }
    },
      enabled = false,
      icon = "__planetaris-arig__/graphics/icons/hyper-underground-belt.png",
      ingredients =
      {
        {type = "item", name = "turbo-underground-belt", amount = 1},
        {type = "item", name = "planetaris-silica", amount = 3},
        {type = "item", name = "planetaris-raw-diamond", amount = 2},
      },
      results = {{type="item", name="planetaris-hyper-underground-belt", amount=2}},
      allow_productivity = false,
    },
    {
      type = "recipe",
      name = "planetaris-big-chest",
      category = "advanced-crafting",
      energy_required = 20,
      enabled = false,
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = 30},
        {type = "item", name = "planetaris-heavy-glass", amount = 30},
        {type = "item", name = "planetaris-silica", amount = 15},
      },
      results = {{type="item", name="planetaris-big-chest", amount=1}},
      allow_productivity = false,
    },
    {
      type = "recipe",
      name = "planetaris-active-provider-big-chest",
      localised_name = {"entity-name.planetaris-active-provider-big-chest"},
      category = "advanced-crafting",
      energy_required = 20,
      enabled = false,
      ingredients =
      {
        {type = "item", name = "planetaris-big-chest", amount = 1},
        {type = "item", name = "electronic-circuit", amount = 5},
        {type = "item", name = "advanced-circuit", amount = 1},
      },
      results = {{type="item", name="planetaris-active-provider-big-chest", amount=1}},
      allow_productivity = false,
    },
    {
      type = "recipe",
      name = "planetaris-passive-provider-big-chest",
      localised_name = {"entity-name.planetaris-passive-provider-big-chest"},
      category = "advanced-crafting",
      energy_required = 20,
      enabled = false,
      ingredients =
      {
        {type = "item", name = "planetaris-big-chest", amount = 1},
        {type = "item", name = "electronic-circuit", amount = 5},
        {type = "item", name = "advanced-circuit", amount = 1},
      },
      results = {{type="item", name="planetaris-passive-provider-big-chest", amount=1}},
      allow_productivity = false,
    },
    {
      type = "recipe",
      name = "planetaris-storage-big-chest",
      localised_name = {"entity-name.planetaris-storage-big-chest"},
      category = "advanced-crafting",
      energy_required = 20,
      enabled = false,
      ingredients =
      {
        {type = "item", name = "planetaris-big-chest", amount = 1},
        {type = "item", name = "electronic-circuit", amount = 5},
        {type = "item", name = "advanced-circuit", amount = 1},
      },
      results = {{type="item", name="planetaris-storage-big-chest", amount=1}},
      allow_productivity = false,
    },
    {
      type = "recipe",
      name = "planetaris-buffer-big-chest",
      localised_name = {"entity-name.planetaris-buffer-big-chest"},
      category = "advanced-crafting",
      energy_required = 20,
      enabled = false,
      ingredients =
      {
        {type = "item", name = "planetaris-big-chest", amount = 1},
        {type = "item", name = "electronic-circuit", amount = 5},
        {type = "item", name = "advanced-circuit", amount = 1},
      },
      results = {{type="item", name="planetaris-buffer-big-chest", amount=1}},
      allow_productivity = false,
    },
    {
      type = "recipe",
      name = "planetaris-requester-big-chest",
      localised_name = {"entity-name.planetaris-requester-big-chest"},
      category = "advanced-crafting",
      energy_required = 20,
      enabled = false,
      ingredients =
      {
        {type = "item", name = "planetaris-big-chest", amount = 1},
        {type = "item", name = "electronic-circuit", amount = 5},
        {type = "item", name = "advanced-circuit", amount = 1},
      },
      results = {{type="item", name="planetaris-requester-big-chest", amount=1}},
      allow_productivity = false,
    },
    {
      type = "recipe",
      name = "planetaris-arig-roboport",
      enabled = false,
      energy_required = 5,
      ingredients =
      {
        {type = "item", name = "planetaris-glass-panel", amount = 10},
        {type = "item", name = "steel-plate", amount = 25},
        {type = "item", name = "iron-gear-wheel", amount = 25},
        {type = "item", name = "advanced-circuit", amount = 35}
      },
      results = {{type="item", name="planetaris-arig-roboport", amount=1}}
    },
      {
      type = "recipe",
      name = "planetaris-advanced-solar-panel",
      energy_required = 20,
      enabled = false,
      ingredients =
      {
        {type = "item", name = "solar-panel", amount = 1},
        {type = "item", name = "planetaris-glass-panel", amount = 4},
        {type = "item", name = "planetaris-silica", amount = 2}
      },
      results = {{type="item", name="planetaris-advanced-solar-panel", amount=1}}
    },
    {
      type = "recipe",
      name = "planetaris-supported-solar-panel",
      energy_required = 30,
      enabled = false,
      ingredients =
      {
        {type = "item", name = "planetaris-advanced-solar-panel", amount = 1},
        {type = "item", name = "steel-plate", amount = 5},
        {type = "item", name = "planetaris-heavy-glass", amount = 1}
      },
      results = {{type="item", name="planetaris-supported-solar-panel", amount=1}}
    },
    {
      type = "recipe",
      name = "planetaris-high-support-electric-pole",
      energy_required = 10,
      enabled = false,
      ingredients =
      {
        {type = "item", name = "copper-cable", amount = 1},
        {type = "item", name = "steel-plate", amount = 5},
        {type = "item", name = "planetaris-raw-quartz", amount = 1}
      },
      results = {{type="item", name="planetaris-high-support-electric-pole", amount=1}}
    },
    {
      type = "recipe",
      name = "planetaris-water-harvester",
      subgroup = "arig-production",
      energy_required = 20,
      enabled = false,
      ingredients =
      {
        {type = "item", name = "solar-panel", amount = 1},
        {type = "item", name = "steel-plate", amount = 20},
        {type = "item", name = "planetaris-glass-panel", amount = 1}
      },
      surface_conditions =
    {
      {
        property = "planetaris-dust-concentration",
        min = 50,
        max = 100,
      }
    },
      results = {{type="item", name="planetaris-water-harvester", amount=1}}
    },
      {
    type = "recipe",
    name = "planetaris-raw-diamond",
    category = "compressing",
    subgroup = "arig-processes",
    auto_recycle = false,
    enabled = false,
    energy_required = 2,
    ingredients =
    {
      {type = "item", name = "planetaris-raw-quartz", amount = 2},
      {type = "fluid", name = "petroleum-gas", amount = 20},
      {type = "item", name = "carbon", amount = 2},
    },
    results = {{type="item", name="planetaris-raw-diamond", amount=1}},
    allow_productivity = true
  },
    
    -- Base recipes to compression
    
  {
    type = "recipe",
    name = "planetaris-sulfur",
    localised_name = {"", {"item-name.sulfur"}, " (", {"technology-name.planetaris-compression"}, ")"},
    localised_description = {"item-description.sulfur"},
    category = "compressing",
    subgroup = "arig-processes",
    auto_recycle = false,
    enabled = false,
    energy_required = 4,
    ingredients =
    {
      {type = "fluid", name = "water", amount = 20}, -- Better than chemistry
      {type = "fluid", name = "petroleum-gas", amount = 20} -- Better than chemistry
    },
    results = {{type="item", name="sulfur", amount=1}},
    allow_productivity = true
  },
    {
    type = "recipe",
    name = "planetaris-plastic-bar",
    localised_name = {"", {"item-name.plastic-bar"}, " (", {"technology-name.planetaris-compression"}, ")"},
    localised_description = {"item-description.plastic-bar"},
    category = "compressing",
    subgroup = "arig-processes",
    auto_recycle = false,
    enabled = false,
    energy_required = 1,
    ingredients =
    {
      {type = "fluid", name = "petroleum-gas", amount = 25}, -- Better than chemistry
      {type = "item", name = "coal", amount = 1}
    },
    results = {{type="item", name="plastic-bar", amount=3}}, -- Better than chemistry
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "planetaris-solid-fuel-from-heavy-oil",
    localised_name = {"", {"recipe-name.solid-fuel-from-heavy-oil"}, " (", {"technology-name.planetaris-compression"}, ")"},
    localised_description = {"recipe-description.solid-fuel-from-heavy-oil"},
    category = "compressing",
    subgroup = "arig-processes",
    order = "a[sand-processing]-c-b",
    icon = "__base__/graphics/icons/solid-fuel-from-heavy-oil.png",
    auto_recycle = false,
    enabled = false,
    energy_required = 1,
    ingredients =
    {
      {type = "fluid", name = "heavy-oil", amount = 20}
    },
    results = {{type="item", name="solid-fuel", amount=1}},
    allow_productivity = true
  },
    {
    type = "recipe",
    name = "planetaris-solid-fuel-from-light-oil",
    localised_name = {"", {"recipe-name.solid-fuel-from-light-oil"}, " (", {"technology-name.planetaris-compression"}, ")"},
    localised_description = {"recipe-description.solid-fuel-from-light-oil"},
    category = "compressing",
    subgroup = "arig-processes",
    order = "a[sand-processing]-c-b",
    icon = "__base__/graphics/icons/solid-fuel-from-light-oil.png",
    auto_recycle = false,
    enabled = false,
    energy_required = 1,
    ingredients =
    {
      {type = "fluid", name = "light-oil", amount = 10}
    },
    results = {{type="item", name="solid-fuel", amount=1}},
    allow_productivity = true
  },
    {
    type = "recipe",
    name = "planetaris-solid-fuel-from-petroleum-gas",
    localised_name = {"", {"recipe-name.solid-fuel-from-petroleum-gas"}, " (", {"technology-name.planetaris-compression"}, ")"},
    localised_description = {"recipe-description.solid-fuel-from-petroleum-gas"},
    category = "compressing",
    subgroup = "arig-processes",
    order = "a[sand-processing]-c-b",
    icon = "__base__/graphics/icons/solid-fuel-from-petroleum-gas.png",
    auto_recycle = false,
    enabled = false,
    energy_required = 1,
    ingredients =
    {
      {type = "fluid", name = "petroleum-gas", amount = 20}
    },
    results = {{type="item", name="solid-fuel", amount=1}},
    allow_productivity = true
  },
      {
    type = "recipe",
    name = "planetaris-carbon",
    localised_name = {"", {"item-name.carbon"}, " (", {"technology-name.planetaris-compression"}, ")"},
    localised_description = {"item-description.carbon"},
    category = "compressing",
    subgroup = "arig-processes",
    auto_recycle = false,
    enabled = false,
    energy_required = 1,
    ingredients =
    {
      {type = "item", name = "coal", amount = 2},
      {type = "fluid", name = "sulfuric-acid", amount = 15}, -- Better than chemistry
    },
    results = {{type="item", name="carbon", amount=1}},
    allow_productivity = true
  },

    -- Water harvesting

    {
      type = "recipe",
      name = "planetaris-water-harvesting",
      category = "water-production",
      subgroup = "arig-processes",
      icon = "__base__/graphics/icons/fluid/water.png",
      energy_required = 10,
      enabled = false,
      ingredients = nil,
      results = {{type="fluid", name="water", amount=100}},
      allow_productivity = true
    }
})