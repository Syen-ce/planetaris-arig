local effects = require("__core__.lualib.surface-render-parameter-effects")
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")
local planet_catalogue_arig = require("__planetaris-arig__/prototypes/planets/procession-catalogue-arig")
local planet_map_gen = require("__planetaris-arig__/prototypes/planets/planet_map_gen")

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
            orientation = 0.4,
        },
        subgroup = "planets",
        label_orientation = 0.55,
        icon = "__planetaris-arig__/graphics/icons/arig.png",
        icon_size = 64,
        starmap_icon = "__planetaris-arig__/graphics/icons/starmap-planet-arig.png",
        starmap_icon_size = 500,
        map_gen_settings = planet_map_gen.arig(),
        gravity_pull = 10,
        draw_orbit = true,
        magnitude = 1.6,
        order = "f[arig]",
        solar_power_in_space = 600,
        pollutant_type = nil,
        procession_graphic_catalogue = planet_catalogue_arig,
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
            ["solar-power"] = 300,
            pressure = 600,
            gravity = 30, --robot energy = (gravity / pressure) * 100
        },
        persistent_ambient_sounds =
    {
      base_ambience = {filename = "__space-age__/sound/wind/base-wind-aquilo.ogg", volume = 0.5},
      wind = {filename = "__planetaris-arig__/sound/arig-wind.ogg", volume = 0.1},
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
          sound = {variations = sound_variations("__planetaris-arig__/sound/sand", 3, 0.8)},
          delay_mean_seconds = 10,
          delay_variance_seconds = 8
        },
        {
          sound = {variations = sound_variations("__planetaris-arig__/sound/desert", 3, 0.8)},
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
                filename = "__planetaris-arig__/graphics/terrain/arig-tint-noise.png",
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
    }
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
        name = "fulgora-arig",
        subgroup = "planet-connections",
        from = "fulgora",
        to = "arig", 
        length = 15000,
        icon_size = 64,
        asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
    }
})

if data.raw["planet"]["maraxsis"] then
  data:extend({
      {
          type = "space-connection",
          name = "maraxsis-arig",
          subgroup = "planet-connections",
          from = "maraxsis",
          to = "arig", 
          length = 15000,
          icon_size = 64,
          order = "d-b",
          asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.gleba_aquilo)
      }
  })
end

if data.raw["planet"]["tiber"] then
  data:extend({
    {
          type = "space-connection",
          name = "tiber-arig",
          subgroup = "planet-connections",
          from = "tiber",
          to = "arig", 
          length = 5000,
          icon_size = 64,
          order = "d-b",
          asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.vulcanus_gleba)
    }
  })
end

PlanetsLib.borrow_music(data.raw["planet"]["vulcanus"], data.raw["planet"]["arig"])