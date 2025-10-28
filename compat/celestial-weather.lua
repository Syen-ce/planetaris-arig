-- Code from the celestial wheather mod

local cluster_particles = {
  type = "cluster",
  distance = 8,
  distance_deviation = 8,
  action_delivery = {
    type = "instant",
    source_effects = {
      type = "create-trivial-smoke",
      initial_height = 0.6,
      speed_multiplier_deviation = 0.2,
      starting_frame = 512,
      starting_frame_deviation = 1024,
      offset_deviation = {{-96, -48}, {96, 48}},
      speed_from_center = 0,
      speed_from_center_deviation = 0
    }
  }
}

------ direct particles ------
local direct_particles = {
  type = "direct",
  action_delivery = {
    type = "instant",
    source_effects = {
      type = "create-trivial-smoke",
      initial_height = 0.4,
      speed_multiplier_deviation = 0.2,
      starting_frame = 512,
      starting_frame_deviation = 1024,
      offset_deviation = {{-96, -48}, {96, 48}},
      speed_from_center = 0,
      speed_from_center_deviation = 0
    }
  }
}

------ fog ------
local fog = {
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
  color1 = {255, 217, 139, 1.0},
  color2 = {183, 255, 169, 1.0},
  tick_factor = 0.000001,
}

if mods["celestial-weather"] and settings.startup["enable-arig-weather"].value then

---- Arig

  local arig_sand = table.deepcopy(data.raw["trivial-smoke"]["aquilo-snow-smoke"])
  arig_sand.name = "arig_sand"
  arig_sand.color = {1, 0.918, 0.78}
  arig_sand.animation.filename = "__celestial-weather__/graphics/entity/sand-particles.png",
  data:extend({arig_sand})

  local arig_weather = table.deepcopy(cluster_particles)
  arig_weather.cluster_count = 8
  arig_weather.action_delivery.source_effects.smoke_name= "arig_sand"
  arig_weather.action_delivery.source_effects.speed = {-0.32, 0}
  arig_weather.action_delivery.source_effects.speed_multiplier = settings.startup["arig_sand_particle-speed"].value

  -- Fog

  local arig_fog = table.deepcopy(fog)
  arig_fog.color1 = {0.929, 0.812, 0.553, 1.0}
  arig_fog.color2 = {1, 0.929, 0.722, 1.0}
  arig_fog.tick_factor = 0.0003
  arig_fog.detail_noise_texture.filename = "__celestial-weather__/graphics/entity/dense-clouds.png"

-- implement

  data.raw["planet"]["arig"].ticks_between_player_effects = 1
  data.raw["planet"]["arig"].player_effects =  {(arig_weather)}
  data.raw["planet"]["arig"].surface_render_parameters = data.raw["planet"]["arig"]["surface_render_parameters"] or {}
  data.raw["planet"]["arig"].surface_render_parameters["fog"] = arig_fog

end