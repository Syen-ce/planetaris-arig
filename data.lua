require("lib")
require("prototypes.planets.planet")
require("prototypes.planets.planet_arig_map_gen")
require("prototypes.planets.planet_map_gen")
require("prototypes.entities.entities")
require("prototypes.entities.remnants")
require("prototypes.entities.explosions")
require("prototypes.entities.resources")
require("prototypes.entities.transport-belts")
require("prototypes.item")
require("prototypes.fluid")
require("prototypes.tile.tile")
require("prototypes.tile.tile-collision-masks")
require("prototypes.categories.recipe-category")
require("prototypes.item-groups")
require("prototypes.recipe")
require("prototypes.technology")
require("prototypes.autoplace-controls")
require("prototypes.decoratives.decoratives")

local construction_robot = data.raw["construction-robot"]["construction-robot"]
if construction_robot then
  construction_robot.energy_per_move = "5000J"  -- vanilla default
end

local logistic_robot = data.raw["logistic-robot"]["logistic-robot"]
if logistic_robot then
  logistic_robot.energy_per_move = "5000J"  -- vanilla default
end