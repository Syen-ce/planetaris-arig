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
            ["arig-brown-fluff"] = {},
            ["arig-brown-fluff-dry"] = {},
            ["arig-small-sand-rock"] = {},
            ["arig-small-cactus"] = {},
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
            ["heavy-oil-geyser"] = {},
            ["arig-crash"] = {},
          }
        }
      }
    }
  end

  planet_map_gen.hyarion = function()
    return
    {
      property_expression_names =
      {
      elevation = "hyarion_elevation",
      temperature = "hyarion_temperature",
      moisture = "hyarion_moisture",
      aux = "hyarion_aux",
      cliffiness = "cliffiness_basic",
      cliff_elevation = "cliff_elevation_from_elevation",
      ["entity:hyarion-quartz-ore:probability"] = "hyarion_quartz_ore_probability",
      ["entity:hyarion-quartz-ore:richness"] = "hyarion_quartz_ore_richness",
      ["entity:hyarion-metallic-ore:probability"] = "hyarion_iron_probability",
      ["entity:hyarion-metallic-ore:richness"] = "hyarion_iron_richness",
      ["entity:hyarion-carbon-ore:probability"] = "hyarion_carbon_probability",
      ["entity:hyarion-carbon-ore:richness"] = "hyarion_carbon_richness",
      ["entity:emerald-geode:probability"] = "hyarion_emerald_geode_probability",
      ["entity:emerald-geode:richness"] = "hyarion_emerald_geode_richness",
      ["entity:ruby-geode:probability"] = "hyarion_ruby_geode_probability",
      ["entity:ruby-geode:richness"] = "hyarion_ruby_geode_richness",
      ["entity:sapphire-geode:probability"] = "hyarion_sapphire_geode_probability",
      ["entity:sapphire-geode:richness"] = "hyarion_sapphire_geode_richness",
    },
    cliff_settings =
    {
      name = "hyarion-cliff",
      cliff_elevation_interval = 120,
      cliff_elevation_0 = 70
    },
      autoplace_controls =
      {
      ["hyarion_iron"] = {},
      ["hyarion_carbon"] = {},
      ["hyarion_quartz"] = {},
      ["hyarion_emerald"] = {},
      ["hyarion_ruby"] = {},
      ["hyarion_sapphire"] = {},
      ["hyarion_volcanism"] = {},
      },
      autoplace_settings =
      {
        ["tile"] =
        {
          settings =
        {
          --nauvis tiles
          ["hyarion-soil-dark"] = {},
          ["hyarion-soil-light"] = {},
          ["hyarion-ash-soil"] = {},
          --end of nauvis tiles
          ["hyarion-ash-flats"] = {},
          ["hyarion-ash-light"] = {},
          ["hyarion-ash-dark"] = {},
          ["hyarion-cracks"] = {},
          ["hyarion-cracks-warm"] = {},
          ["hyarion-folds"] = {},
          ["hyarion-folds-flat"] = {},
          ["lava"] = {},
          ["lava-hot"] = {},
          ["hyarion-folds-warm"] = {},
          ["hyarion-pumice-stones"] = {},
          ["hyarion-cracks-hot"] = {},
          ["hyarion-jagged-ground"] = {},
          ["hyarion-smooth-stone"] = {},
          ["hyarion-smooth-stone-warm"] = {},
          ["hyarion-ash-cracks"] = {},
        }
        },
        ["decorative"] =
        {
          settings =
        {
          -- nauvis decoratives
          ["v-brown-carpet-grass"] = {},
          ["v-green-hairy-grass"] = {},
          ["v-brown-hairy-grass"] = {},
          ["v-red-pita"] = {},
          -- end of nauvis
          ["vulcanus-rock-decal-large"] = {},
          ["vulcanus-crack-decal-large"] = {},
          ["vulcanus-crack-decal-huge-warm"] = {},
          ["vulcanus-dune-decal"] = {},
          ["vulcanus-sand-decal"] = {},
          ["vulcanus-lava-fire"] = {},
          ["calcite-stain"] = {},
          ["calcite-stain-small"] = {},
          ["sulfur-stain"] = {},
          ["sulfur-stain-small"] = {},
          ["sulfuric-acid-puddle"] = {},
          ["sulfuric-acid-puddle-small"] = {},
          ["crater-small"] = {},
          ["crater-large"] = {},
          ["pumice-relief-decal"] = {},
          ["small-volcanic-rock"] = {},
          ["medium-volcanic-rock"] = {},
          ["tiny-volcanic-rock"] = {},
          ["tiny-rock-cluster"] = {},
          ["small-sulfur-rock"] = {},
          ["tiny-sulfur-rock"] = {},
          ["sulfur-rock-cluster"] = {},
          ["waves-decal"] = {},
        }
        },
        ["entity"] =
        {
          settings =
        {
          ["hyarion-quartz-ore"] = {},
          ["hyarion-metallic-ore"] = {},
          ["hyarion-carbon-ore"] = {},
          ["emerald-geode"] = {},
          ["sapphire-geode"] = {},
          ["ruby-geode"] = {},
          ["huge-volcanic-rock"] = {},
          ["big-volcanic-rock"] = {},
          ["crater-cliff"] = {},
          ["vulcanus-chimney"] = {},
          ["vulcanus-chimney-faded"] = {},
          ["vulcanus-chimney-cold"] = {},
          ["vulcanus-chimney-short"] = {},
          ["vulcanus-chimney-truncated"] = {},
          ["ashland-lichen-tree"] = {},
          ["ashland-lichen-tree-flaming"] = {},
        }
        }
      }
    }
  end
  
  return planet_map_gen