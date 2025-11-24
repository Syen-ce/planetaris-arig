local planetaris_tile_collision_masks = require("prototypes.tile.tile-collision-masks")

-- Set Upgrade for level 5 belts

data.raw["transport-belt"]["turbo-transport-belt"].next_upgrade = "planetaris-hyper-transport-belt"
data.raw["underground-belt"]["turbo-underground-belt"].next_upgrade = "planetaris-hyper-underground-belt"
data.raw["splitter"]["turbo-splitter"].next_upgrade = "planetaris-hyper-splitter"

-- Set Upgrade for solar panels

data.raw["solar-panel"]["solar-panel"].next_upgrade = "planetaris-advanced-solar-panel"

-- Add new sea tiles to Foundation
table.insert(data.raw.item["foundation"].place_as_tile.tile_condition, "arig-sand")

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
table.insert(data.raw["rail-ramp"]["rail-ramp"].surface_conditions, {
        property = "planetaris-dust-concentration",
        max = 50
      })
table.insert(data.raw["elevated-straight-rail"]["elevated-straight-rail"].surface_conditions, {
        property = "planetaris-dust-concentration",
        max = 50
      })
table.insert(data.raw["elevated-half-diagonal-rail"]["elevated-half-diagonal-rail"].surface_conditions, {
        property = "planetaris-dust-concentration",
        max = 50
      })
table.insert(data.raw["elevated-curved-rail-a"]["elevated-curved-rail-a"].surface_conditions, {
        property = "planetaris-dust-concentration",
        max = 50
      })
table.insert(data.raw["elevated-curved-rail-b"]["elevated-curved-rail-b"].surface_conditions, {
        property = "planetaris-dust-concentration",
        max = 50
      })
table.insert(data.raw["rail-support"]["rail-support"].surface_conditions, {
        property = "planetaris-dust-concentration",
        max = 50
      })
table.insert(data.raw["roboport"]["roboport"].surface_conditions, {
        property = "planetaris-dust-concentration",
        max = 50
      })

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

table.insert(data.raw["recipe"]["electromagnetic-plant"].surface_conditions, less_50_dust_concentration)
table.insert(data.raw["recipe"]["cryogenic-plant"].surface_conditions, less_50_dust_concentration)
table.insert(data.raw["recipe"]["recycler"].surface_conditions, less_50_dust_concentration)