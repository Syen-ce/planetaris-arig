require ("util")

local function lightning_rod_picture(repeat_count)
  return
  {
    layers =
    {
      util.sprite_load("__planetaris-unbounded-assets__/graphics/entity/big-light-ray-collector/big-light-ray-collector",
      {
        priority = "high",
        scale = 0.5,
        repeat_count = repeat_count
      }),
      util.sprite_load("__planetaris-unbounded-assets__/graphics/entity/big-light-ray-collector/big-light-ray-collector-shadow",
      {
        priority = "high",
        draw_as_shadow = true,
        scale = 0.5,
        repeat_count = repeat_count
      })
    }
  }
end

local function lightning_rod_charge()
  return
  {
    layers =
    {
      util.sprite_load("__planetaris-unbounded-assets__/graphics/entity/big-light-ray-collector/big-light-ray-collector-charge",
      {
        priority = "high",
        blend_mode = "additive",
        scale = 0.5,
        frame_count = 30,
        draw_as_glow = true,
      })
    }
  }
end

local function lightning_rod_discharge()
  return
  {
    layers =
    {
      util.sprite_load("__planetaris-unbounded-assets__/graphics/entity/big-light-ray-collector/big-light-ray-collector-discharge",
      {
        priority = "high",
        blend_mode = "additive",
        scale = 0.5,
        frame_count = 30,
        draw_as_glow = true,
      })
    }
  }
end

return
{
  picture = lightning_rod_picture(),
  charge_animation = lightning_rod_charge(),
  charge_animation_is_looped = false,
  charge_cooldown = 30,
  discharge_animation = lightning_rod_discharge(),
  discharge_cooldown = 60
  --todo: charge light
  --todo: discharge light
}
