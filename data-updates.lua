-- Set the next_upgrade property to point to assembling-machine-4

local assemblingMachine3 = data.raw["assembling-machine"]["assembling-machine-3"]

assemblingMachine3.next_upgrade = "planetaris-assembling-machine-4"


data.raw["transport-belt"]["turbo-transport-belt"].next_upgrade = "planetaris-hyper-transport-belt"
data.raw["underground-belt"]["turbo-underground-belt"].next_upgrade = "planetaris-hyper-underground-belt"
data.raw["splitter"]["turbo-splitter"].next_upgrade = "planetaris-hyper-splitter"


-- Add new sea tiles to Foundation
table.insert(data.raw.item["foundation"].place_as_tile.tile_condition, "arig-sand")

-- Expanded furnace result slots for glass panel recipe

data.raw["furnace"]["stone-furnace"].result_inventory_size = 2
data.raw["furnace"]["steel-furnace"].result_inventory_size = 2
data.raw["furnace"]["electric-furnace"].result_inventory_size = 2

-- Surface conditions

local function ten_pressure_condition()
    return
    {
      {
        property = "pressure",
        min = 10
      }
    }
  end

data.raw["rail-ramp"]["rail-ramp"].surface_conditions = ten_pressure_condition()
data.raw["elevated-straight-rail"]["elevated-straight-rail"].surface_conditions = ten_pressure_condition()
data.raw["elevated-half-diagonal-rail"]["elevated-half-diagonal-rail"].surface_conditions = ten_pressure_condition()
data.raw["elevated-curved-rail-a"]["elevated-curved-rail-a"].surface_conditions = ten_pressure_condition()
data.raw["elevated-curved-rail-b"]["elevated-curved-rail-b"].surface_conditions = ten_pressure_condition()
data.raw["rail-support"]["rail-support"].surface_conditions = ten_pressure_condition()

local function one_pressure_condition()
    return
    {
      {
        property = "pressure",
        min = 1
      }
    }
  end

data.raw["furnace"]["stone-furnace"].surface_conditions = one_pressure_condition()
data.raw["mining-drill"]["burner-mining-drill"].surface_conditions = one_pressure_condition()
data.raw["furnace"]["steel-furnace"].surface_conditions = one_pressure_condition()
data.raw["boiler"]["boiler"].surface_conditions = one_pressure_condition()
data.raw["inserter"]["burner-inserter"].surface_conditions = one_pressure_condition()

table.insert(data.raw.lab["lab"].inputs, "planetaris-compression-science-pack")


table.insert(data.raw.technology["rocket-fuel-productivity"].effects, {
        type = "change-recipe-productivity",
        recipe = "planetaris-compression-rocket-fuel",
        change = 0.1}
      )