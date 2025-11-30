local planet_map_gen = require("__base__/prototypes/planet/planet-map-gen")

planet_map_gen.arig = function()
    return
    {
      aux_climate_control = false,
      moisture_climate_control = false,
      property_expression_names =
      {
        elevation = "terraced_elevation",
        moisture = "moisture_basic",
        aux = "vulcanus_aux",
        cliffiness = "terraced_cliffiness",
        cliff_elevation = "cliff_elevation_from_elevation",
        ["entity:stone:richness"] = "arig_stone_richness",
        ["entity:stone:probability"] = "arig_stone_probability",
      },
      cliff_settings =
      {
        name = "arig-cliff",
        cliff_elevation_0 = 10,           -- First cliff threshold at 10 elevation
        cliff_elevation_interval = 100,   -- Next cliff at 110 (won't reach this)
        richness = 1
      },
      autoplace_controls =
      {
        ["arig_sand"] = {},
        ["arig_stone"] = {},
        ["arig_cliff"] = {},
        ["arig_rocks"] = {},
        ["arig_crash"] = {},
        ["heavy-oil-geyser"] = {
          richness = 2,
          frequency = 10,
          Size = 4,
        },
      },
      autoplace_settings =
      {
        ["tile"] =
        {
          settings =
          {
            ["arig-sand"] = {},
            ["arig-deep-sand"] = {},
            ["arig-stable-sand"] = {},
            ["planetaris-sandstone-1"] = {},
            ["planetaris-sandstone-2"] = {},
            ["planetaris-sandstone-3"] = {},
            ["planetaris-arig-rock"] = {},
          }
        },
        ["decorative"] =
        {
          settings =
          {
            ["arig-red-desert-decal"] = {},
            ["arig-sand-decal"] = {},
            ["arig-brown-fluff"] = {},
            ["arig-brown-fluff-dry"] = {},
            ["arig-small-sand-rock"] = {},
            ["arig-crack-decal"] = {},
            ["arig-crack-decal-large"] = {},
            ["arig-tiny-rock-cluster"] = {},
            ["arig-dune-decal"] = {},
            ["arig-pumice-relief-decal"] = {},
          }
        },
        ["entity"] =
        {
          settings =
          {
            ["stone"] = {},
            ["arig-big-sand-rock"] = {},
            ["arig-medium-sand-rock"] = {},
            ["arig-small-cactus-plant"] = {},
            ["heavy-oil-geyser"] = {},
            ["arig-crash"] = {},
          }
        }
      }
    }
  end

  return planet_map_gen