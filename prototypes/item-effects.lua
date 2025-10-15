local sounds = require("__base__.prototypes.entity.sounds")
local math3d = require "math3d"

local cactus_duration = 20 * second
local cactus_cooldown = 16 * second
local cactus_speed_modifier = 1.8

local make_sticker_data = function()
  return
    {
      type = "sticker",
      name = "cactus-speed-sticker",
      flags = {"not-on-map"},
      hidden = true,
      single_particle = true,
      duration_in_ticks = cactus_duration,
      target_movement_modifier = cactus_speed_modifier,
      animation =
        util.sprite_load("__space-age__/graphics/sticker/jellynut-speed/whirl_front",
          {
            priority = "high",
            frame_count = 50,
            scale = 0.5,
            animation_speed = 0.5,
            shift = util.by_pixel(0,16)
          }
        )
    },
    {
      type = "sticker",
      name = "cactus-speed-sticker-behind",
      flags = {"not-on-map"},
      hidden = true,
      single_particle = true,
      duration_in_ticks = cactus_duration,
      render_layer = "object-under",
      animation =
        util.sprite_load("__space-age__/graphics/sticker/jellynut-speed/whirl_back",
          {
            priority = "high",
            frame_count = 50,
            scale = 0.5,
            animation_speed = 0.5,
            shift = util.by_pixel(0,16)
          }
        )
    }
end

local make_speed_capsule_effect = function()
  return
  {
    type = "use-on-self",
    attack_parameters =
    {
      type = "projectile",
      activation_type = "consume",
      ammo_category = "capsule",
      cooldown = cactus_cooldown,
      range = 0,
      ammo_type =
      {
        target_type = "position",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "instant",
            target_effects =
            {
              {
                type = "create-sticker",
                sticker = "cactus-speed-sticker",
                show_in_tooltip = true
              },
              {
                type = "create-sticker",
                sticker = "cactus-speed-sticker-behind"
              },
              {
                type = "play-sound",
                sound = sounds.eat_fish,
              }
            }
          }
        }
      }
    }
  }
end

local planetaris_item_effects =
{
  data = make_sticker_data(),
  cactus_speed = make_speed_capsule_effect(),
}
return planetaris_item_effects