local sounds = require("__base__.prototypes.entity.sounds")
local math3d = require "math3d"


local jelly_duration = 20 * second
local cacti_cooldown = 8 * second
local jelly_speed_modifier = 2.5


local make_sticker_data = function()
  return
  {
    {
      type = "sticker",
      name = "cactus-speed-sticker",
      flags = {"not-on-map"},
      hidden = true,
      single_particle = true,
      duration_in_ticks = jelly_duration,
      target_movement_modifier = jelly_speed_modifier,
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
      duration_in_ticks = jelly_duration,
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
    },
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
      cooldown = cacti_cooldown,
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



planetaris_item_effects =
{
  data = make_sticker_data(),
  cactus_speed = make_speed_capsule_effect(),
}
return planetaris_item_effects
