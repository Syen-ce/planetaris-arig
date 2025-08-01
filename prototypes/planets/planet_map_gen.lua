local planet_map_gen = require("__base__/prototypes/planet/planet-map-gen")

planet_map_gen.arig = function()
    return
    {
      aux_climate_control = false,
      moisture_climate_control = false,
      property_expression_names =
      {
        elevation = "arig_island_elevation",
        temperature = "arig_island_temperature",
        moisture = "moisture_basic",
        aux = "vulcanus_aux",
      },
      cliff_settings =
      {
        name = "arig-cliff",
        control = "arig_cliff",
        cliff_smoothing = 0,
      },
      autoplace_controls =
      {
        ["arig_sand"] = {
          frequency = 10,
          Size = 10,
        },
        ["stone"] = {
          frequency = 2,
          Size = 2,
        },
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
            ["arig-sand-dune-decal"] = {},
            ["arig-brown-fluff"] = {},
            ["arig-brown-fluff-dry"] = {},
            ["arig-white-desert-bush"] = {},
            ["arig-small-sand-rock"] = {},
          }
        },
        ["entity"] =
        {
          settings =
          {
            ["stone"] = {},
            ["arig-big-sand-rock"] = {},
            ["arig-medium-sand-rock"] = {},
            ["heavy-oil-geyser"] = {},
            ["arig-crash"] = {},
          }
        }
      }
    }
  end
  
  return planet_map_gen