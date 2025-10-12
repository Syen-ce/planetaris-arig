local planetaris_tile_collision_masks = require("prototypes.tile.tile-collision-masks")

if not mods["pelagos"] then return end

data.raw.tile["pelagos-deepsea"].collision_mask = planetaris_tile_collision_masks.deep_water()