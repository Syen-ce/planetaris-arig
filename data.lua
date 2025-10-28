require("lib")
require("prototypes.achievements")
require("prototypes.autoplace-controls")
require("prototypes.categories.recipe-category")
require("prototypes.decoratives.arig-decoratives")
require("prototypes.entities.entities")
require("prototypes.entities.remnants")
require("prototypes.entities.explosions")
require("prototypes.entities.plants")
require("prototypes.entities.resources")
require("prototypes.entities.transport-belts")
require("prototypes.fluid")
require("prototypes.item")
require("prototypes.item-groups")
require("prototypes.planets.planet")
require("prototypes.planets.planet_arig_map_gen")
require("prototypes.planets.planet_map_gen")
require("prototypes.planets.surface-conditions")
require("prototypes.recipe")
require("prototypes.technology")
require("prototypes.tile.arig-tile")
require("prototypes.tile.tile-collision-masks")
require("prototypes.tips-and-tricks")

--------------------- Compat

require("compat.krastorio2-so")
require("compat.resource-spawner-overhaul")
require("compat.aai-industry")
require("compat.aai-loaders")
require("compat.aai-loaders-sane")
require("compat.bzlead")
require("compat.bztin")
require("compat.crushing-industry")
require("compat.cloud-city")
require("compat.igrys")
require("compat.lignumis")
require("compat.wood-industry")
require("compat.planet-muluna")


if mods["any-planet-start"] then
    APS.add_planet{name = "arig", filename = "__planetaris-arig__/compat/any-planet-start-arig.lua", technology = "planet-discovery-arig"}
end