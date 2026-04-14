if mods["aai-loaders"] then

require("PlanetarisLib")

if not data.raw["transport-belt"]["planetaris-hyper-transport-belt"] then return end

  local hyper_specs = {
    name = "hyper",
    transport_belt = "planetaris-hyper-transport-belt",
    color = {240, 243, 247},
    fluid = "lubricant",
    fluid_per_minute = "0.30",
    default_import_location = "arig",
    technology = {
      prerequisites = {"aai-turbo-loader", "processing-unit", "planetaris-hyper-transport-belt"},
      unit = {
        count = 600,
        ingredients = data.raw.technology["planetaris-hyper-transport-belt"].unit.ingredients,
        time = 15
      }
    },
    recipe = {
      crafting_category = "crafting-with-fluid-or-metallurgy",
      ingredients = {
        {type = "item", name = "planetaris-hyper-transport-belt", amount = 1},
        {type = "item", name = "planetaris-silica", amount = 30},
        {type = "item", name = "processing-unit", amount = 5},
        {type = "fluid", name = "lubricant", amount = 50}
      },
      energy_required = 2
    },
    unlubricated_recipe = {
      crafting_category = "crafting-with-fluid-or-metallurgy",
      ingredients = {
        {type = "item", name = "planetaris-hyper-transport-belt", amount = 1},
        {type = "item", name = "planetaris-silica", amount = 300},
        {type = "item", name = "processing-unit", amount = 50},
        {type = "fluid", name = "lubricant", amount = 500}
      },
      energy_required = 10
    }
  }

  if mods["aai-industry"] then
    hyper_specs.recipe.ingredients = {
      {type = "item", name = "aai-turbo-loader", amount = 1},
      {type = "item", name = "planetaris-silica", amount = 30},
      {type = "item", name = "processing-unit", amount = 5},
      {type = "fluid", name = "lubricant", amount = 50}
    }
    hyper_specs.unlubricated_recipe.ingredients = {
      {type = "item", name = "aai-turbo-loader", amount = 1},
      {type = "item", name = "planetaris-silica", amount = 300},
      {type = "item", name = "processing-unit", amount = 50},
      {type = "fluid", name = "lubricant", amount = 500}
    }
  end

  AAILoaders.make_tier(hyper_specs)

  if mods["planetaris-hyarion"] then
    PlanetarisLib.add_recipe_surface_condition("aai-hyper-loader", "planetaris-crystalization-resistance", 100, 50)
  else
    PlanetarisLib.add_recipe_surface_condition("aai-hyper-loader", "planetaris-dust-concentration", 100, 50)
  end

 return
end