local explosion_animations = require("__base__.prototypes.entity.explosion-animations")
local smoke_animations = require("__base__.prototypes.entity.smoke-animations")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require ("__space-age__.prototypes.entity.sounds")
local simulations = require("prototypes.factoriopedia-simulations")

data:extend({
  {
    type = "lightning",
    name = "planetaris-refraction-ray",
    icon = "__planetaris-unbounded-assets__/graphics/icons/refraction-ray.png",
    subgroup = "obstacles",
    factoriopedia_simulation = simulations.refraction_ray,
    damage = 120,
    energy = "500MJ",
    time_to_damage = 10,
    effect_duration = 50,
    source_offset = {0, -25},
    source_variance = {30, 6},
    sound =
    {
      variations = sound_variations_with_volume_variations("__space-age__/sound/explosions/lightning-effect", 5, 0.25, 0.8),
      advanced_volume_control =
      {
        fades = {fade_in = {curve_type = "S-curve", from = {control = 0.3, volume_percentage = 50.0}, to = {2.5, 100.0 }}},
      },
      aggregation = {max_count = 3, remove = true, count_already_playing = true},
      audible_distance_modifier = 2.25
    },
    attracted_volume_modifier = 0.4,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "camera-effect",
          duration = 20,
          ease_in_duration = 10,
          ease_out_duration = 7,
          delay = 0,
          strength = 0.75,
          full_strength_max_distance = 10,
          max_distance = 70
        }
      }
    },
    strike_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 5,
            particle_name = "hyarion-stone-particle-big",
            offset_deviation = {{-0.8984, -0.5}, {0.8984, 0.5}},
            initial_height = 0.3,
            initial_vertical_speed = 0.03,
            initial_vertical_speed_deviation = 0.15,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 10,
            particle_name = "hyarion-stone-particle-medium",
            offset_deviation = {{-0.8984, -0.5}, {0.8984, 0.5}},
            initial_height = 0.5,
            initial_vertical_speed = 0.05,
            initial_vertical_speed_deviation = 0.15,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "hyarion-stone-particle-small",
            offset_deviation = {{-0.8984, -0.5}, {0.8984, 0.5}},
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05,
            only_when_visible = true
          },
          {
            type = "create-particle",
            repeat_count = 30,
            particle_name = "big-rock-stone-particle-tiny",
            offset_deviation = {{-0.8984, -0.5}, {0.8984, 0.5}},
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05,
            only_when_visible = true
          },
          {
            type = "create-trivial-smoke",
            smoke_name = "fire-smoke-without-glow",
            offsets = {{0, -0.5}},
            offset_deviation = {{-0.5, -0.5}, {0.5, 0.5}},
            speed = {0, -0.5},
            initial_height = 0.5,
            speed_from_center = 0.008,
            speed_from_center_deviation = 0.015,
            only_when_visible = true
          }
        }
      }
    },
    graphics_set =
    {
      relative_cloud_fork_length = 0.15,
      cloud_fork_orientation_variance = 0.2,
      cloud_detail_level = 4,
      bolt_detail_level = 5,
      bolt_half_width = 0.1,
      bolt_midpoint_variance = 0.05,
      max_bolt_offset = 0.01,
      max_fork_probability = 1,
      fork_intensity_multiplier = 0.99,
      min_ground_streamer_distance = 2,
      max_ground_streamer_distance = 4,
      ground_streamer_variance = 4,
      shader_configuration =
      {
        {color = {1, 1, 1, 0.8}, distortion =  0.20, thickness = 0.20, power = 0.55},
        {color = {1, 1, 1, 1.0}, distortion =  0.40, thickness = 1.00, power = 0.55},
        {color = {1, 1, 1, 1.0}, distortion =  0.55, thickness = 1.00, power = 0.55},
        {color = {1, 1, 1, 0.6}, distortion =  0.70, thickness = 0.75, power = 0.55},
        {color = {1, 1, 1, 0.3}, distortion =  1.00, thickness = 0.50, power = 0.40},
        {color = {1, 1, 1, 0.0}, distortion = 20.00, thickness = 0.50, power = 0.21}
      },
      cloud_background = util.sprite_load("__planetaris-unbounded-assets__/graphics/entity/refraction-ray/refraction-ray-cloud",
                                          {
                                            draw_as_glow = true,
                                            scale = 1,
                                            frame_count = 4,
                                            --tint = {0.5, 0.5, 0.5, 0.5}
                                          }),
      explosion =
      {
        util.sprite_load("__planetaris-unbounded-assets__/graphics/entity/refraction-ray/refraction-ray-explosion",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
        }),
--        util.sprite_load("__planetaris-unbounded-assets__/graphics/entity/refraction-ray/refraction-ray-explosion-2",{
--          draw_as_glow = true,
--          scale = 0.5,
--          frame_count = 36
--         })
      },
      attractor_hit_animation = util.sprite_load("__planetaris-unbounded-assets__/graphics/entity/refraction-ray/refraction-ray-attractor-hit-anim",{
        draw_as_glow = true,
        scale = 1,
        frame_count = 29
      }),
      ground_streamers =
      {
        util.sprite_load("__planetaris-unbounded-assets__/graphics/entity/refraction-ray/refraction-ray-streamer-1",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
         }),
         util.sprite_load("__planetaris-unbounded-assets__/graphics/entity/refraction-ray/refraction-ray-streamer-2",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
         }),
         util.sprite_load("__planetaris-unbounded-assets__/graphics/entity/refraction-ray/refraction-ray-streamer-3",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
         }),
         util.sprite_load("__planetaris-unbounded-assets__/graphics/entity/refraction-ray/refraction-ray-streamer-4",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
         }),
         util.sprite_load("__planetaris-unbounded-assets__/graphics/entity/refraction-ray/refraction-ray-streamer-5",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
         }),
         util.sprite_load("__planetaris-unbounded-assets__/graphics/entity/refraction-ray/refraction-ray-streamer-6",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
         }),
         util.sprite_load("__planetaris-unbounded-assets__/graphics/entity/refraction-ray/refraction-ray-streamer-7",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
         }),
         util.sprite_load("__planetaris-unbounded-assets__/graphics/entity/refraction-ray/refraction-ray-streamer-8",{
          draw_as_glow = true,
          scale = 0.5,
          frame_count = 36
         }),
      },
      light = {intensity = 1.0, size = 120, color = {1, 1, 1}}
    }
  },
  -----------------------------------------------------------------------------
  {
        type = "explosion",
        name = "planetaris-assembling-machine-4-explosion",
        icon = "__planetaris-unbounded__/graphics/icons/assembling-machine-4.png",
        flags = {"not-on-map"},
        hidden = true,
        subgroup = "production-machine-explosions",
        order = "d-c-a",
        height = 0,
        animations = explosion_animations.medium_explosion(),
        smoke = "smoke-fast",
        smoke_count = 2,
        smoke_slow_down_factor = 1,
        sound = sounds.medium_explosion,
        created_effect =
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "create-particle",
                repeat_count = 17,
                particle_name = "assembling-machine-3-metal-particle-big",
                offset_deviation = { { -0.6875, -0.6875 }, { 0.6875, 0.6875 } },
                initial_height = 0.1,
                initial_height_deviation = 0.49,
                initial_vertical_speed = 0.08,
                initial_vertical_speed_deviation = 0.05,
                speed_from_center = 0.03,
                speed_from_center_deviation = 0.05
              },
              {
                type = "create-particle",
                repeat_count = 21,
                particle_name = "assembling-machine-3-metal-particle-medium",
                offset_deviation = { { -0.8789, -0.8945 }, { 0.8789, 0.8945 } },
                initial_height = 0.2,
                initial_height_deviation = 0.5,
                initial_vertical_speed = 0.098,
                initial_vertical_speed_deviation = 0.05,
                speed_from_center = 0.05,
                speed_from_center_deviation = 0.05
              },
              {
                type = "create-particle",
                repeat_count = 26,
                particle_name = "assembling-machine-3-metal-particle-small",
                offset_deviation = { { -0.8945, -0.3906 }, { 0.8945, 0.3906 } },
                initial_height = 0.1,
                initial_height_deviation = 0.5,
                initial_vertical_speed = 0.075,
                initial_vertical_speed_deviation = 0.05,
                speed_from_center = 0.04,
                speed_from_center_deviation = 0.05
              },
              {
                type = "create-particle",
                repeat_count = 7,
                particle_name = "cable-and-electronics-particle-small-medium",
                offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
                initial_height = 0.3,
                initial_height_deviation = 0.5,
                initial_vertical_speed = 0.092,
                initial_vertical_speed_deviation = 0.05,
                speed_from_center = 0.05,
                speed_from_center_deviation = 0.05
              },
              {
                type = "create-particle",
                repeat_count = 25,
                particle_name = "assembling-machine-mechanical-component-particle-medium",
                offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
                initial_height = 0.4,
                initial_height_deviation = 0.5,
                initial_vertical_speed = 0.069,
                initial_vertical_speed_deviation = 0.05,
                speed_from_center = 0.05,
                speed_from_center_deviation = 0.05
              }
            }
          }
        }
      },
      {
    type = "explosion",
    name = "planetaris-sifter-explosion",
    icon = "__planetaris-unbounded__/graphics/icons/sifter.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "production-machine-explosions",
    order = "d-e-a",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.medium_explosion,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 18,
            particle_name = "chemical-plant-metal-particle-big",
            offset_deviation = { { -0.6875, -0.6875 }, { 0.6875, 0.6875 } },
            initial_height = 0.2,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 31,
            particle_name = "chemical-plant-metal-particle-medium",
            offset_deviation = { { -0.9805, -0.8945 }, { 0.9805, 0.8945 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.101,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 26,
            particle_name = "chemical-plant-metal-particle-small",
            offset_deviation = { { -0.9961, -0.5938 }, { 0.9961, 0.5938 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.072,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 43,
            particle_name = "chemical-plant-glass-particle-small",
            offsets = { { 0.7109, 0.7578 } },
            offset_deviation = { { -0.5, -0.2969 }, { 0.5, 0.2969 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.096,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 40,
            particle_name = "chemical-plant-mechanical-component-particle-medium",
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.5,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.085,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.06,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },
      {
    type = "explosion",
    name = "planetaris-big-chest-explosion",
    icon = "__planetaris-unbounded__/graphics/icons/container.png",
    flags = {"not-on-map"},
    hidden = true,
    subgroup = "energy-explosions",
    order = "a-c-b",
    height = 0,
    animations = explosion_animations.medium_explosion(),
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound = sounds.small_explosion,
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 27,
            particle_name = "accumulator-metal-particle-big",
            offset_deviation = { { -0.3945, -0.4961 }, { 0.3945, 0.4961 } },
            initial_height = 0.4,
            initial_height_deviation = 0.49,
            initial_vertical_speed = 0.07,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.04,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 24,
            particle_name = "accumulator-metal-particle-medium",
            offset_deviation = { { -0.7969, -0.5 }, { 0.7969, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.092,
            initial_vertical_speed_deviation = 0.05,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          },
          {
            type = "create-particle",
            repeat_count = 25,
            particle_name = "accumulator-metal-particle-small",
            offsets = { { 0, 0 } },
            offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
            initial_height = 0.4,
            initial_height_deviation = 0.5,
            initial_vertical_speed = 0.034,
            initial_vertical_speed_deviation = 0.047,
            speed_from_center = 0.05,
            speed_from_center_deviation = 0.05
          }
        }
      }
    }
  },
      {
        type = "explosion",
        name = "planetaris-hyper-transport-belt-explosion-base",
        icon = "__planetaris-unbounded__/graphics/icons/hyper-transport-belt.png",
        flags = {"not-on-map"},
        hidden = true,
        height = 0,
        animations = explosion_animations.small_dust_explosion(),
        sound = sounds.small_explosion,
        created_effect =
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "create-trivial-smoke",
                repeat_count = 10,
                smoke_name = "small-dusty-explosion-smoke",
                offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
                initial_height = 0,
                speed_from_center = 0.008,
                speed_from_center_deviation = 0.03
              },
              {
                type = "create-particle",
                repeat_count = 1,
                particle_name = "turbo-transport-belt-metal-particle-medium",
                offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
                initial_height = 0.1,
                initial_height_deviation = 0.5,
                initial_vertical_speed = 0.09,
                initial_vertical_speed_deviation = 0.05,
                speed_from_center = 0.04,
                speed_from_center_deviation = 0.05
              },
              {
                type = "create-particle",
                repeat_count = 4,
                particle_name = "turbo-transport-belt-metal-particle-small",
                offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
                initial_height = 0.1,
                initial_height_deviation = 0.5,
                initial_vertical_speed = 0.071,
                initial_vertical_speed_deviation = 0.05,
                speed_from_center = 0.03,
                speed_from_center_deviation = 0.05
              },
              {
                type = "create-particle",
                repeat_count = 20,
                particle_name = "transport-belt-wooden-splinter-particle-medium",
                offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
                initial_height = 0.1,
                initial_height_deviation = 0.5,
                initial_vertical_speed = 0.08,
                initial_vertical_speed_deviation = 0.016,
                speed_from_center = 0.04,
                speed_from_center_deviation = 0.05
              },
              {
                type = "create-particle",
                repeat_count = 5,
                particle_name = "turbo-transport-belt-mechanical-component-particle-medium",
                offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
                initial_height = 0.1,
                initial_height_deviation = 0.32,
                initial_vertical_speed = 0.041,
                initial_vertical_speed_deviation = 0.042,
                speed_from_center = 0.01,
                speed_from_center_deviation = 0.05
              }
            }
          }
        }
      },
      {
        type = "explosion",
        name = "planetaris-hyper-transport-belt-explosion",
        icon = "__planetaris-unbounded__/graphics/icons/hyper-transport-belt.png",
        flags = {"not-on-map"},
        hidden = true,
        subgroup = "belt-explosions",
        order = "b-c-a",
        animations = util.empty_sprite(),
        created_effect =
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "create-explosion",
                entity_name = "planetaris-hyper-transport-belt-explosion-base",
                offsets = {{0,0.3}},
                offset_deviation = {{ -0.25, -0.25 }, { 0.25, 0.25 }},
              },
            }
          }
        }
      },
    
      {
        type = "explosion",
        name = "planetaris-hyper-underground-belt-explosion-base",
        icon = "__planetaris-unbounded__/graphics/icons/hyper-underground-belt.png",
        flags = {"not-on-map"},
        hidden = true,
        height = 0,
        animations = explosion_animations.small_dust_explosion(),
        sound = sounds.small_explosion,
        created_effect =
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "create-trivial-smoke",
                repeat_count = 10,
                smoke_name = "small-dusty-explosion-smoke",
                offset_deviation = { { -0.4, -0.4 }, { 0.4, 0.4 } },
                initial_height = 0,
                speed_from_center = 0.008,
                speed_from_center_deviation = 0.03
              },
              {
                type = "create-particle",
                repeat_count = 10,
                particle_name = "express-underground-belt-metal-particle-medium",
                offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
                initial_height = 0.2,
                initial_height_deviation = 0.5,
                initial_vertical_speed = 0.081,
                initial_vertical_speed_deviation = 0.05,
                speed_from_center = 0.03,
                speed_from_center_deviation = 0.05
              },
              {
                type = "create-particle",
                repeat_count = 25,
                particle_name = "turbo-underground-belt-metal-particle-small",
                offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
                initial_height = 0.2,
                initial_height_deviation = 0.43,
                initial_vertical_speed = 0.087,
                initial_vertical_speed_deviation = 0.048,
                speed_from_center = 0.05,
                speed_from_center_deviation = 0.05
              },
              {
                type = "create-particle",
                repeat_count = 2,
                particle_name = "turbo-underground-belt-metal-particle-medium-green",
                offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
                initial_height = 0.2,
                initial_height_deviation = 0.5,
                initial_vertical_speed = 0.042,
                initial_vertical_speed_deviation = 0.05,
                speed_from_center = 0.02,
                speed_from_center_deviation = 0.05
              }
            }
          }
        }
      },
      {
        type = "explosion",
        name = "planetaris-hyper-underground-belt-explosion",
        icon = "__planetaris-unbounded__/graphics/icons/hyper-underground-belt.png",
        flags = {"not-on-map"},
        hidden = true,
        subgroup = "belt-explosions",
        order = "b-f-a",
        animations = util.empty_sprite(),
        created_effect =
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "create-explosion",
                entity_name = "planetaris-hyper-underground-belt-explosion-base",
                offsets = {{0,0.3}},
                offset_deviation = {{ -0.25, -0.25 }, { 0.25, 0.25 }},
              },
            }
          }
        }
      },
    
      {
        type = "explosion",
        name = "planetaris-hyper-splitter-explosion",
        icon = "__planetaris-unbounded__/graphics/icons/hyper-splitter.png",
        flags = {"not-on-map"},
        hidden = true,
        subgroup = "belt-explosions",
        order = "b-i-a",
        height = 0,
        animations = explosion_animations.small_explosion(),
        smoke = "smoke-fast",
        smoke_count = 2,
        smoke_slow_down_factor = 1,
        sound = sounds.small_explosion,
        created_effect =
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "create-particle",
                repeat_count = 13,
                particle_name = "turbo-splitter-metal-particle-medium",
                offset_deviation = { { -0.5, -0.5977 }, { 0.5, 0.5977 } },
                initial_height = 0.3,
                initial_height_deviation = 0.5,
                initial_vertical_speed = 0.047,
                initial_vertical_speed_deviation = 0.05,
                speed_from_center = 0.05,
                speed_from_center_deviation = 0.05
              },
              {
                type = "create-particle",
                repeat_count = 25,
                particle_name = "express-splitter-metal-particle-small",
                offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
                initial_height = 0.6,
                initial_height_deviation = 0.5,
                initial_vertical_speed = 0.049,
                initial_vertical_speed_deviation = 0.05,
                speed_from_center = 0.05,
                speed_from_center_deviation = 0.05
              },
              {
                type = "create-particle",
                repeat_count = 3,
                particle_name = "express-splitter-long-metal-particle-medium",
                offset_deviation = { { -0.6953, -0.5977 }, { 0.6953, 0.5977 } },
                initial_height = 0.4,
                initial_height_deviation = 0.5,
                initial_vertical_speed = 0.072,
                initial_vertical_speed_deviation = 0.05,
                speed_from_center = 0.03,
                speed_from_center_deviation = 0.05
              },
              {
                type = "create-particle",
                repeat_count = 2,
                particle_name = "turbo-splitter-metal-particle-big",
                offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
                initial_height = 0.2,
                initial_height_deviation = 0.5,
                initial_vertical_speed = 0.05,
                initial_vertical_speed_deviation = 0.05,
                speed_from_center = 0.05,
                speed_from_center_deviation = 0.05
              },
              {
                type = "create-particle",
                repeat_count = 3,
                particle_name = "express-splitter-mechanical-component-particle-medium",
                offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } },
                initial_height = 0.2,
                initial_height_deviation = 0.5,
                initial_vertical_speed = 0.029,
                initial_vertical_speed_deviation = 0.05,
                speed_from_center = 0.04,
                speed_from_center_deviation = 0.05
              }
            }
          }
        }
      },
})