local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local base_tile_sounds = require("__base__.prototypes.tile.tile-sounds")
local space_age_tile_sounds = require ("__space-age__.prototypes.tile.tile-sounds")
local decorative_trigger_effects = require("__base__.prototypes.decorative.decorative-trigger-effects")
local simulations = require("prototypes.factoriopedia-simulations")

local base_decorative_sprite_priority = "extra-high"
local decal_tile_layer = 255

local function combine_tint(table_1, table_2)
  local t1 = table_1[1]-(1-table_2[1])
  local t2 = table_1[2]-(1-table_2[2])
  local t3 = table_1[3]-(1-table_2[3])
  return {t1,t2,t3}
end

local vulcanus_base_tint = {1,1,1}

local green_hairy_tint = {.85,.6,.7}
local brown_hairy_tint = {.7,.7,.7}
local brown_carpet_tint = {1,.9,1}
local red_pita_tint = {.8,.75,.75}
local tintable_rock_tint = {0.2588, 0.2588, 0.2588}
local tintable_crystal_rock_tint = {1, 1, 1}
local metallic_rock_tint = {0.624, 0.435, 0.651}
local tungsten_rock_tint = {.7,.7,.7}

local yellow_crystal_tint = {0.89, 0.843, 0.792}
local orange_crystal_tint = {1, 0.933, 0.855}
local red_crystal_tint = {1, 0.831, 0.831}

green_hairy_tint = combine_tint(vulcanus_base_tint, green_hairy_tint)
brown_hairy_tint = combine_tint(vulcanus_base_tint, brown_hairy_tint)
brown_carpet_tint = combine_tint(vulcanus_base_tint, brown_carpet_tint)
red_pita_tint =  combine_tint(vulcanus_base_tint, red_pita_tint)
tintable_rock_tint = combine_tint(vulcanus_base_tint, tintable_rock_tint)
tungsten_rock_tint = combine_tint(vulcanus_base_tint, tungsten_rock_tint)

function chimney_metallic_stateless_visualisation(position)
  return
  {
    -- expanded 2 animation layers into 2 visualisations to demo multiple visualisations
    {
      count = 1,
      render_layer = "smoke",
      offset_x = position[1],
      offset_y = position[2],
      animation =
      {
        filename = "__planetaris-unbounded-assets__/graphics/entity/metallic-geyser/metallic-geyser-gas-outer.png",
        frame_count = 47,
        line_length = 16,
        width = 90,
        height = 188,
        animation_speed = 0.3,
        shift = util.by_pixel(-6, -89),
        scale = 1,
        tint = util.multiply_color({0.847, 0.549, 0.871}, 0.08)
      }
    },
    {
      count = 1,
      render_layer = "smoke",
      offset_x = position[1],
      offset_y = position[2],
      animation =
      {
         filename = "__planetaris-unbounded-assets__/graphics/entity/metallic-geyser/metallic-geyser-gas-inner.png",
         frame_count = 47,
         line_length = 16,
         width = 40,
         height = 84,
         animation_speed = 0.4,
         shift = util.by_pixel(-4, -30),
         scale = 1,
         tint = util.multiply_color({0.976, 0.671, 1}, 0.05)
      }
    }
  }
end

function chimney_metallic_stateless_visualisation_tinted(position)
  return
  {
    -- expanded 2 animation layers into 2 visualisations to demo multiple visualisations
    {
      count = 1,
      render_layer = "smoke",
      offset_x = position[1],
      offset_y = position[2],
      animation =
      {
        filename = "__planetaris-unbounded-assets__/graphics/entity/metallic-geyser/metallic-geyser-gas-outer.png",
        frame_count = 47,
        line_length = 16,
        width = 90,
        height = 188,
        animation_speed = 0.3,
        shift = util.by_pixel(-6, -89),
        scale = 1,
        tint = util.multiply_color({0.925, 0.424, 0.961}, 0.15)
      }
    },
    {
      count = 1,
      render_layer = "smoke",
      offset_x = position[1],
      offset_y = position[2],
      animation =
      {
         filename = "__planetaris-unbounded-assets__/graphics/entity/metallic-geyser/metallic-geyser-gas-inner.png",
         frame_count = 47,
         line_length = 16,
         width = 40,
         height = 84,
         animation_speed = 0.4,
         shift = util.by_pixel(-4, -30),
         scale = 1,
         tint = util.multiply_color({0.976, 0.671, 1}, 0.1)
      }
    }
  }
end

function chimney_metallic_stateless_visualisation_faded(position)
  return
  {
    -- expanded 2 animation layers into 2 visualisations to demo multiple visualisations
    {
      count = 1,
      render_layer = "smoke",
      offset_x = position[1],
      offset_y = position[2],
      animation =
      {
        filename = "__planetaris-unbounded-assets__/graphics/entity/metallic-geyser/metallic-geyser-gas-outer.png",
        frame_count = 47,
        line_length = 16,
        width = 90,
        height = 188,
        animation_speed = 0.3,
        shift = util.by_pixel(-6, -89),
        scale = 1,
        tint = util.multiply_color({0.976, 0.671, 1}, 0.08)
      }
    },
    {
      count = 1,
      render_layer = "smoke",
      offset_x = position[1],
      offset_y = position[2],
      animation =
      {
         filename = "__planetaris-unbounded-assets__/graphics/entity/metallic-geyser/metallic-geyser-gas-inner.png",
         frame_count = 47,
         line_length = 16,
         width = 40,
         height = 84,
         animation_speed = 0.4,
         shift = util.by_pixel(-4, -30),
         scale = 1,
         tint = util.multiply_color({0.976, 0.671, 1}, 0.1)


      }
    }
  }
end
data:extend{
  {
    type = "noise-function",
    name = "uneven_select_range",
    parameters = {"input", "from", "from_slope", "to", "to_slope"},
    expression = "min(0, (input - from) / from_slope, (to - input) / to_slope)"
  },

  ---- VEGETATION
  {
    type = "noise-expression",
    name = "hyarion_red_small_crystal",
    expression = "uneven_select_range(hyarion_elev, 90, 30, 300, 200)\z
                  - 1.5 + 2 * moisture - aux"
  },
  {
    type = "noise-expression",
    name = "hyarion_yellow_small_crystal",
    expression = "uneven_select_range(hyarion_elev, 70, 30, 400, 300)\z
                  - 3 + 3 * moisture - 0.5 * aux + vulcanus_decorative_knockout"
  },
  {
    type = "noise-expression",
    name = "hyarion_blue_small_crystal",
    expression = "min(0.5, uneven_select_range(hyarion_elev, 90, 30, 300, 200)\z
                           - 1.5 + 2 * moisture - aux)"
  },

  {
    type = "noise-expression",
    name = "hyarion_small_crystal",
    expression = "uneven_select_range(hyarion_elev, 110, 20, 450, 300)\z
                  - 2.2 + 2 * moisture + aux"
  },

  ---- CHIMNEYS
  {
    type = "noise-expression",
    name = "hyarion_chimney_main",
    expression = "2 * (hyarion_mountains_biome - 0.5) - 2.3 + 1.2 * min(aux, 1 - moisture) + vulcanus_rock_noise - 0.5 * vulcanus_decorative_knockout"
  },
  {
    type = "noise-expression",
    name = "hyarion_chimney_sulfuric",
    expression = "-random_penalty_between(0, 1, 1) + 10 * min(0.2, clamp(hyarion_chimney_main, 0.017, 0.05)) * (hyarion_iron_region > 0)"
  },
  {
    type = "noise-expression",
    name = "hyarion_chimney_faded",
    expression = "-random_penalty_between(0, 1, 1) + 7 * min(0.2, hyarion_chimney_main * (hyarion_iron_region < 0.3))"
  },
  {
    type = "noise-expression",
    name = "hyarion_chimney_cold",
    expression = "-random_penalty_between(0, 1, 1) + 7 * min(0.2, hyarion_chimney_main * (hyarion_iron_region < 0.01))"
  },
  {
    type = "noise-expression",
    name = "hyarion_chimney_truncated",
    expression = "max( min(0.05, 2 * (hyarion_mountains_biome - 0.5)\z
                           - 2.1 + 1.2 * min(aux, 1 - moisture) + vulcanus_rock_noise - 0.5 * vulcanus_decorative_knockout),\z
                       min(0.05, 2 * (hyarion_valley_biome - 0.5)\z
                           - 2.3 + 1.2 * min(aux, 1 - moisture) + vulcanus_rock_noise - 0.5 * vulcanus_decorative_knockout))"
  },

  ---- Metallic
  {
    type = "noise-expression",
    name = "vulcanus_metallic_puddle",
    expression = "min(0.2, min(0.5, 3 * (hyarion_iron_region + 0.1)) - 0.6 - 0.6 * vulcanus_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "vulcanus_metallic_puddle_small",
    expression = "min(0.25, min(0.5, 3 * (hyarion_iron_region + 0.15)) - 0.6 - 0.6 * vulcanus_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "vulcanus_metallic_stain",
    expression = "min(0.2, min(0.5, 3 * (hyarion_iron_region + 0.1)) - 0.8 - 0.6 * vulcanus_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "vulcanus_metallic_stain_small",
    expression = "max(min(0.1, hyarion_chimney_main),\z
                      min(0.2, min(0.5, 3 * (hyarion_iron_region + 0.2)) - 0.4 + 0.6 * vulcanus_decorative_knockout))"
  },
  {
    type = "noise-expression",
    name = "vulcanus_small_sulfur_rock",
    expression = "min(0.4, min(0.5, 3 * (hyarion_iron_region + 0.1)) - 0.7 + 0.6 * vulcanus_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "vulcanus_sulfur_rock_cluster",
    expression = "min(0.1, min(0.5, 3 * (hyarion_iron_region)) - 0.6 + 0.6 * vulcanus_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "vulcanus_sulfur_rock_tiny",
    expression = "min(0.5, min(0.5, 3 * (hyarion_iron_region + 0.2)) - 0.4 + 0.6 * vulcanus_decorative_knockout)"
  },

  ---- CLACITE
  {
    type = "noise-expression",
    name = "hyarion_carbon_stain",
    expression = "min(0.2, min(0.5, 3 * (hyarion_carbon_region + 0.1)) - 0.8 - 0.6 * vulcanus_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "hyarion_carbon_stain_small",
    expression = "min(0.2, min(0.5, 3 * (hyarion_carbon_region + 0.2)) - 0.4 + 0.6 * vulcanus_decorative_knockout)"
  },

  ---- ROCKS
  -- reduce density in ashlands
  {
    type = "noise-expression",
    name = "hyarion_rock_huge",
    expression = "min(0.2 * (1 - 0.75 * hyarion_valley_biome), - 1.2 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + vulcanus_rock_noise + 0.5 * vulcanus_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "hyarion_rock_big",
    expression = "min(0.2 * (1 - 0.5 * hyarion_valley_biome), - 1.0 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + vulcanus_rock_noise + 0.5 * vulcanus_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "hyarion_rock_medium",
    expression = "min(0.5 * (1 - 0.5 * hyarion_valley_biome), - 0.8 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + vulcanus_rock_noise + 0.5 * vulcanus_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "hyarion_rock_cluster",
    expression = "min(0.2 * (1 - 0.5 * hyarion_valley_biome), - 0.7 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + vulcanus_rock_noise + 0.5 * vulcanus_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "hyarion_rock_small",
    expression = "min(0.6 * (1 - 0.5 * hyarion_valley_biome), - 0.6 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + vulcanus_rock_noise + 0.5 * vulcanus_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "hyarion_rock_tiny",
    expression = "min(0.75 * (1 - 0.5 * hyarion_valley_biome), - 0.5 + 1.2 * min(aux, -0.1 + 1.1 * moisture) + vulcanus_rock_noise + 0.5 * vulcanus_decorative_knockout)"
  },

  ---- DECALS
  {
    type = "noise-expression",
    name = "vulcanus_crack_decal_large",
    expression = "min(0.2, range_select_base(hyarion_elev, 20, 50, 1, -10, 1) - 0.1 - 0.25 * aux + 0.25 * (moisture - 0.6) + 0.5 * vulcanus_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "vulcanus_crack_decal",
    expression = "min(0.2, range_select_base(hyarion_elev, 50, 90, 1, -10, 1) - 0.1 - 0.25 * aux + 0.25 * (moisture - 0.6) + 0.5 * vulcanus_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "vulcanus_crack_decal_huge_warm",
    expression = "hyarion_quartzlands_biome * min(0.3, range_select_base(hyarion_elev, 0, 10, 1, -10, 1) - 0.1 - 0.25 * aux + 0.25 * (moisture - 0.6) + 0.5 * vulcanus_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "vulcanus_crack_decal_warm",
    expression = "hyarion_quartzlands_biome * min(0.2, range_select_base(hyarion_elev, 10, 30, 1, -10, 1) - 0.1 - 0.25 * aux + 0.25 * (moisture - 0.6) + 0.5 * vulcanus_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "hyarion_rock_decal_large",
    expression = "min(0.1, range_select_base(hyarion_elev, 20, 50, 1, -10, 1) - 0.6 + 0.25 * aux + 0.25 * (moisture - 0.6) + 0.5 * vulcanus_decorative_knockout)"
  },
  {
    type = "noise-expression",
    name = "pumice_relief_decal", -- everywhere non-sand
    expression = "(aux + moisture - 1) * 0.01"
  },
  {
    type = "noise-expression",
    name = "waves_decal", -- everywhere sand
    expression = "(1 - aux - moisture) * 0.05 * place_every_n(5.7,5.7,1,1) * hyarion_valley_biome"
  },

  {
    type = "noise-expression",
    name = "vulcanus_sand_decal",
    expression = "(1 - aux - moisture) * 0.05 * hyarion_quartzlands_biome"
  },
  {
    type = "noise-expression",
    name = "vulcanus_dune_decal",
    expression = "(1 - aux - moisture) * 0.05 * hyarion_valley_biome"
  },

  {
    type = "noise-expression",
    name = "crater_small",
    expression = "min(0.1, 0.3 - vulcanus_rock_noise - aux)"
  },
  {
    type = "noise-expression",
    name = "crater_large",
    expression = "min(0.15, (0.2 - vulcanus_rock_noise - aux) * place_every_n(3,3,0,0))"
  },
  {
    type = "noise-expression",
    name = "crater_cliff",
    expression = "0.5 * (vulcanus_rock_noise + 0.5 * aux - 0.5 * moisture) * (1 - max(hyarion_quartzlands_biome,hyarion_valley_biome)) * place_every_n(21,21,0,0)"
  },

  --- nauvis plants

  --- SMALL CRYSTALS
  {
    name = "hyarion-red-crystal",
    type = "optimized-decorative",
    order = "b[decorative]-a[grass]-x[crystal]",
    collision_box = {{-1, -1}, {1, 1}},
    grows_through_rail_path = true,
    walking_sound = base_tile_sounds.walking.hairy_grass,
    trigger_effect = decorative_trigger_effects.green_hairy_grass(),
    autoplace =
    {
      order = "e[vegetation]-b[grass]-b[hairy]-a[green]",
      probability_expression = "hyarion_red_small_crystal"
    },
    pictures =
    {
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-1.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(-1.25, -3.5),
        scale = 0.5,
        tint = red_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-2.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(6.25, -7),
        scale = 0.5,
        tint = red_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-3.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(3.5, 0.25),
        scale = 0.5,
        tint = red_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-4.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(10.25, -11.5),
        scale = 0.5,
        tint = red_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-5.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(4, 3.25),
        scale = 0.5,
        tint = red_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-6.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(4.25, -4.25),
        scale = 0.5,
        tint = red_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-7.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(2.25, 8.25),
        scale = 0.5,
        tint = red_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-8.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(0, -2.75),
        scale = 0.5,
        tint = red_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-9.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(1.5, -2.75),
        scale = 0.5,
        tint = red_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-10.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(5.25, -2.5),
        scale = 0.5,
        tint = red_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-11.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(0, -7.25),
        scale = 0.5,
        tint = red_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-12.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(3.25, -1),
        scale = 0.5,
        tint = red_crystal_tint,
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-13.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(3.25, -1),
        scale = 0.5,
        tint = red_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-14.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(3.25, -1),
        scale = 0.5,
        tint = red_crystal_tint,        
      },
    }
  },
  {
    name = "hyarion-yellow-crystal",
    type = "optimized-decorative",
    order = "b[decorative]-a[grass]-x[crystal]",
    collision_box = {{-1, -1}, {1, 1}},
    grows_through_rail_path = true,
    render_layer = "decorative",
    walking_sound = base_tile_sounds.walking.hairy_grass,
    trigger_effect = decorative_trigger_effects.brown_hairy_grass(),
    autoplace = {
      order = "e[vegetation]-b[grass]-b[hairy]-b[brown]",
      probability_expression = "hyarion_yellow_small_crystal"
    },
    pictures =
    {
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-1.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(-1.25, -3.5),
        scale = 0.5,
        tint = yellow_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-2.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(6.25, -7),
        scale = 0.5,
        tint = yellow_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-3.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(3.5, 0.25),
        scale = 0.5,
        tint = yellow_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-4.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(10.25, -11.5),
        scale = 0.5,
        tint = yellow_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-5.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(4, 3.25),
        scale = 0.5,
        tint = yellow_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-6.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(4.25, -4.25),
        scale = 0.5,
        tint = yellow_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-7.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(2.25, 8.25),
        scale = 0.5,
        tint = yellow_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-8.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(0, -2.75),
        scale = 0.5,
        tint = yellow_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-9.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(1.5, -2.75),
        scale = 0.5,
        tint = yellow_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-10.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(5.25, -2.5),
        scale = 0.5,
        tint = yellow_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-11.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(0, -7.25),
        scale = 0.5,
        tint = yellow_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-12.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(3.25, -1),
        scale = 0.5,
        tint = yellow_crystal_tint,
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-13.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(3.25, -1),
        scale = 0.5,
        tint = yellow_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-14.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(3.25, -1),
        scale = 0.5,
        tint = yellow_crystal_tint,        
      },
    }
  },
  --- Blue crystal
  {
    name = "hyarion-orange-crystal",
    type = "optimized-decorative",
    order = "b[decorative]-a[grass]-x[crystal]",
    collision_box = {{-1, -1}, {1, 1}},
    grows_through_rail_path = true,
    walking_sound = base_tile_sounds.walking.carpet_grass,
    trigger_effect = decorative_trigger_effects.brown_carpet_grass(),
    autoplace = {
      order = "e[vegetation]-b[grass]-a[carpet]",
      probability_expression = "hyarion_blue_small_crystal"
    },
    pictures =
    {
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-1.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(-1.25, -3.5),
        scale = 0.5,
        tint = orange_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-2.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(6.25, -7),
        scale = 0.5,
        tint = orange_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-3.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(3.5, 0.25),
        scale = 0.5,
        tint = orange_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-4.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(10.25, -11.5),
        scale = 0.5,
        tint = orange_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-5.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(4, 3.25),
        scale = 0.5,
        tint = orange_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-6.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(4.25, -4.25),
        scale = 0.5,
        tint = orange_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-7.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(2.25, 8.25),
        scale = 0.5,
        tint = orange_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-8.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(0, -2.75),
        scale = 0.5,
        tint = orange_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-9.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(1.5, -2.75),
        scale = 0.5,
        tint = orange_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-10.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(5.25, -2.5),
        scale = 0.5,
        tint = orange_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-11.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(0, -7.25),
        scale = 0.5,
        tint = orange_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-12.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(3.25, -1),
        scale = 0.5,
        tint = orange_crystal_tint,
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-13.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(3.25, -1),
        scale = 0.5,
        tint = orange_crystal_tint,        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-14.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(3.25, -1),
        scale = 0.5,
        tint = orange_crystal_tint,        
      },
    }
  },
  --- Small crystal
  {
    name = "hyarion-small-crystal",
    type = "optimized-decorative",
    order = "b[decorative]-a[grass]-x[crystal]",
    collision_box = {{-1, -1}, {1, 1}},
    render_layer = "object",
    walking_sound = base_tile_sounds.walking.big_bush,
    trigger_effect = decorative_trigger_effects.red_pita(),
    autoplace = {
      order = "e[vegetation]-a[shrub]-a[pita]",
      probability_expression = "hyarion_small_crystal"
    },
    pictures =
    {
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-1.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(-1.25, -3.5),
        scale = 0.5,
        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-2.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(6.25, -7),
        scale = 0.5,
        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-3.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(3.5, 0.25),
        scale = 0.5,
        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-4.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(10.25, -11.5),
        scale = 0.5,
        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-5.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(4, 3.25),
        scale = 0.5,
        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-6.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(4.25, -4.25),
        scale = 0.5,
        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-7.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(2.25, 8.25),
        scale = 0.5,
        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-8.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(0, -2.75),
        scale = 0.5,
        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-9.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(1.5, -2.75),
        scale = 0.5,
        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-10.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(5.25, -2.5),
        scale = 0.5,
        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-11.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(0, -7.25),
        scale = 0.5,
        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-12.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(3.25, -1),
        scale = 0.5,
        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-13.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(3.25, -1),
        scale = 0.5,
        
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal/small-crystal-14.png",
        priority = base_decorative_sprite_priority,
        width = 256,
        height = 256,
        shift = util.by_pixel(3.25, -1),
        scale = 0.5,
        
      },
    }
  },
  ---ROCKY DECALS
  {
    name = "hyarion-rock-decal-large",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]-b[sand]",
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    collision_mask = {layers={water_tile=true, doodad=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer -1,
    autoplace = {
      order = "d[ground-surface]-f[cracked-rock]-b[cold]",
      probability_expression = "hyarion_rock_decal_large"
    },
    pictures = get_decal_pictures("__planetaris-unbounded-assets__/graphics/decorative/hyarion-rock-decal/hyarion-rock-decal-", "large-", 256, 5)
  },
  --- CRACK DECALS
  {
    name = "hyarion-crack-decal",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]-b[sand]",
    collision_box = {{-1, -1}, {1, 1}},
    collision_mask = {layers={water_tile=true, doodad=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer = decal_tile_layer -5,
    walking_sound = base_tile_sounds.walking.pebble,
    autoplace = {
      order = "d[ground-surface]-g[cracks]-b[cold]-b[small]",
      probability_expression = "vulcanus_crack_decal"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-cracks-cold/vulcanus-cracks-cold-", "large-", 128, 20)
  },
  --- LARGE CRACK DECALS
  {
    name = "hyarion-crack-decal-large",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]-b[sand]",
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer -4,
    walking_sound = base_tile_sounds.walking.pebble,
    autoplace = {
      order = "d[ground-surface]-g[cracks]-b[cold]-a[large]",
      probability_expression = "vulcanus_crack_decal_large"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-cracks-cold/vulcanus-cracks-cold-", "huge-", 256, 20)
  },
  --- HUGE WARM CRACK DECALS
  {
    name = "hyarion-crack-decal-huge-warm",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]-b[sand]",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer -3,
    walking_sound = base_tile_sounds.walking.pebble,
    autoplace =
    {
      order = "d[ground-surface]-g[cracks]-a[warm]-a[large]",
      probability_expression = "vulcanus_crack_decal_huge_warm"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-cracks/vulcanus-cracks-hot-", "huge-", 256, 20)
  },
  --- WARM CRACK DECALS
  {
    name = "hyarion-crack-decal-warm",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]-b[sand]",
    collision_box = {{-.8, -.8}, {.8, .8}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer -3,
    walking_sound = base_tile_sounds.walking.pebble,
    autoplace =
    {
      order = "d[ground-surface]-g[cracks]-a[warm]-b[small]",
      probability_expression = "vulcanus_crack_decal_warm"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-cracks/vulcanus-cracks-hot-", "large-", 128, 18)
  },
  --- CARBON STAINS
  {
    name = "hyarion-carbon-stain",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]",
    collision_box = {{-3, -3}, {3, 3}},
    collision_mask = {layers={doodad=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer -6,
    autoplace = {
      order = "d[ground-surface]-c[stain]-c[calcite-large]",
      probability_expression = "hyarion_carbon_stain"
    },
    pictures = get_decal_pictures("__planetaris-unbounded-assets__/graphics/decorative/carbon-stain/carbon-stain-", "", 512, 18)
  },
  --- SPOTTY CARBON STAINS
  {
    name = "hyarion-carbon-stain-small",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]",
    collision_box = {{-3, -3}, {3, 3}},
    collision_mask = {layers={doodad=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer -6,
    autoplace = {
      order = "d[ground-surface]-c[stain]-b[calcite]-b[small]",
      probability_expression = "hyarion_carbon_stain_small"
    },
    pictures = get_decal_pictures("__planetaris-unbounded-assets__/graphics/decorative/carbon-stain/carbon-stain-spotty-", "", 512, 18)
  },
  --- SULFUR STAINS
  {
    name = "hyarion-metallic-stain",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]",
    collision_box = {{-3, -3}, {3, 3}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer -6,
    autoplace = {
      order = "d[ground-surface]-c[stain]-b[calcite]-a[large]",
      probability_expression = "vulcanus_metallic_stain"
    },
    pictures = get_decal_pictures("__planetaris-unbounded-assets__/graphics/decorative/metallic-stain/metallic-stain-", "", 512,13)
  },
  --- SPOTTY SULFUR STAINS
  {
    name = "hyarion-metallic-stain-small",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]",
    collision_box = {{-3, -3}, {3, 3}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer -6,
    autoplace = {
      order = "d[ground-surface]-c[stain]-a[sulfur]-b[small]",
      probability_expression = "vulcanus_metallic_stain_small"
    },
    pictures = get_decal_pictures("__planetaris-unbounded-assets__/graphics/decorative/metallic-stain/metallic-stain-spotty-", "", 512, 21)
  },
  --- metallic-puddle
  {
    name = "hyarion-metallic-puddle",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]",
    collision_box = {{-2, -2}, {2, 2}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer = 254,
    walking_sound = base_tile_sounds.walking.oil({}),
    autoplace =
    {
      order = "d[ground-surface]-a[puddle]-a[large]",
      placement_density = 2,
      probability_expression = "vulcanus_metallic_puddle"
    },
    pictures = get_decal_pictures("__planetaris-unbounded-assets__/graphics/decorative/metallic-puddle/metallic-puddle-", "", 384, 8)
  },
  --- metallic-puddle-SMALL
  {
    name = "hyarion-metallic-puddle-small",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]",
    collision_box = {{-1, -1}, {1, 1}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer = 254,
    walking_sound = base_tile_sounds.walking.oil({}),
    autoplace =
    {
      order = "d[ground-surface]-a[puddle]-b[small]",
      placement_density = 2,
      probability_expression = "vulcanus_metallic_puddle_small"
    },
    pictures = get_decal_pictures("__planetaris-unbounded-assets__/graphics/decorative/metallic-puddle/metallic-puddle-small-", "", 192, 4)
  },
  --- SMALL CRATERS
  {
    name = "hyarion-crater-small",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]",
    collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer,
    walking_sound = base_tile_sounds.walking.pebble,
    autoplace = {
      order = "d[ground-surface]-e[crater]-a[small]",
      probability_expression = "crater_small"
    },
    pictures = get_decal_pictures("__planetaris-unbounded-assets__/graphics/decorative/hyarion-crater/hyarion-crater-", "", 128, 20)
  },
  --- LARGE CRATERS
  {
    name = "hyarion-crater-large",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]",
    collision_box = {{-2.5, -2.5}, {2.5, 2.5}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer =  decal_tile_layer,
    walking_sound = base_tile_sounds.walking.pebble,
    autoplace = {
      order = "d[ground-surface]-e[crater]-a[large]",
      probability_expression = "crater_large"
    },
    pictures = get_decal_pictures("__planetaris-unbounded-assets__/graphics/decorative/hyarion-crater/hyarion-crater-", "huge-", 512, 14)
  },
  --- ROCKY DETAIL
  {
    name = "hyarion-pumice-relief-decal",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]",
    collision_box = {{-5, -5}, {5, 5}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer = 220,
    walking_sound = base_tile_sounds.walking.pebble,
    autoplace = {
      order = "d[ground-surface]-d[relief]-b[rocky]",
      probability_expression = "pumice_relief_decal"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/vulcanus-relief-decal/vulcanus-pumice-relief-", "", 1024, 19)
  },
  --- SAND DUNES
  {
    name = "hyarion-sand-decal",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]-b[sand]",
    collision_box = {{-1, -1}, {1, 1}},
    collision_mask = {layers={water_tile=true, doodad=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer = decal_tile_layer,
    autoplace = {
      order = "d[ground-surface]-h[dune]-b[patch]",
      probability_expression = "vulcanus_sand_decal"
    },
    pictures = get_decal_pictures("__planetaris-unbounded-assets__/graphics/decorative/hyarion-sand-decal/hyarion-sand-decal-", "", 256, 23)
  },
  {
    name = "hyarion-dune-decal",
    type = "optimized-decorative",
    order = "a[fulgora]-b[decorative]",
    collision_box = {{-5, -5}, {5, 5}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer = 220,
    autoplace = {
      order = "d[ground-surface]-h[dune]-a[relief]",
      probability_expression = "vulcanus_dune_decal"
    },
    pictures = get_decal_pictures("__planetaris-unbounded-assets__/graphics/decorative/hyarion-dune-decal/hyarion-dune-decal-", "", 512, 20)
  },
  --- WAVES
  {
    name = "hyarion-waves-decal",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]",
    collision_box = {{-8, -8}, {8, 8}},
    collision_mask = {layers={water_tile=true}, colliding_with_tiles_only=true},
    render_layer = "decals",
    tile_layer = 220,
    autoplace = {
      order = "d[ground-surface]-d[relief]-a[waves]",
      probability_expression = "waves_decal"
    },
    pictures = {
      {
        filename =  "__planetaris-unbounded-assets__/graphics/decorative/hyarion-waves-relief/waves-01.png",
        priority = base_decorative_sprite_priority,
        width =  1387,
        height =  1387,
        scale = 0.5
      },
      {
        filename =  "__planetaris-unbounded-assets__/graphics/decorative/hyarion-waves-relief/waves-02.png",
        priority = base_decorative_sprite_priority,
        width =  1387,
        height =  1387,
        scale = 0.5
      },
      {
        filename =  "__planetaris-unbounded-assets__/graphics/decorative/hyarion-waves-relief/waves-03.png",
        priority = base_decorative_sprite_priority,
        width =  1387,
        height =  1387,
        scale = 0.5
      },
      {
        filename =  "__planetaris-unbounded-assets__/graphics/decorative/hyarion-waves-relief/waves-04.png",
        priority = base_decorative_sprite_priority,
        width =  1387,
        height =  1387,
        scale = 0.5
      },
      {
        filename =  "__planetaris-unbounded-assets__/graphics/decorative/hyarion-waves-relief/waves-05.png",
        priority = base_decorative_sprite_priority,
        width =  1387,
        height =  1387,
        scale = 0.5
      },
      {
        filename =  "__planetaris-unbounded-assets__/graphics/decorative/hyarion-waves-relief/waves-06.png",
        priority = base_decorative_sprite_priority,
        width =  1387,
        height =  1387,
        scale = 0.5
      },
      {
        filename =  "__planetaris-unbounded-assets__/graphics/decorative/hyarion-waves-relief/waves-07.png",
        priority = base_decorative_sprite_priority,
        width =  1387,
        height =  1387,
        scale = 0.5
      },
      {
        filename =  "__planetaris-unbounded-assets__/graphics/decorative/hyarion-waves-relief/waves-08.png",
        priority = base_decorative_sprite_priority,
        width =  1387,
        height =  1387,
        scale = 0.5
      }
    }
  },
  --- CHIMNEY
  {
    name = "hyarion-chimney",
    type = "simple-entity",
    flags = {"placeable-neutral", "placeable-off-grid"},
    icon = "__planetaris-unbounded-assets__/graphics/icons/hyarion-chimney.png",
    subgroup = "grass",
    order = "b[decorative]-l[rock]-g[hyarion]-e[chimney]",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.3, -1.3}, {1.3, 1.3}},
    drawing_box_vertical_extension = 2,
    damaged_trigger_effect = hit_effects.rock(),
    render_layer = "object",
    collision_mask = {layers={item=true, object=true, player=true, water_tile=true}},
    max_health = 500,
    autoplace =
    {
      order = "a[landscape]-c[chimney]-a[full]-a",
      probability_expression = "hyarion_chimney_sulfuric"
    },
    dying_trigger_effect = decorative_trigger_effects.big_rock(),
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 2,
      results =
      {
        {type = "item", name = "carbon", amount_min = 9, amount_max = 15},
        {type = "item", name = "planetaris-metallic-ore", amount_min = 0, amount_max = 5}
      }
    },
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    map_color = {129, 105, 78},
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    working_sound =
    {
      sound =
      {
        category = "world-ambient", variations = sound_variations("__space-age__/sound/world/decoratives/chimney-vent", 1, 0.3),
        advanced_volume_control =
        {
          fades = {fade_in = {curve_type = "S-curve", from = {control = 0.4, volume_percentage = 0}, to = {1.2, 100.0}}}
        },
        audible_distance_modifier = 0.7,
      },
      max_sounds_per_prototype = 2,
    },
    impact_category = "stone",
    render_layer = "object",
    pictures =
    {
      layers =
        {
          util.sprite_load("__planetaris-unbounded-assets__/graphics/decorative/hyarion-chimney/metallic-chimney-upper", { scale = 0.5, variation_count = 3, multiply_shift = 0.5, shift = {5, 0} }),
          util.sprite_load("__planetaris-unbounded-assets__/graphics/decorative/hyarion-chimney/metallic-chimney-shadow", { scale = 0.5, variation_count = 3, multiply_shift = 0.5, draw_as_shadow=true,shift = {5, 0} }),
        }
    },
    lower_render_layer = "floor",
    lower_pictures = util.sprite_load("__planetaris-unbounded-assets__/graphics/decorative/hyarion-chimney/metallic-chimney-lower", { scale = 0.5, variation_count = 3, multiply_shift = 0.5, shift = {5, 0} }),

    stateless_visualisation_variations =
    {
      chimney_metallic_stateless_visualisation_tinted({0, -3}), --tinted
      chimney_metallic_stateless_visualisation_tinted({-0.75, -2.75}), --tinted
      chimney_metallic_stateless_visualisation_tinted({0.55, -3.1}), --tinted
    },
  },
  --- CHIMNEY FADED
  {
    name = "hyarion-chimney-faded",
    type = "simple-entity",
    flags = {"placeable-neutral", "placeable-off-grid"},
    icon = "__planetaris-unbounded-assets__/graphics/icons/hyarion-chimney-faded.png",
    subgroup = "grass",
    order = "b[decorative]-l[rock]-g[hyarion]-g[chimney-faded]",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.3, -1.3}, {1.3, 1.3}},
    drawing_box_vertical_extension = 2,
    damaged_trigger_effect = hit_effects.rock(),
    render_layer = "object",
    collision_mask = {layers={item=true, object=true, player=true, water_tile=true}},
    max_health = 500,
    autoplace =
    {
      order = "a[landscape]-c[chimney]-a[full]-b",
      probability_expression = "hyarion_chimney_faded"
    },
    dying_trigger_effect = decorative_trigger_effects.big_rock(),
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 2,
      results =
      {
        {type = "item", name = "carbon", amount_min = 9, amount_max = 15},
        {type = "item", name = "planetaris-metallic-ore", amount_min = 0, amount_max = 5}
      }
    },
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    map_color = {129, 105, 78},
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    impact_category = "stone",
    render_layer = "object",
    pictures =
    {
      layers =
        {
          util.sprite_load("__planetaris-unbounded-assets__/graphics/decorative/hyarion-chimney/metallic-chimney-faded-upper", { scale = 0.5, variation_count = 5, multiply_shift = 0.5, shift = {5, 0} }),
          util.sprite_load("__planetaris-unbounded-assets__/graphics/decorative/hyarion-chimney/metallic-chimney-faded-shadow", { scale = 0.5, variation_count = 5, multiply_shift = 0.5, draw_as_shadow=true,shift = {5, 0} }),
        }
    },
    lower_render_layer = "floor",
    lower_pictures = util.sprite_load("__planetaris-unbounded-assets__/graphics/decorative/hyarion-chimney/metallic-chimney-faded-lower", { scale = 0.5, variation_count = 5, multiply_shift = 0.5, shift = {5, 0} }),

    stateless_visualisation_variations =
    {
      chimney_metallic_stateless_visualisation_faded({0.3, -3.5}), --faded
      chimney_metallic_stateless_visualisation_faded({-0.3, -2.3}), --faded
      chimney_metallic_stateless_visualisation_faded({-0.5, -1.4}), --faded
      chimney_metallic_stateless_visualisation_faded({0.2, -3.8}), --faded
      chimney_metallic_stateless_visualisation_faded({0.2, -2}), --faded

    },
  },
  --- CHIMNEY COLD
  {
    name = "hyarion-chimney-cold",
    type = "simple-entity",
    flags = {"placeable-neutral", "placeable-off-grid"},
    icon = "__planetaris-unbounded-assets__/graphics/icons/hyarion-chimney-cold.png",
    subgroup = "grass",
    order = "b[decorative]-l[rock]-g[hyarion]-f[chimney-cold]",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.3, -1.3}, {1.3, 1.3}},
    drawing_box_vertical_extension = 2,
    damaged_trigger_effect = hit_effects.rock(),
    render_layer = "object",
    collision_mask = {layers={item=true, object=true, player=true, water_tile=true}},
    max_health = 500,
    autoplace =
    {
      order = "a[landscape]-c[chimney]-a[full]-c",
      probability_expression = "hyarion_chimney_cold"
    },
    dying_trigger_effect = decorative_trigger_effects.big_rock(),
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 2,
      results =
      {
        {type = "item", name = "carbon", amount_min = 9, amount_max = 15},
        {type = "item", name = "planetaris-metallic-ore", amount_min = 0, amount_max = 5}
      }
    },
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    map_color = {129, 105, 78},
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    impact_category = "stone",
    render_layer = "object",
    pictures =
    {
      layers =
        {
          util.sprite_load("__planetaris-unbounded-assets__/graphics/decorative/hyarion-chimney/cold-chimney-upper", { scale = 0.5, variation_count = 3, multiply_shift = 0.5, shift = {5, 0} }),
          util.sprite_load("__planetaris-unbounded-assets__/graphics/decorative/hyarion-chimney/cold-chimney-shadow", { scale = 0.5, variation_count = 3, multiply_shift = 0.5, draw_as_shadow=true,shift = {5, 0} }),
        }
    },
    lower_render_layer = "floor",
    lower_pictures = util.sprite_load("__planetaris-unbounded-assets__/graphics/decorative/hyarion-chimney/cold-chimney-lower", { scale = 0.5, variation_count = 3, multiply_shift = 0.5, shift = {5, 0} }),

    stateless_visualisation_variations =
    {
      chimney_metallic_stateless_visualisation({-0.1, -3}), --cold
      chimney_metallic_stateless_visualisation({-0.75, -2.4}), --cold
      chimney_metallic_stateless_visualisation({0.6, -4.25}), --cold
    },
  },
  --- SHORT CHIMNEY
  {
    name = "hyarion-chimney-short",
    type = "simple-entity",
    flags = {"placeable-neutral", "placeable-off-grid"},
    icon = "__planetaris-unbounded-assets__/graphics/icons/hyarion-chimney-short.png",
    subgroup = "grass",
    order = "b[decorative]-l[rock]-g[hyarion]-c[chimney-short]",
    collision_box = {{-0.9, -0.7}, {0.9, 0.7}},
    selection_box = {{-1, -0.8}, {1, 0.8}},
    collision_mask = {layers={item=true, object=true, player=true, water_tile=true}},
    damaged_trigger_effect = hit_effects.rock(),
    render_layer = "object",
    max_health = 300,
    autoplace =
    {
      order = "a[landscape]-c[chimney]-b[truncated]-e",
      probability_expression = "hyarion_chimney_faded / 2"
    },
    dying_trigger_effect = decorative_trigger_effects.big_rock(),
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 2,
      results = {{type = "item", name = "carbon", amount_min = 9, amount_max = 15}}
    },
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    map_color = {129, 105, 78},
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    impact_category = "stone",
    pictures =
    {
      layers =
        {
          util.sprite_load("__planetaris-unbounded-assets__/graphics/decorative/hyarion-chimney/metallic-chimney-short-upper", { scale = 0.5, variation_count = 7,multiply_shift=0.5}),
          util.sprite_load("__planetaris-unbounded-assets__/graphics/decorative/hyarion-chimney/metallic-chimney-short-shadow", { scale = 0.5, variation_count = 7,multiply_shift=0.5,draw_as_shadow=true}),
        }
    },
    lower_pictures = util.sprite_load("__planetaris-unbounded-assets__/graphics/decorative/hyarion-chimney/metallic-chimney-short-lower", { scale = 0.5, variation_count = 7,multiply_shift=0.5}),
    lower_render_layer = "floor",
  },
  --- TRUNCATED CHIMNEY
  {
    name = "hyarion-chimney-truncated",
    type = "simple-entity",
    flags = {"placeable-neutral", "placeable-off-grid"},
    icon = "__planetaris-unbounded-assets__/graphics/icons/hyarion-chimney-truncated.png",
    subgroup = "grass",
    order = "b[decorative]-l[rock]-g[hyarion]-d[chimney-truncated]",
    collision_box = {{-0.9, -0.7}, {0.9, 0.7}},
    selection_box = {{-1, -0.8}, {1, 0.8}},
    collision_mask = {layers={item=true, object=true, player=true, water_tile=true}},
    damaged_trigger_effect = hit_effects.rock(),
    render_layer = "object",
    max_health = 300,
    autoplace = {
      order = "a[landscape]-b[chimney]-b[truncated]-d",
      probability_expression = "hyarion_chimney_truncated"
    },
    dying_trigger_effect = decorative_trigger_effects.big_rock(),
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 2,
      results = {{type = "item", name = "carbon", amount_min = 9, amount_max = 15}}
    },
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    map_color = {129, 105, 78},
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    impact_category = "stone",
    pictures =
    {
      layers =
        {
          util.sprite_load("__planetaris-unbounded-assets__/graphics/decorative/hyarion-chimney/metallic-chimney-truncated-upper", { scale = 0.5, variation_count = 6,multiply_shift=0.5}),
          util.sprite_load("__planetaris-unbounded-assets__/graphics/decorative/hyarion-chimney/metallic-chimney-truncated-shadow", { scale = 0.5, variation_count = 6,multiply_shift=0.5,draw_as_shadow=true}),
        }
    },
    lower_pictures = util.sprite_load("__planetaris-unbounded-assets__/graphics/decorative/hyarion-chimney/metallic-chimney-truncated-lower", { scale = 0.5, variation_count = 6,multiply_shift=0.5}),
    lower_render_layer = "floor",
  },
  --- TINTABLE ROCKS
  --- BIG ROCKS
  {
    name = "hyarion-huge-volcanic-rock",
    type = "simple-entity",
    flags = {"placeable-neutral", "placeable-off-grid"},
    icon = "__space-age__/graphics/icons/huge-volcanic-rock.png",
    subgroup = "grass",
    order = "b[decorative]-l[rock]-g[hyarion]-b[huge-volcanic-rock]",
    collision_box = {{-1.5, -1.1}, {1.5, 1.1}},
    selection_box = {{-1.7, -1.3}, {1.7, 1.3}},
    damaged_trigger_effect = hit_effects.rock(),
    dying_trigger_effect = decorative_trigger_effects.huge_rock(),
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 3,
      results =
      {
        {type = "item", name = "carbon", amount_min = 9, amount_max = 15},
        {type = "item", name = "planetaris-raw-quartz", amount_min = 10, amount_max = 15}
      },
    },
    map_color = {129, 105, 78},
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    impact_category = "stone",
    render_layer = "object",
    max_health = 2000,
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    autoplace = {
      order = "a[landscape]-c[rock]-a[huge]",
      probability_expression = "hyarion_rock_huge"
    },
    pictures =
    {
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/huge-crystal-rock/huge-crystal-rock-05.png",
        width = 201,
        height = 179,
        scale = 0.5,
        shift = {0.25, 0.0625},
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/huge-crystal-rock/huge-crystal-rock-06.png",
        width = 233,
        height = 171,
        scale = 0.5,
        shift = {0.429688, 0.046875},
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/huge-crystal-rock/huge-crystal-rock-07.png",
        width = 240,
        height = 192,
        scale = 0.5,
        shift = {0.398438, 0.03125},
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/huge-crystal-rock/huge-crystal-rock-08.png",
        width = 219,
        height = 175,
        scale = 0.5,
        shift = {0.148438, 0.132812},
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/huge-crystal-rock/huge-crystal-rock-09.png",
        width = 240,
        height = 208,
        scale = 0.5,
        shift = {0.3125, 0.0625},
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/huge-crystal-rock/huge-crystal-rock-10.png",
        width = 243,
        height = 190,
        scale = 0.5,
        shift = {0.1875, 0.046875},
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/huge-crystal-rock/huge-crystal-rock-11.png",
        width = 249,
        height = 185,
        scale = 0.5,
        shift = {0.398438, 0.0546875},
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/huge-crystal-rock/huge-crystal-rock-12.png",
        width = 273,
        height = 163,
        scale = 0.5,
        shift = {0.34375, 0.0390625},
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/huge-crystal-rock/huge-crystal-rock-13.png",
        width = 275,
        height = 175,
        scale = 0.5,
        shift = {0.273438, 0.0234375},
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/huge-crystal-rock/huge-crystal-rock-14.png",
        width = 241,
        height = 215,
        scale = 0.5,
        shift = {0.195312, 0.0390625},
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/huge-crystal-rock/huge-crystal-rock-15.png",
        width = 318,
        height = 181,
        scale = 0.5,
        shift = {0.523438, 0.03125},
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/huge-crystal-rock/huge-crystal-rock-16.png",
        width = 217,
        height = 224,
        scale = 0.5,
        shift = {0.0546875, 0.0234375},
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/huge-crystal-rock/huge-crystal-rock-17.png",
        width = 332,
        height = 228,
        scale = 0.5,
        shift = {0.226562, 0.046875},
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/huge-crystal-rock/huge-crystal-rock-18.png",
        width = 290,
        height = 243,
        scale = 0.5,
        shift = {0.195312, 0.0390625},
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/huge-crystal-rock/huge-crystal-rock-19.png",
        width = 349,
        height = 225,
        scale = 0.5,
        shift = {0.609375, 0.0234375},
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/huge-crystal-rock/huge-crystal-rock-20.png",
        width = 287,
        height = 250,
        scale = 0.5,
        shift = {0.132812, 0.03125},
        tint = tintable_crystal_rock_tint
      }
    }
  },
  {
    name = "hyarion-big-volcanic-rock",
    type = "simple-entity",
    flags = {"placeable-neutral", "placeable-off-grid"},
    icon = "__space-age__/graphics/icons/big-volcanic-rock.png",
    subgroup = "grass",
    order = "b[decorative]-l[rock]-g[hyarion]-a[big-volcanic-rock]",
    collision_box = {{-0.75, -0.75}, {0.75, 0.75}},
    selection_box = {{-1.0, -1.0}, {1.0, 0.75}},
    damaged_trigger_effect = hit_effects.rock(),
    render_layer = "object",
    max_health = 500,
    autoplace = {
      order = "a[landscape]-c[rock]-b[big]",
      probability_expression = "hyarion_rock_big"
    },
    dying_trigger_effect = decorative_trigger_effects.big_rock(),
    minable =
    {
      mining_particle = "stone-particle",
      mining_time = 2,
      results =
      {
        {type = "item", name = "carbon", amount_min = 9, amount_max = 15},
        {type = "item", name = "planetaris-raw-quartz", amount_min = 10, amount_max = 15}
      }
    },
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    map_color = {129, 105, 78},
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    impact_category = "stone",
    pictures =
    {
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/big-crystal-rock/big-crystal-rock-01.png",
        width =  188 ,
        height =  127 ,
        shift = {0.304688, -0.4},
        scale = 0.5,
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/big-crystal-rock/big-crystal-rock-02.png",
        width =  195 ,
        height =  135 ,
        shift = {0.0, 0.0390625},
        scale = 0.5,
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/big-crystal-rock/big-crystal-rock-03.png",
        width =  205 ,
        height =  132 ,
        shift = {0.151562, 0.0},
        scale = 0.5,
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/big-crystal-rock/big-crystal-rock-04.png",
        width =  144 ,
        height =  142 ,
        shift = {0.151562, 0.0},
        scale = 0.5,
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/big-crystal-rock/big-crystal-rock-05.png",
        width =  130 ,
        height =  107 ,
        shift = {0.390625, 0.0},
        scale = 0.5,
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/big-crystal-rock/big-crystal-rock-06.png",
        width =  165 ,
        height =  109 ,
        shift = {0.328125, 0.0703125},
        scale = 0.5,
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/big-crystal-rock/big-crystal-rock-07.png",
        width =  150 ,
        height =  133 ,
        shift = {0.16875, -0.1},
        scale = 0.5,
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/big-crystal-rock/big-crystal-rock-08.png",
        width =  156 ,
        height =  111 ,
        shift = {0.3, -0.2},
        scale = 0.5,
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/big-crystal-rock/big-crystal-rock-09.png",
        width =  186 ,
        height =  160 ,
        shift = {0.0, 0.0},
        scale = 0.5,
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/big-crystal-rock/big-crystal-rock-10.png",
        width =  225 ,
        height =  128 ,
        shift = {0.1, 0.0},
        scale = 0.5,
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/big-crystal-rock/big-crystal-rock-11.png",
        width =  183 ,
        height =  144 ,
        shift = {0.325, -0.1},
        scale = 0.5,
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/big-crystal-rock/big-crystal-rock-12.png",
        width =  158 ,
        height =  138 ,
        shift = {0.453125, 0.0},
        scale = 0.5,
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/big-crystal-rock/big-crystal-rock-13.png",
        width =  188 ,
        height =  150 ,
        shift = {0.539062, -0.015625},
        scale = 0.5,
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/big-crystal-rock/big-crystal-rock-14.png",
        width =  186 ,
        height =  160 ,
        shift = {0.0703125, 0.179688},
        scale = 0.5,
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/big-crystal-rock/big-crystal-rock-15.png",
        width =  181 ,
        height =  174 ,
        shift = {0.160938, 0.0},
        scale = 0.5,
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/big-crystal-rock/big-crystal-rock-16.png",
        width =  212 ,
        height =  150 ,
        shift = {0.242188, -0.195312},
        scale = 0.5,
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/big-crystal-rock/big-crystal-rock-17.png",
        width =  155 ,
        height =  117 ,
        shift = {0.351562, -0.1},
        scale = 0.5,
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/big-crystal-rock/big-crystal-rock-18.png",
        width =  141 ,
        height =  128 ,
        shift = {0.351562, -0.1},
        scale = 0.5,
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/big-crystal-rock/big-crystal-rock-19.png",
        width =  176 ,
        height =  114 ,
        shift = {0.351562, -0.1},
        scale = 0.5,
        tint = tintable_crystal_rock_tint
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/big-crystal-rock/big-crystal-rock-20.png",
        width =  120 ,
        height =  125 ,
        shift = {0.351562, -0.1},
        scale = 0.5,
        tint = tintable_crystal_rock_tint
      }
    }
  },
  --- MEDIUM BLACK ROCKS
  {
    name = "hyarion-medium-volcanic-rock",
    type = "optimized-decorative",
    order = "b[decorative]-l[rock]-c[medium]",
    collision_box = {{-1.1, -1.1}, {1.1, 1.1}},
    render_layer = "decorative",
    walking_sound = space_age_tile_sounds.walking.rocky_stone({modifiers = volume_multiplier("main-menu", 1.5)}),
    autoplace = {
      order = "d[ground-surface]-i[rock]-a[medium]",
      probability_expression = "hyarion_rock_medium"
    },
    trigger_effect = decorative_trigger_effects.medium_rock(),
    pictures =
    {
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/medium-crystal-rock/medium-crystal-rock-01.png",
        priority = base_decorative_sprite_priority,
        width = 89,
        height = 63,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.078125, 0.109375}
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/medium-crystal-rock/medium-crystal-rock-02.png",
        priority = base_decorative_sprite_priority,
        width = 77,
        height = 66,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.015625, 0.132812}
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/medium-crystal-rock/medium-crystal-rock-03.png",
        priority = base_decorative_sprite_priority,
        width = 92,
        height = 63,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.148438, 0.179688}
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/medium-crystal-rock/medium-crystal-rock-04.png",
        priority = base_decorative_sprite_priority,
        width = 91,
        height = 59,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {-0.0078125, 0.1875}
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/medium-crystal-rock/medium-crystal-rock-05.png",
        priority = base_decorative_sprite_priority,
        width = 104,
        height = 72,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.203125, 0.179688}
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/medium-crystal-rock/medium-crystal-rock-06.png",
        priority = base_decorative_sprite_priority,
        width = 83,
        height = 82,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.015625, 0.21875}
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/medium-crystal-rock/medium-crystal-rock-07.png",
        priority = base_decorative_sprite_priority,
        width = 111,
        height = 65,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.0625, 0.3125}
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/medium-crystal-rock/medium-crystal-rock-08.png",
        priority = base_decorative_sprite_priority,
        width = 79,
        height = 81,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.109375, 0.148438}
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/medium-crystal-rock/medium-crystal-rock-09.png",
        priority = base_decorative_sprite_priority,
        width = 98,
        height = 56,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.015625, 0.140625}
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/medium-crystal-rock/medium-crystal-rock-10.png",
        priority = base_decorative_sprite_priority,
        width = 91,
        height = 68,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0, 0.132812}
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/medium-crystal-rock/medium-crystal-rock-11.png",
        priority = base_decorative_sprite_priority,
        width = 105,
        height = 71,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {-0.0234375, 0.125}
      },
      {
        filename = "__planetaris-unbounded-assets__/graphics/decorative/medium-crystal-rock/medium-crystal-rock-12.png",
        priority = base_decorative_sprite_priority,
        width = 78,
        height = 80,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.5,
        shift = {0.078125, -0.015625}
      }
    }
  },
  --- SMALL BLACK ROCKS
  {
    name = "hyarion-small-volcanic-rock",
    type = "optimized-decorative",
    order = "b[decorative]-l[rock]-d[small]",
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    render_layer = "decorative",
    walking_sound = base_tile_sounds.walking.pebble,
    autoplace =
    {
      order = "d[ground-surface]-i[rock]-b[small]",
      probability_expression = "hyarion_rock_small"
    },
    trigger_effect = decorative_trigger_effects.small_rock(),
    pictures =
    {
        {
          filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal-rock/small-crystal-rock-01.png",
          priority = base_decorative_sprite_priority,
          width = 51,
          height = 37,
          tint_as_overlay = true,
          tint = tintable_crystal_rock_tint,
          scale = 0.5,
          shift = {0.0546875, 0.117188}
        },
        {
          filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal-rock/small-crystal-rock-02.png",
          priority = base_decorative_sprite_priority,
          width = 52,
          height = 35,
          tint_as_overlay = true,
          tint = tintable_crystal_rock_tint,
          scale = 0.5,
          shift = {0.0390625, 0.078125}
        },
        {
          filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal-rock/small-crystal-rock-03.png",
          priority = base_decorative_sprite_priority,
          width = 46,
          height = 42,
          tint_as_overlay = true,
          tint = tintable_crystal_rock_tint,
          scale = 0.5,
          shift = {-0.0078125, 0.148438}
        },
        {
          filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal-rock/small-crystal-rock-04.png",
          priority = base_decorative_sprite_priority,
          width = 53,
          height = 33,
          tint_as_overlay = true,
          tint = tintable_crystal_rock_tint,
          scale = 0.5,
          shift = {0.0234375, 0.15625}
        },
        {
          filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal-rock/small-crystal-rock-05.png",
          priority = base_decorative_sprite_priority,
          width = 47,
          height = 46,
          tint_as_overlay = true,
          tint = tintable_crystal_rock_tint,
          scale = 0.5,
          shift = {0.0390625, 0.140625}
        },
        {
          filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal-rock/small-crystal-rock-06.png",
          priority = base_decorative_sprite_priority,
          width = 62,
          height = 41,
          tint_as_overlay = true,
          tint = tintable_crystal_rock_tint,
          scale = 0.5,
          shift = {-0.03125, 0.09375}
        },
        {
          filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal-rock/small-crystal-rock-07.png",
          priority = base_decorative_sprite_priority,
          width = 64,
          height = 36,
          tint_as_overlay = true,
          tint = tintable_crystal_rock_tint,
          scale = 0.5,
          shift = {-0.015625, 0.0703125}
        },
        {
          filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal-rock/small-crystal-rock-08.png",
          priority = base_decorative_sprite_priority,
          width = 65,
          height = 31,
          tint_as_overlay = true,
          tint = tintable_crystal_rock_tint,
          scale = 0.5,
          shift = {-0.71875, -0.164062}
        },
        {
          filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal-rock/small-crystal-rock-09.png",
          priority = base_decorative_sprite_priority,
          width = 46,
          height = 34,
          tint_as_overlay = true,
          tint = tintable_crystal_rock_tint,
          scale = 0.5,
          shift = {-0.0859375, 0.101562}
        },
        {
          filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal-rock/small-crystal-rock-10.png",
          priority = base_decorative_sprite_priority,
          width = 48,
          height = 34,
          tint_as_overlay = true,
          tint = tintable_crystal_rock_tint,
          scale = 0.5,
          shift = {0.0078125, 0.125}
        },
        {
          filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal-rock/small-crystal-rock-11.png",
          priority = base_decorative_sprite_priority,
          width = 51,
          height = 33,
          tint_as_overlay = true,
          tint = tintable_crystal_rock_tint,
          scale = 0.5,
          shift = {-0.0859375, 0.078125}
        },
        {
          filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal-rock/small-crystal-rock-12.png",
          priority = base_decorative_sprite_priority,
          width = 47,
          height = 39,
          tint_as_overlay = true,
          tint = tintable_crystal_rock_tint,
          scale = 0.5,
          shift = {0.078125, 0.117188}
        },
        {
          filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal-rock/small-crystal-rock-13.png",
          priority = base_decorative_sprite_priority,
          width = 43,
          height = 33,
          tint_as_overlay = true,
          tint = tintable_crystal_rock_tint,
          scale = 0.5,
          shift = {0, 0.09375}
        },
        {
          filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal-rock/small-crystal-rock-14.png",
          priority = base_decorative_sprite_priority,
          width = 43,
          height = 30,
          tint_as_overlay = true,
          tint = tintable_crystal_rock_tint,
          scale = 0.5,
          shift = {0.046875, 0.140625}
        },
        {
          filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal-rock/small-crystal-rock-15.png",
          priority = base_decorative_sprite_priority,
          width = 41,
          height = 37,
          tint_as_overlay = true,
          tint = tintable_crystal_rock_tint,
          scale = 0.5,
          shift = {0, 0.140625}
        },
        {
          filename = "__planetaris-unbounded-assets__/graphics/decorative/small-crystal-rock/small-crystal-rock-16.png",
          priority = base_decorative_sprite_priority,
          width = 46,
          height = 33,
          tint_as_overlay = true,
          tint = tintable_crystal_rock_tint,
          scale = 0.5,
          shift = {0.0234375, 0.125}
        }
    }
  },
  --- TINY TINTABLE ROCKS
  {
    name = "hyarion-tiny-volcanic-rock",
    type = "optimized-decorative",
    order = "b[decorative]-l[rock]-d[small]",
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    render_layer = "decorative",
    walking_sound = base_tile_sounds.walking.pebble,
    autoplace =
    {
      order = "d[ground-surface]-i[rock]-d[tiny]",
      placement_density = 5,
      probability_expression = "hyarion_rock_tiny"
    },
    trigger_effect = decorative_trigger_effects.small_rock(),
    pictures =
    {
      {
        filename =  "__planetaris-unbounded-assets__/graphics/decorative/tiny-crystal-rock/tiny-crystal-rock-01.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  21,
        tint_as_overlay = true,
        tint = tintable_crystal_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__planetaris-unbounded-assets__/graphics/decorative/tiny-crystal-rock/tiny-crystal-rock-02.png",
        priority = base_decorative_sprite_priority,
        width =  30,
        height =  19,
        tint_as_overlay = true,
        tint = tintable_crystal_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__planetaris-unbounded-assets__/graphics/decorative/tiny-crystal-rock/tiny-crystal-rock-03.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  24,
        tint_as_overlay = true,
        tint = tintable_crystal_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__planetaris-unbounded-assets__/graphics/decorative/tiny-crystal-rock/tiny-crystal-rock-04.png",
        priority = base_decorative_sprite_priority,
        width =  32,
        height =  20,
        tint_as_overlay = true,
        tint = tintable_crystal_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__planetaris-unbounded-assets__/graphics/decorative/tiny-crystal-rock/tiny-crystal-rock-05.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  25,
        tint_as_overlay = true,
        tint = tintable_crystal_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__planetaris-unbounded-assets__/graphics/decorative/tiny-crystal-rock/tiny-crystal-rock-06.png",
        priority = base_decorative_sprite_priority,
        width =  36,
        height =  24,
        tint_as_overlay = true,
        tint = tintable_crystal_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__planetaris-unbounded-assets__/graphics/decorative/tiny-crystal-rock/tiny-crystal-rock-07.png",
        priority = base_decorative_sprite_priority,
        width =  78,
        height =  34,
        tint_as_overlay = true,
        tint = tintable_crystal_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__planetaris-unbounded-assets__/graphics/decorative/tiny-crystal-rock/tiny-crystal-rock-08.png",
        priority = base_decorative_sprite_priority,
        width =  35,
        height =  19,
        tint_as_overlay = true,
        tint = tintable_crystal_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__planetaris-unbounded-assets__/graphics/decorative/tiny-crystal-rock/tiny-crystal-rock-09.png",
        priority = base_decorative_sprite_priority,
        width =  28,
        height =  20,
        tint_as_overlay = true,
        tint = tintable_crystal_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__planetaris-unbounded-assets__/graphics/decorative/tiny-crystal-rock/tiny-crystal-rock-10.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  20,
        tint_as_overlay = true,
        tint = tintable_crystal_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__planetaris-unbounded-assets__/graphics/decorative/tiny-crystal-rock/tiny-crystal-rock-11.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  20,
        tint_as_overlay = true,
        tint = tintable_crystal_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__planetaris-unbounded-assets__/graphics/decorative/tiny-crystal-rock/tiny-crystal-rock-12.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  22,
        tint_as_overlay = true,
        tint = tintable_crystal_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__planetaris-unbounded-assets__/graphics/decorative/tiny-crystal-rock/tiny-crystal-rock-13.png",
        priority = base_decorative_sprite_priority,
        width =  27,
        height =  19,
        tint_as_overlay = true,
        tint = tintable_crystal_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__planetaris-unbounded-assets__/graphics/decorative/tiny-crystal-rock/tiny-crystal-rock-14.png",
        priority = base_decorative_sprite_priority,
        width =  27,
        height =  19,
        tint_as_overlay = true,
        tint = tintable_crystal_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__planetaris-unbounded-assets__/graphics/decorative/tiny-crystal-rock/tiny-crystal-rock-15.png",
        priority = base_decorative_sprite_priority,
        width =  26,
        height =  22,
        tint_as_overlay = true,
        tint = tintable_crystal_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__planetaris-unbounded-assets__/graphics/decorative/tiny-crystal-rock/tiny-crystal-rock-16.png",
        priority = base_decorative_sprite_priority,
        width =  27,
        height =  20,
        tint_as_overlay = true,
        tint = tintable_crystal_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      }
    }
  },
  --- ROCK CLUSTERS
  {
    name = "hyarion-tiny-rock-cluster",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]-b[sand]",
    collision_box = {{-0.2, -0.2}, {0.2, 0.2}},
    collision_mask = {layers={water_tile=true, doodad=true}, colliding_with_tiles_only=true},
    render_layer = "decorative",
    walking_sound = base_tile_sounds.walking.pebble,
    autoplace =
    {
      order = "d[ground-surface]-i[rock]-c[cluster]",
      placement_density = 2,
      probability_expression = "hyarion_rock_cluster"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/tiny-volcanic-rock-cluster/tiny-volcanic-rock-cluster-", "", 128, 8,tintable_crystal_rock_tint,true)
  },
  --- SULFUR ROCKS
  --- SMALL ROCKS
  {
    name = "hyarion-small-sulfur-rock",
    type = "optimized-decorative",
    order = "b[decorative]-l[rock]-d[small]",
    collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
    render_layer = "decorative",
    walking_sound = base_tile_sounds.walking.pebble,
    autoplace =
    {
      order = "d[ground-surface]-b[sulfur-rock]-a[small]",
      placement_density = 2,
      probability_expression = "vulcanus_small_sulfur_rock"
    },
    trigger_effect = decorative_trigger_effects.small_rock(),
    pictures =
    {
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-01.png",
        priority = base_decorative_sprite_priority,
        width = 51,
        height = 37,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {0.0546875, 0.117188}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-02.png",
        priority = base_decorative_sprite_priority,
        width = 52,
        height = 35,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {0.0390625, 0.078125}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-03.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 42,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {-0.0078125, 0.148438}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-04.png",
        priority = base_decorative_sprite_priority,
        width = 53,
        height = 33,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {0.0234375, 0.15625}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-05.png",
        priority = base_decorative_sprite_priority,
        width = 47,
        height = 46,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {0.0390625, 0.140625}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-06.png",
        priority = base_decorative_sprite_priority,
        width = 62,
        height = 41,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {-0.03125, 0.09375}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-07.png",
        priority = base_decorative_sprite_priority,
        width = 64,
        height = 36,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {-0.015625, 0.0703125}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-08.png",
        priority = base_decorative_sprite_priority,
        width = 65,
        height = 31,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {-0.71875, -0.164062}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-09.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 34,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {-0.0859375, 0.101562}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-10.png",
        priority = base_decorative_sprite_priority,
        width = 48,
        height = 34,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {0.0078125, 0.125}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-11.png",
        priority = base_decorative_sprite_priority,
        width = 51,
        height = 33,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {-0.0859375, 0.078125}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-12.png",
        priority = base_decorative_sprite_priority,
        width = 47,
        height = 39,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {0.078125, 0.117188}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-13.png",
        priority = base_decorative_sprite_priority,
        width = 43,
        height = 33,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {0, 0.09375}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-14.png",
        priority = base_decorative_sprite_priority,
        width = 43,
        height = 30,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {0.046875, 0.140625}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-15.png",
        priority = base_decorative_sprite_priority,
        width = 41,
        height = 37,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {0, 0.140625}
      },
      {
        filename = "__space-age__/graphics/decorative/small-volcanic-rock/small-volcanic-rock-16.png",
        priority = base_decorative_sprite_priority,
        width = 46,
        height = 33,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {0.0234375, 0.125}
      }
    }
  },
  --- TINY ROCKS
  {
    name = "hyarion-tiny-sulfur-rock",
    type = "optimized-decorative",
    order = "b[decorative]-l[rock]-d[small]",
    collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
    render_layer = "decorative",
    walking_sound = base_tile_sounds.walking.pebble,
    autoplace =
    {
      order = "d[ground-surface]-b[sulfur-rock]-c[tiny]",
      placement_density = 5,
      probability_expression = "vulcanus_sulfur_rock_tiny"
    },
    trigger_effect = decorative_trigger_effects.small_rock(),
    pictures =
    {
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-01.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  21,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-02.png",
        priority = base_decorative_sprite_priority,
        width =  30,
        height =  19,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-03.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  24,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-04.png",
        priority = base_decorative_sprite_priority,
        width =  32,
        height =  20,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-05.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  25,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-06.png",
        priority = base_decorative_sprite_priority,
        width =  36,
        height =  24,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-07.png",
        priority = base_decorative_sprite_priority,
        width =  78,
        height =  34,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-08.png",
        priority = base_decorative_sprite_priority,
        width =  35,
        height =  19,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-09.png",
        priority = base_decorative_sprite_priority,
        width =  28,
        height =  20,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-10.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  20,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-11.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  20,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-12.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  22,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-13.png",
        priority = base_decorative_sprite_priority,
        width =  27,
        height =  19,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-14.png",
        priority = base_decorative_sprite_priority,
        width =  27,
        height =  19,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-15.png",
        priority = base_decorative_sprite_priority,
        width =  26,
        height =  22,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      },
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-16.png",
        priority = base_decorative_sprite_priority,
        width =  27,
        height =  20,
        tint_as_overlay = true,
        tint = metallic_rock_tint,
        scale = 0.5,
        shift = {0.0, 0.0}
      }
    }
  },
  --- ROCK CLUSTERS
  {
    name = "hyarion-metallic-rock-cluster",
    type = "optimized-decorative",
    order = "a[vulcanus]-b[decorative]-b[sand]",
    collision_box = {{-1, -1}, {1, 1}},
    collision_mask = {layers={water_tile=true, doodad=true}, colliding_with_tiles_only=true},
    render_layer = "decorative",
    walking_sound = base_tile_sounds.walking.pebble,
    autoplace =
    {
      order = "d[ground-surface]-b[sulfur-rock]-b[cluster]",
      placement_density = 2,
      probability_expression = "vulcanus_sulfur_rock_cluster"
    },
    pictures = get_decal_pictures("__space-age__/graphics/decorative/tiny-volcanic-rock-cluster/tiny-volcanic-rock-cluster-", "", 128, 8,metallic_rock_tint,true)
  },
  {
    type = "optimized-decorative",
    name = "hyarion-lava-fire",
    order = "b[effect]-l[fire]-h[vulcanus-lava-fire]",
    collision_box = {{-1, -1}, {1, 1}},
    collision_mask = {layers={ground_tile=true}, colliding_with_tiles_only=true},
    autoplace =
    {
      order = "d[ground-surface]-k[lava]",
      probability_expression = "0.1 * (hyarion_elev <= 0) * (hyarion_elev > 2)\z
                                + 0.005 * min(1, max(lava_basalts_range, lava_mountains_range, lava_hot_basalts_range, lava_hot_mountains_range))"
    },
    pictures =
    {
      {
        filename =  "__space-age__/graphics/decorative/tiny-volcanic-rock/tiny-volcanic-rock-01.png",
        priority = base_decorative_sprite_priority,
        width =  29,
        height =  21,
        tint_as_overlay = true,
        tint = tintable_rock_tint,
        scale = 0.0,
        shift = {0.0, 0.0}
      }
    },
    stateless_visualisation =
    {
      min_count = 1,
      max_count = 1,
      offset_x = { -0.05, 0.05 }, -- will be random from range -0.05 to 0.05
      offset_y = { -0.05, 0.05 },
      render_layer = "object",
      adjust_animation_speed_by_base_scale = false,
      scale = { 0.6, 1 },
      animation =
      {
        {
          filename = "__base__/graphics/entity/fire-flame/fire-flame-04.png",
          line_length = 10,
          width = 84,
          height = 94,
          frame_count = 90,
          animation_speed = 0.2,
          scale = 0.75,
          tint = {r=0.9,g=0.9,b=0.9,a=0.5},
          shift = { 0, -0.25 },
          draw_as_glow = true
        }
      },
      nested_visualisations =
      {
        {
          count = 10,
          period = 120,
          particle_tick_offset = 120 / 30, -- offsets start of the simulation interval from the previous particle for each particle
          probability = 0.5,
          scale = { 0.5, 1 },
          begin_scale = 0.5,
          end_scale = 1.5,

          offset_x = { -0.2, 0.2 },
          offset_y = { -0.2, 0.2 },

          speed_x = { -1 / 240, 1 / 240 },
          speed_y = { -1 / 240, 0 / 240 },
          speed_z = 8 / 240,

          movement_slowdown_factor_z = 0.985,

          render_layer = "smoke",
          affected_by_wind = true,

          fade_in_progress_duration = 0.2 / 3,
          fade_out_progress_duration = 0.8 / 3,

          animation =
          {
            width = 253,
            height = 210,
            line_length = 8,
            frame_count = 60,
            scale = 0.25,
            tint = {r = 0.1, g = 0.08, b = 0.06, a = 0.1}, --util.premul_color{0.3, 0.3, 0.3, 0.1},
            priority = "high",
            flags = { "smoke" },
            animation_speed = 0.1,
            filename = "__base__/graphics/entity/fire-smoke/fire-smoke.png",
          }
        },
      }
    }
  },
  scaled_cliff_crater(
  {
    mod_name = "__planetaris-unbounded-assets__",
    name = "hyarion-crater-cliff",
    icon = "__planetaris-unbounded-assets__/graphics/icons/crater-cliff.png",
    map_color = {r=144, g=119, b=87},
    subfolder = "hyarion",
    prefix = "hyarion-crater-section",
    scale = 1.0,
    collision_mask = {layers={item=true, object=true, player=true, water_tile=true}},
    has_lower_layer = true,
    sprite_size_multiplier = 2,
    flags = { "placeable-off-grid", "placeable-neutral" },
    factoriopedia_simulation = simulations.factoriopedia_hyarion_crater_cliff,
    cliff_explosive = "planetaris-unstable-gem",
    

    crater_radius = 7, --3.5,
    crater_edge_thickness = 5,
    crater_segment_orientation_offset = 0, --1 / 16,
    --segment_probability = 1,
    autoplace =
    {
      order = "a[landscape]-a[cliff]-b[crater]",
      probability_expression = "crater_cliff"
    }
  })
}
