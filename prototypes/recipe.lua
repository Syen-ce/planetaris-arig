data:extend(
{
    {

        type = "recipe",
        name = "sifter",     
        energy_required = 5,
        enabled = false,
        subgroup = "arig-production",
        order = "a",
        surface_conditions =
    {
      {
        property = "pressure",
        min = 5,
        max = 50,
      }
    },
        ingredients =
        {
            {type = "item", name = "iron-plate", amount = 10},
            {type = "item", name = "iron-gear-wheel", amount = 10},
            {type = "item", name = "electronic-circuit", amount = 5},
            {type = "item", name = "pipe", amount = 2}
          },
          results = {{type="item", name="sifter", amount=1}}
    },
    {
        type = "recipe",
        name = "press",     
        energy_required = 5,
        enabled = false,
        subgroup = "arig-production",
        order = "a-b",
        surface_conditions =
    {
      {
        property = "pressure",
        min = 5,
        max = 50,
      }
    },
        ingredients =
        {
            {type = "item", name = "steel-plate", amount = 20},
            {type = "item", name = "iron-gear-wheel", amount = 15},
            {type = "item", name = "electronic-circuit", amount = 30},
            {type = "item", name = "plastic-bar", amount = 10}
          },
        results = {{type="item", name="press", amount=1}}
    },  
    {
        type = "recipe",
        name = "sand-sifting",
        icons = {
          {
            icon = "__planetaris-unbounded__/graphics/icons/fluid/sand.png"
          }
        },
        category = "sand-processing",
        subgroup = "arig-processes",
        order = "a[sand-processing]-a[sand-processing]",
        enabled = false,
        auto_recycle = false,
        energy_required = 0.5,
        ingredients = {{type = "fluid", name = "sand", amount = 600}},
        results =
        {
          {type = "fluid", name = "pure-sand",                  amount = 25, probability = 0.30, show_details_in_recipe_tooltip = false},
          {type = "fluid", name = "steam",                  amount = 60, probability = 0.25, temperature = 165, show_details_in_recipe_tooltip = false},
          {type = "item", name = "stone",                    amount = 1, probability = 0.05, show_details_in_recipe_tooltip = false},          
          {type = "item", name = "iron-ore",        amount = 1, probability = 0.20, show_details_in_recipe_tooltip = false},
          {type = "item", name = "copper-ore",             amount = 1, probability = 0.20, show_details_in_recipe_tooltip = false},
          {type = "item", name = "coal",               amount = 1, probability = 0.01, show_details_in_recipe_tooltip = false},
          {type = "item", name = "sulfur",            amount = 1, probability = 0.01, show_details_in_recipe_tooltip = false},
        },
        allow_productivity = false,
      },
      {
        type = "recipe",
        name = "advanced-sand-sifting",
        icons = {
          {
            icon = "__planetaris-unbounded__/graphics/icons/advanced-sand-sifting.png"
          }
        },
        category = "sand-processing",
        subgroup = "arig-processes",
        order = "a[sand-processing]-b[sand-processing]",
        enabled = false,
        auto_recycle = false,
        energy_required = 0.5,
        ingredients = {{type = "fluid", name = "sand", amount = 600}},
        results =
        {
          {type = "fluid", name = "pure-sand",                  amount = 50, probability = 0.20, show_details_in_recipe_tooltip = false},
          {type = "fluid", name = "steam",                  amount = 50, probability = 0.30, show_details_in_recipe_tooltip = false},
          {type = "item", name = "calcite",             amount = 1, probability = 0.20, show_details_in_recipe_tooltip = false},
          {type = "item", name = "coal",               amount = 1, probability = 0.05, show_details_in_recipe_tooltip = false},
          {type = "item", name = "sulfur",            amount = 1, probability = 0.25, show_details_in_recipe_tooltip = false},
        },
        allow_productivity = false,
      },
      {
        type = "recipe",
        name = "sandstone-brick",
        category = "compressing",
        order = "a[sand-processing]-b[sand-processing]",
        icon = "__planetaris-unbounded__/graphics/icons/sandstone-brick.png",
        enabled = false,
        energy_required = 2,
        ingredients = { { type = "fluid", name = "pure-sand", amount = 10 } },
        results = { { type = "item", name = "sandstone-brick", amount = 10 } }
    },
    {
      type = "recipe",
      name = "sandstone-foundation",
      icons = {
        {icon = "__planetaris-unbounded__/graphics/icons/sandstone-foundation.png"}
      },
      category = "compressing",
      order = "a[sand-processing]-b[sand-processing]-b",
      enabled = false,
      energy_required = 10,
      ingredients = 
      { 
        { type = "item", name = "sandstone-brick", amount = 20 },
        { type = "item", name = "stone-brick", amount = 10 },
        { type = "item", name = "steel-plate", amount = 2 }
      },
      results = { { type = "item", name = "sandstone-foundation", amount = 10 } }
  },
  {
    type = "recipe",
    name = "glass-panel",
    category = "smelting",
    subgroup = "arig-processes",
    auto_recycle = false,
    enabled = false,
    icon = "__planetaris-unbounded__/graphics/icons/glass-panel.png",
    energy_required = 3,
    ingredients = {
      {type = "item", name = "pure-sand-barrel", amount = 2}
    },
    results = {
      {type="item", name="glass-panel", amount=1},
      {type="item", name="barrel", amount=2}
  },
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "heavy-glass",
    category = "advanced-crafting",
    auto_recycle = false,
    enabled = false,
    icon = "__planetaris-unbounded__/graphics/icons/heavy-glass.png",
    energy_required = 5,
    surface_conditions =
    {
      {
        property = "pressure",
        min = 5,
        max = 50,
      }
    },
    ingredients = {
      {type="item", name="glass-panel", amount=1},
      {type="item", name="tungsten-plate", amount=3},
    },
    results = {{type="item", name="heavy-glass", amount=1}},
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "simulating-unit",
    category = "electromagnetics",
    enabled = false,
    energy_required = 15,
    icon = "__planetaris-unbounded__/graphics/icons/simulating-unit.png",
    ingredients =
    {
      {type = "item", name = "processing-unit", amount = 5},
      {type = "item", name = "silica", amount = 5},
      {type = "item", name = "heavy-glass", amount = 15},
    },
    results = {{type="item", name="simulating-unit", amount=1}},
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "quartz",
    category = "compressing",
    enabled = false,
    energy_required = 2,
    icon = "__planetaris-unbounded__/graphics/icons/quartz.png",
    ingredients =
    {
      {type = "fluid", name = "steam", amount = 20},
      {type = "fluid", name = "light-oil", amount = 20},
      {type = "item", name = "sandstone-brick", amount = 2},
    },
    results = {{type="item", name="quartz", amount=1}},
    allow_productivity = true
  },
  {
    type = "recipe",
    name = "silica",
    category = "compressing",
    enabled = false,
    energy_required = 2,
    icon = "__planetaris-unbounded__/graphics/icons/silica.png",
    ingredients =
    {
      {type = "fluid", name = "sulfuric-acid", amount = 20},
      {type = "item", name = "quartz", amount = 5},
      {type = "item", name = "calcite", amount = 1},
    },
    results = {{type="item", name="silica", amount=1}},
    allow_productivity = true
  },
    {
    type = "recipe",
    name = "compression-rocket-fuel",
    category = "compressing",
    subgroup = "arig-processes",
    enabled = false,
    energy_required = 2,
    icon = "__planetaris-unbounded__/graphics/icons/compression-rocket-fuel.png",
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
    name = "compression-science-pack",
    category = "compressing", -- change to compression
    enabled = false,
    icon = "__planetaris-unbounded__/graphics/icons/compression-science-pack.png",
    surface_conditions =
    {
      {
        property = "pressure",
        min = 5,
        max = 50,
      }
    },
    ingredients =
    {
      {type = "item", name = "glass-panel", amount = 5},
      {type = "item", name = "quartz", amount = 5},
      {type = "item", name = "sandstone-brick", amount = 20},

    },
    energy_required = 10,
    results = {{type="item", name="compression-science-pack", amount=1}},
    allow_productivity = false,
  },
    {
      type = "recipe",
      name = "assembling-machine-4",
      category = "electromagnetics",
      enabled = false,
      energy_required = 10,
      ingredients =
      {
        {type = "item", name = "simulating-unit", amount = 10},
        {type = "item", name = "speed-module-3", amount = 2},
        {type = "item", name = "assembling-machine-3", amount = 2}
      },
      results = {{type="item", name="assembling-machine-4", amount=1}},
      allow_productivity = false,
    },
    {
      type = "recipe",
      name = "hyper-transport-belt",
      category = "electromagnetics",
      surface_conditions =
    {
      {
        property = "pressure",
        min = 5,
        max = 50,
      }
    },
      enabled = false,
      icon = "__planetaris-unbounded__/graphics/icons/hyper-transport-belt.png",
      ingredients =
      {
        {type = "item", name = "turbo-transport-belt", amount = 1},
        {type = "item", name = "silica", amount = 2},
        {type = "fluid", name = "lubricant", amount = 20},

      },
      results = {{type="item", name="hyper-transport-belt", amount=1}},
      allow_productivity = false,
    },
    {
      type = "recipe",
      name = "hyper-splitter",
      category = "electromagnetics",
      surface_conditions =
    {
      {
        property = "pressure",
        min = 5,
        max = 50,
      }
    },
      enabled = false,
      icon = "__planetaris-unbounded__/graphics/icons/hyper-splitter.png",
      ingredients =
      {
        {type = "item", name = "turbo-splitter", amount = 1},
        {type = "item", name = "processing-unit", amount = 2},
        {type = "item", name = "silica", amount = 2},
      },
      results = {{type="item", name="hyper-splitter", amount=1}},
      allow_productivity = false,
    },
    {
      type = "recipe",
      name = "hyper-underground-belt",
      category = "electromagnetics",
      surface_conditions =
    {
      {
        property = "pressure",
        min = 5,
        max = 50,
      }
    },
      enabled = false,
      icon = "__planetaris-unbounded__/graphics/icons/hyper-underground-belt.png",
      ingredients =
      {
        {type = "item", name = "turbo-transport-belt", amount = 1},
        {type = "item", name = "silica", amount = 3},
        {type = "fluid", name = "lubricant", amount = 30},
      },
      results = {{type="item", name="hyper-underground-belt", amount=2}},
      allow_productivity = false,
    },
    {
      type = "recipe",
      name = "big-chest",
      category = "advanced-crafting",
      energy_required = 20,
      enabled = false,
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = 30},
        {type = "item", name = "heavy-glass", amount = 30},
        {type = "item", name = "silica", amount = 15},
      },
      results = {{type="item", name="big-chest", amount=1}},
      allow_productivity = false,
    },
})