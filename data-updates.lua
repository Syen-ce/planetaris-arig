local planetaris_tile_collision_masks = require("prototypes.tile.tile-collision-masks")

-- Set Upgrade for level 5 belts

data.raw["transport-belt"]["turbo-transport-belt"].next_upgrade = "planetaris-hyper-transport-belt"
data.raw["underground-belt"]["turbo-underground-belt"].next_upgrade = "planetaris-hyper-underground-belt"
data.raw["splitter"]["turbo-splitter"].next_upgrade = "planetaris-hyper-splitter"

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
table.insert(data.raw["roboport"]["roboport"].surface_conditions, {
        property = "planetaris-dust-concentration",
        max = 50
      })

-- Addon description to rail support on deep sand
data.raw.technology["rail-support-foundations"].localized_description = {"", {"technology-description.rail-support-foundations"}, "",{"technology-description.rail-support-foundations-addon"}}

-- Adding science packs
table.insert(data.raw.lab["lab"].inputs, "planetaris-compression-science-pack")


table.insert(data.raw.technology["rocket-fuel-productivity"].effects, {
        type = "change-recipe-productivity",
        recipe = "planetaris-compression-rocket-fuel",
        change = 0.1}
      )

-- add deep sea collision masks to tiles

--data.raw.tile["ammoniacal-ocean-2"].collision_mask = planetaris_tile_collision_masks.deep_ammoniacal_ocean()
--data.raw.tile["deepwater"].collision_mask = planetaris_tile_collision_masks.deep_water()
--data.raw.tile["deepwater-green"].collision_mask = planetaris_tile_collision_masks.deep_water()
data.raw.tile["oil-ocean-deep"].collision_mask = planetaris_tile_collision_masks.oil_ocean_deep()

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