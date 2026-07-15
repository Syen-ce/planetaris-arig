PlanetarisLib = require("PlanetarisLib")

require("compat.tiber")
require("compat.water-harvesting-recipes")

--------------------------------

-- Set Upgrade for level 5 belts

if data.raw["transport-belt"]["planetaris-hyper-transport-belt"] and data.raw["transport-belt"]["planetaris-hyper-transport-belt"].hidden == false then
  data.raw["transport-belt"]["turbo-transport-belt"].next_upgrade = "planetaris-hyper-transport-belt"
end

if data.raw["transport-belt"]["planetaris-hyper-underground-belt"] and data.raw["transport-belt"]["planetaris-hyper-underground-belt"].hidden == false then
  data.raw["underground-belt"]["turbo-underground-belt"].next_upgrade = "planetaris-hyper-underground-belt"
end

if data.raw["transport-belt"]["planetaris-hyper-splitter"] and data.raw["transport-belt"]["planetaris-hyper-splitter"].hidden == false then
  data.raw["splitter"]["turbo-splitter"].next_upgrade = "planetaris-hyper-splitter"
end

-- Set Upgrade for solar panels

data.raw["solar-panel"]["solar-panel"].next_upgrade = "planetaris-advanced-solar-panel"

-- Add new sea tiles to Foundation
table.insert(data.raw.item["foundation"].place_as_tile.tile_condition, "arig-sand")
table.insert(data.raw.item["foundation"].place_as_tile.tile_condition, "arig-deep-sand")

-- Expanded furnace result slots for glass panel recipe

local stone_furnace = data.raw["furnace"]["stone-furnace"]
if stone_furnace then
  if stone_furnace.result_inventory_size < 2 then
    stone_furnace.result_inventory_size = 2
  end
end

local steel_furnace = data.raw["furnace"]["steel-furnace"]
if steel_furnace then
  if steel_furnace.result_inventory_size < 2 then
    steel_furnace.result_inventory_size = 2
  end
end

local electric_furnace = data.raw["furnace"]["electric-furnace"]
if electric_furnace then
  if electric_furnace.result_inventory_size < 2 then
    electric_furnace.result_inventory_size = 2
  end
end

-- Surface conditions

-- No buildable on Arig
if data.raw["roboport"]["roboport"] and data.raw["roboport"]["roboport"].surface_conditions then
table.insert(data.raw["roboport"]["roboport"].surface_conditions, {
        property = "planetaris-dust-concentration",
        max = 50
      })
end

-- Addon description to rail support on deep sand
data.raw.technology["rail-support-foundations"].localized_description = {"", {"technology-description.rail-support-foundations"}, "",{"technology-description.rail-support-foundations-addon"}}

-- Adding science packs
table.insert(data.raw.lab["lab"].inputs, "planetaris-compression-science-pack")

table.insert(data.raw.technology["rocket-fuel-productivity"].effects, {
        type = "change-recipe-productivity",
        recipe = "planetaris-compression-rocket-fuel",
        change = 0.1}
      )

-- Block other planet recipes from arig

local less_50_dust_concentration = {
          property = "planetaris-dust-concentration",
          min = 0,
          max = 50,
        }

if data.raw["recipe"]["electromagnetic-plant"] then
  if data.raw["recipe"]["electromagnetic-plant"].surface_conditions == nil then
    data.raw["recipe"]["electromagnetic-plant"].surface_conditions = {less_50_dust_concentration}
  else
    table.insert(data.raw["recipe"]["electromagnetic-plant"].surface_conditions, less_50_dust_concentration)
  end
end

if data.raw["recipe"]["cryogenic-plant"] then
  if data.raw["recipe"]["cryogenic-plant"].surface_conditions == nil then
    data.raw["recipe"]["cryogenic-plant"].surface_conditions = {less_50_dust_concentration}
  else
    table.insert(data.raw["recipe"]["cryogenic-plant"].surface_conditions, less_50_dust_concentration)
  end
end

if data.raw["recipe"]["recycler"] then
  if data.raw["recipe"]["recycler"].surface_conditions == nil then
    data.raw["recipe"]["recycler"].surface_conditions = {less_50_dust_concentration}
  else
    table.insert(data.raw["recipe"]["recycler"].surface_conditions, less_50_dust_concentration)
  end
end

-- Add hyarion advanced quartz recipes to the prod tech
if mods["planetaris-hyarion"] then
  if data.raw.technology["planetaris-raw-quartz-productivity"] then
    table.insert(data.raw.technology["planetaris-raw-quartz-productivity"].effects,       {
          type = "change-recipe-productivity",
          recipe = "planetaris-advanced-raw-quartz",
          change = 0.1
        })
  end
end

-- Add solid fuel to compression

if data.raw.recipe["solid-fuel-from-petroleum-gas"] then
  PlanetarisLib.add_recipe_category("solid-fuel-from-petroleum-gas", "compressing")
end

if data.raw.recipe["solid-fuel-from-heavy-oil"] then
  PlanetarisLib.add_recipe_category("solid-fuel-from-heavy-oil", "compressing")
end

if data.raw.recipe["solid-fuel-from-light-oil"] then
  PlanetarisLib.add_recipe_category("solid-fuel-from-light-oil", "compressing")
end

-- Update Agri tower 
data.raw.technology["condensing-agricultural-tower"].effects = {
    {
      type = "unlock-recipe",
      recipe = "condensing-agricultural-tower"
    },
  }
data.raw.technology["condensing-agricultural-tower"].prerequisites = {"planetaris-cactus-wood", "planetaris-glass"}
data.raw.technology["condensing-agricultural-tower"].unit = nil
data.raw.technology["condensing-agricultural-tower"].research_trigger = {
    type = "craft-item",
    item = "planetaris-glass-panel",
    count = 25
  }

data.raw["recipe"]["condensing-agricultural-tower"].ingredients ={
      {type = "item", name = "storage-tank", amount = 1},
      {type = "item", name = "electronic-circuit", amount = 5},
      {type = "item", name = "wood", amount = 20},
      {type = "item", name = "planetaris-glass-panel", amount = 10},
      {type = "item", name = "landfill", amount = 1}
    }
    
if data.raw["agricultural-tower"] and data.raw["agricultural-tower"]["condensing-agricultural-tower"] then
  local tower = data.raw["agricultural-tower"]["condensing-agricultural-tower"]
  local desc = tower.factoriopedia_description
  
  if desc then
    table.insert(desc, {"factoriopedia-description.condensing-cactus"})
  end
end

-- Add lithium recipes

if data.raw.technology["lithium-processing"] then
  PlanetarisLib.add_tech_unlock("lithium-processing", "planetaris-lithium-brine-sifting")
  PlanetarisLib.add_tech_unlock("lithium-processing", "planetaris-lithium-plate")
else
  PlanetarisLib.add_tech_unlock("planetaris-advanced-sand-sifting", "planetaris-lithium-brine-sifting")
  PlanetarisLib.add_tech_unlock("planetaris-compression", "planetaris-lithium-plate")
end


-- Show water harvesting recipes in factorpedia

if settings.startup["hide-water-harvesting-recipes"].value == true then
  for _, recipe in pairs(data.raw.recipe) do
    if recipe.subgroup == "water-harvesting" then
      recipe.hidden_in_factoriopedia = true
    end
  end
end

-- Optional makes press steam powered

if settings.startup["press-is-steam-powered"].value == true then

  data.raw["assembling-machine"]["planetaris-press"].energy_source = {
			type = "fluid",
			scale_fluid_usage = true,
			light_flicker = {
				color = { 1, 1, 1, 1 },
			},
      emissions_per_minute = { pollution = 8},
			fluid_box = {
				pipe_covers = pipecoverspictures(),
				always_draw_covers = false,
				volume = 200,
				pipe_connections = {
					{ direction = defines.direction.west, position = { -1, 0 }},
					{ direction = defines.direction.east, position = { 1, 0 }},
				},
				production_type = "input-output",
			},
    }

    data.raw["assembling-machine"]["planetaris-press"].energy_usage = "700kW"

end

-- add planet backdrop

data.raw.planet["arig"].platform_surface_render_parameters = util.table.deepcopy(data.raw.planet["nauvis"].platform_surface_render_parameters)

data.raw.planet["arig"].platform_surface_render_parameters.day_night_cycle_color_lookup =
            {
              {0.0, "__planetaris-arig__/graphics/lut/arig-1-day.png"},
              {0.20, "__planetaris-arig__/graphics/lut/arig-1-day.png"},
              {0.45, "__space-age__/graphics/lut/vulcanus-2-night.png"},
              {0.55, "__space-age__/graphics/lut/vulcanus-2-night.png"},
              {0.80, "__planetaris-arig__/graphics/lut/arig-1-day.png"},
            }

data.raw.planet["arig"].platform_surface_render_parameters.platform_backdrop =
{
  atmosphere_color = {
    28,
    23,
    17,
    30,
  },
  atmosphere_ray_light_color_1 = {
    196,
    130,
    55,
    255,
  },
  atmosphere_ray_light_color_2 = {
    25.5,
    21.49905,
    12.900450000000001,
    255,
  },
  atmosphere_thickness = 0.05,
  cloud_flow_intensity = 2,
  cloud_flow_seconds = 32,
  cloud_normal_intensity = 2,
  cloud_panning_rate = 10,
  cloud_vertical_offset = 0,
  cloudiness = 0.6,
  emission_scalar = 2,
  emission_scales_with_shadow = true,
  light_color = {
    246,
    241,
    235,
    255,
  },
  light_direction = {
    3,
    0,
    2,
  },
  light_intensity_contrast = 0.52,
  light_radius = 7,
  planet_axis = {
    -35,
    22,
  },
  planet_axis_deviation_amplitude = {
    0,
    0,
  },
  planet_axis_deviation_seconds = {
    600,
    712,
  },
  radius = 400,
  rotation_seconds = 250,
  specular_color = {
    255,
    255,
    255,
    255,
  },
  specular_intensity = 1,
  surface_normal_intensity = 0.1,

  position = {-680, 601},
  parallax_strength = {0.95, 0.95},
  planet_surface =
  {
    filename = "__planetaris-arig__/graphics/space/arig.png",
    width = 2048,
    height = 1024
  },
  planet_normal = nil,
  --planet_emission =
  --{
  --  filename = "__planetaris-arig__/graphics/space/arig-emission.png",
  --  width = 2048,
  --  height = 1024
  --},
  planet_reflectivity =
  {
    filename = "__planetaris-arig__/graphics/space/arig-reflectivity.png",
    width = 2048,
    height = 1024
  },
  global_cloud =
  {
    filename = "__planetaris-arig__/graphics/space/arig-cloud.png",
    width = 2048,
    height = 1024
  },
  global_cloud_normal =
  {
    filename = "__planetaris-arig__/graphics/space/arig-cloud-normal.png",
    width = 2048,
    height = 1024
  },
  global_cloud_flow =
  {
    filename = "__planetaris-arig__/graphics/space/arig-cloud-flow.png",
    width = 2048,
    height = 1024
  }
}