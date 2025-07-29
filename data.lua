require("lib")
require("prototypes.planets.planet")
require("prototypes.planets.planet_arig_map_gen")
require("prototypes.planets.planet_map_gen")
require("prototypes.planets.surface-conditions")
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

--------------------- Compat

require("compat.krastorio2-so")
require("compat.resource-spawner-overhaul")
require("compat.aai-industry")
require("compat.bzlead")
require("compat.bztin")
require("compat.crushing-industry")
require("compat.wood-industry")

if mods["any-planet-start"] then
    APS.add_planet{name = "arig", filename = "__planetaris-unbounded__/compat/any-planet-start.lua", technology = "planet-discovery-arig"}
end