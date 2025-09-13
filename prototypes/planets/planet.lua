local effects = require("__core__.lualib.surface-render-parameter-effects")
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")
local planet_catalogue_fulgora = require("__space-age__.prototypes.planet.procession-catalogue-fulgora")
local planet_map_gen = require("__planetaris-unbounded__/prototypes/planets/planet_map_gen")

PlanetsLib:extend({
    {
        type = "planet",
        name = "arig",
        orbit = {
            parent = {
                type = "space-location",
                name = "star",
            },
            distance = 12.5,
            orientation = 0.35,
        },
        subgroup = "planets",
        label_orientation = 0.55,
        icon = "__planetaris-unbounded__/graphics/icons/arig.png",
        icon_size = 64,
        starmap_icon = "__planetaris-unbounded__/graphics/icons/starmap-planet-arig.png",
        starmap_icon_size = 500,
        map_gen_settings = planet_map_gen.arig(),
        gravity_pull = 10,
        draw_orbit = true,
        magnitude = 1.6,
        order = "f[arig]",
        solar_power_in_space = 600,
        pollutant_type = nil,
        platform_procession_set = {
            arrival = {"planet-to-platform-b"},
            departure = {"platform-to-planet-a"}
        },
        planet_procession_set = {
            arrival = {"platform-to-planet-b"},
            departure = {"planet-to-platform-a"}
        },
        surface_properties = {
            ["day-night-cycle"] = 1.5 * minute,
            ["magnetic-field"] = 120,
            ["solar-power"] = 250,
            pressure = 500,
            gravity = 30,
        },
        persistent_ambient_sounds =
    {
      base_ambience = {filename = "__space-age__/sound/wind/base-wind-aquilo.ogg", volume = 0.5},
      wind = {filename = "__space-age__/sound/wind/wind-aquilo.ogg", volume = 0.8},
      crossfade =
      {
        order = {"wind", "base_ambience"},
        curve_type = "cosine",
        from = {control = 0.35, volume_percentage = 0.0},
        to = {control = 2, volume_percentage = 100.0}
      },
      semi_persistent =
      {
        {
          sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/cold-wind-gust", 5, 0.3)},
          delay_mean_seconds = 15,
          delay_variance_seconds = 9
        }
      }
    },
        asteroid_spawn_influence = 1,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus, 0.9),
        surface_render_parameters = {
            shadow_opacity = 0.6,
            fog =
          {
            fog_type = "vulcanus",
            shape_noise_texture =
            {
              filename = "__core__/graphics/clouds-noise.png",
              size = 2048
            },
            detail_noise_texture =
            {
              filename = "__core__/graphics/clouds-detail-noise.png",
              size = 2048
            },
            color1 = {0.961, 0.957, 0.922, 0.7},
            color2 = {0.922, 0.875, 0.725, 0.7},
            tick_factor = 0.0000001,
          },
          clouds =
          {
            shape_noise_texture =
            {
              filename = "__core__/graphics/clouds-noise.png",
              size = 2048
            },
            detail_noise_texture =
            {
              filename = "__core__/graphics/clouds-detail-noise.png",
              size = 2048
            },
    
            warp_sample_1 = { scale = 0.8 / 16 },
            warp_sample_2 = { scale = 3.75 * 0.8 / 32, wind_speed_factor = 0 },
            warped_shape_sample = { scale = 2 * 0.18 / 32 },
            additional_density_sample = { scale = 1.5 * 0.18 / 32, wind_speed_factor = 1.77 },
            detail_sample_1 = { scale = 1.709 / 32, wind_speed_factor = 0.2 / 1.709 },
            detail_sample_2 = { scale = 2.179 / 32, wind_speed_factor = 0.33 / 2.179 },
    
            scale = 0.5,
            movement_speed_multiplier = 1.5,
            opacity = 0.05,
            opacity_at_night = 0.1,
            density_at_night = 0.5,
            detail_factor = 1.5,
            detail_factor_at_night = 2,
            shape_warp_strength = 0.06,
            shape_warp_weight = 0.4,
            detail_sample_morph_duration = 0,
          },
            terrain_tint_effect =
            {
              noise_texture =
              {
                filename = "__planetaris-unbounded__/graphics/terrain/arig-tint-noise.png",
                size = 4096
              },
      
              offset = { 0.2, 0, 0.4, 0.8 },
              intensity = { 1, 1, 1, 1 },
              scale_u = { 1.85, 1.85, 1.85, 1.85 },
              scale_v = { 1, 1, 1, 1 },
      
              global_intensity = 0.2,
              global_scale = 0.4,
              zoom_factor = 3.8,
              zoom_intensity = 0.75
            },
            day_night_cycle_color_lookup =
            {
              {0.0, "__space-age__/graphics/lut/vulcanus-1-day.png"},
              {0.20, "__space-age__/graphics/lut/vulcanus-1-day.png"},
              {0.45, "__space-age__/graphics/lut/vulcanus-2-night.png"},
              {0.55, "__space-age__/graphics/lut/vulcanus-2-night.png"},
              {0.80, "__space-age__/graphics/lut/vulcanus-1-day.png"},
            },
        },
    },
{
        type = "planet",
        name = "hyarion",
        orbit = {
            parent = {
                type = "space-location",
                name = "star",
            },
            distance = 22.5,
            orientation = 0.5,
        },
        subgroup = "planets",
        label_orientation = 0.55,
        icon = "__planetaris-unbounded-assets__/graphics/icons/planet-hyarion.png",
        icon_size = 64,
        starmap_icon = "__planetaris-unbounded-assets__/graphics/icons/starmap-planet-hyarion.png",
        starmap_icon_size = 500,
        map_gen_settings = planet_map_gen.hyarion(),
        gravity_pull = 10,
        draw_orbit = true,
        magnitude = 1.3,
        order = "f[arig]",
        solar_power_in_space = 70,
        pollutant_type = nil,
        platform_procession_set = {
            arrival = {"planet-to-platform-b"},
            departure = {"platform-to-planet-a"}
        },
        planet_procession_set = {
            arrival = {"platform-to-planet-b"},
            departure = {"planet-to-platform-a"}
        },
        surface_properties = {
            ["day-night-cycle"] = 5 * minute,
            ["magnetic-field"] = 80,
            ["solar-power"] = 10,
            pressure = 7000,
            gravity = 60,
        },
        lightning_properties =
    {
      lightnings_per_chunk_per_tick = 1 / (60 * 20), --cca once per chunk every 10 seconds (600 ticks)
      search_radius = 10.0,
      lightning_types = {"refraction-ray"},
      lightning_multiplier_at_day = 1,
      lightning_multiplier_at_night = 0.5,
      priority_rules =
      {
        {
          type = "id",
          string = "lightning-collector",
          priority_bonus = 10000
        },
        {
          type = "prototype",
          string = "lightning-attractor",
          priority_bonus = 1000
        },
        {
          type = "prototype",
          string = "furnace",
          priority_bonus = 10
        },
        {
          type = "prototype",
          string = "pipe",
          priority_bonus = 1
        },
        {
          type = "prototype",
          string = "pump",
          priority_bonus = 1
        },
        {
          type = "prototype",
          string = "offshore-pump",
          priority_bonus = 1
        },
        {
          type = "prototype",
          string = "electric-pole",
          priority_bonus = 10
        },
        {
          type = "prototype",
          string = "power-switch",
          priority_bonus = 10
        },
        {
          type = "prototype",
          string = "logistic-robot",
          priority_bonus = 100
        },
        {
          type = "prototype",
          string = "construction-robot",
          priority_bonus = 100
        },
        {
          type = "impact-soundset",
          string = "metal",
          priority_bonus = 1
        }
      },
      exemption_rules =
      {
        {
          type = "prototype",
          string = "rail-support",
        },
        {
          type = "prototype",
          string = "legacy-straight-rail",
        },
        {
          type = "prototype",
          string = "legacy-curved-rail",
        },
        {
          type = "prototype",
          string = "straight-rail",
        },
        {
          type = "prototype",
          string = "curved-rail-a",
        },
        {
          type = "prototype",
          string = "curved-rail-b",
        },
        {
          type = "prototype",
          string = "half-diagonal-rail",
        },
        {
          type = "prototype",
          string = "rail-ramp",
        },
        {
          type = "prototype",
          string = "elevated-straight-rail",
        },
        {
          type = "prototype",
          string = "elevated-curved-rail-a",
        },
        {
          type = "prototype",
          string = "elevated-curved-rail-b",
        },
        {
          type = "prototype",
          string = "elevated-half-diagonal-rail",
        },
        {
          type = "prototype",
          string = "rail-signal",
        },
        {
          type = "prototype",
          string = "rail-chain-signal",
        },
        {
          type = "prototype",
          string = "locomotive",
        },
        {
          type = "prototype",
          string = "artillery-wagon",
        },
        {
          type = "prototype",
          string = "cargo-wagon",
        },
        {
          type = "prototype",
          string = "fluid-wagon",
        },
        {
          type = "prototype",
          string = "land-mine",
        },
        {
          type = "prototype",
          string = "wall",
        },
        {
          type = "prototype",
          string = "tree",
        },
        {
          type = "countAsRockForFilteredDeconstruction",
          string = "true",
        },
      }
    },
        persistent_ambient_sounds =
          {
            base_ambience = {filename = "__space-age__/sound/wind/base-wind-fulgora.ogg", volume = 0.5},
            wind = {filename = "__space-age__/sound/wind/wind-fulgora.ogg", volume = 0.8},
            crossfade =
            {
              order = {"wind", "base_ambience"},
              curve_type = "cosine",
              from = {control = 0.35, volume_percentage = 0.0},
              to = {control = 2, volume_percentage = 100.0}
            },
            semi_persistent =
            {
              {
                sound = {variations = sound_variations("__space-age__/sound/world/semi-persistent/distant-thunder", 4, 0.6)},
                delay_mean_seconds = 33,
                delay_variance_seconds = 7
              },
              {
                sound =
                {
                  variations = sound_variations("__space-age__/sound/world/semi-persistent/sand-wind-gust", 5, 0.45),
                  advanced_volume_control =
                  {
                    fades = {fade_in = {curve_type = "cosine", from = {control = 0.5, volume_percentage = 0.0}, to = {1.5, 100.0}}}
                  }
                },
                delay_mean_seconds = 15,
                delay_variance_seconds = 9,
              },
            }
          },
        asteroid_spawn_influence = 1,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus, 0.9),
        surface_render_parameters = {
            shadow_opacity = 0.6,
            fog =
          {
            fog_type = "vulcanus",
            shape_noise_texture =
            {
              filename = "__core__/graphics/clouds-noise.png",
              size = 2048
            },
            detail_noise_texture =
            {
              filename = "__core__/graphics/clouds-detail-noise.png",
              size = 2048
            },
            color1 = {0.970, 0.970, 0.970, 0.7},
            color2 = {0.875, 0.875, 0.875, 0.7},
            tick_factor = 0.0000001,
          },
          clouds =
          {
            shape_noise_texture =
            {
              filename = "__core__/graphics/clouds-noise.png",
              size = 2048
            },
            detail_noise_texture =
            {
              filename = "__core__/graphics/clouds-detail-noise.png",
              size = 2048
            },
    
            warp_sample_1 = { scale = 0.8 / 16 },
            warp_sample_2 = { scale = 3.75 * 0.8 / 32, wind_speed_factor = 0 },
            warped_shape_sample = { scale = 2 * 0.18 / 32 },
            additional_density_sample = { scale = 1.5 * 0.18 / 32, wind_speed_factor = 1.77 },
            detail_sample_1 = { scale = 1.709 / 32, wind_speed_factor = 0.2 / 1.709 },
            detail_sample_2 = { scale = 2.179 / 32, wind_speed_factor = 0.33 / 2.179 },
    
            scale = 1,
            movement_speed_multiplier = 0.75,
            opacity = 0.25,
            opacity_at_night = 0.25,
            density_at_night = 1,
            detail_factor = 1.5,
            detail_factor_at_night = 2,
            shape_warp_strength = 0.06,
            shape_warp_weight = 0.4,
            detail_sample_morph_duration = 0,
          },
            terrain_tint_effect =
            {
              noise_texture =
              {
                filename = "__planetaris-unbounded__/graphics/terrain/arig-tint-noise.png",
                size = 4096
              },
      
              offset = { 0.2, 0, 0.4, 0.8 },
              intensity = { 1, 1, 1, 1 },
              scale_u = { 1.85, 1.85, 1.85, 1.85 },
              scale_v = { 1, 1, 1, 1 },
      
              global_intensity = 0.2,
              global_scale = 0.4,
              zoom_factor = 3.8,
              zoom_intensity = 0.75
            },
            day_night_cycle_color_lookup =
            {
              {0.0, "__space-age__/graphics/lut/vulcanus-1-day.png"},
              {0.20, "__space-age__/graphics/lut/vulcanus-1-day.png"},
              {0.45, "__space-age__/graphics/lut/vulcanus-2-night.png"},
              {0.55, "__space-age__/graphics/lut/vulcanus-2-night.png"},
              {0.80, "__space-age__/graphics/lut/vulcanus-1-day.png"},
            },
        },
    },
})

data:extend({
    {
        type = "space-connection",
        name = "vulcanus-arig",
        subgroup = "planet-connections",
        from = "vulcanus",
        to = "arig", 
        length = 15000,
        icon_size = 64,
        order = "d-b",
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
    },
    {
        type = "space-connection",
        name = "nauvis-arig",
        subgroup = "planet-connections",
        from = "nauvis",
        to = "arig", 
        length = 10000,
        icon_size = 64,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
    },
    {
        type = "space-connection",
        name = "arig-hyarion",
        subgroup = "planet-connections",
        from = "arig",
        to = "hyarion", 
        length = 30000,
        icon_size = 64,
        order = "d-c",
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
    },
    {
        type = "space-connection",
        name = "fulgora-hyarion",
        subgroup = "planet-connections",
        from = "fulgora",
        to = "hyarion", 
        length = 30000,
        icon_size = 64,
        order = "d-d",
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
    },
})

PlanetsLib.borrow_music(data.raw["planet"]["vulcanus"], data.raw["planet"]["arig"])
PlanetsLib.borrow_music(data.raw["planet"]["fulgora"], data.raw["planet"]["hyarion"])