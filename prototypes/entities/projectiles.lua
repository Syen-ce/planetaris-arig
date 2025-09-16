data.extend({
      {
    type = "projectile",
    name = "unstable-gem",
    flags = {"not-on-map"},
    hidden = true,
    acceleration = 0.005,
    action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "ground-explosion"
            },
            {
              type = "create-entity",
              entity_name = "small-scorchmark-tintable",
              check_buildability = true
            },
            {
              type = "destroy-cliffs",
              radius = 4,
              explosion_at_trigger = "explosion"
            },
            {
              type = "invoke-tile-trigger",
              repeat_count = 1
            },
            {
              type = "destroy-decoratives",
              from_render_layer = "decorative",
              to_render_layer = "object",
              include_soft_decoratives = true, -- soft decoratives are decoratives with grows_through_rail_path = true
              include_decals = false,
              invoke_decorative_trigger = true,
              decoratives_with_trigger_only = false, -- if true, destroys only decoratives that have trigger_effect set
              radius = 2 -- large radius for demostrative purposes
            }
          }
        }
      }
    },
    --light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__planetaris-unbounded-assets__/graphics/entity/unstable-gem/unstable-gem.png",
      draw_as_glow = true,
      frame_count = 14,
      line_length = 7,
      animation_speed = 0.250,
      width = 58,
      height = 58,
      shift = util.by_pixel(0.5, -4.5),
      priority = "high",
      scale = 0.5
    },
    shadow =
    {
      filename = "__planetaris-unbounded-assets__/graphics/entity/unstable-gem/unstable-gem-shadow.png",
      frame_count = 14,
      line_length = 7,
      animation_speed = 0.250,
      width = 74,
      height = 42,
      shift = util.by_pixel(-3.5, 4),
      priority = "high",
      draw_as_shadow = true,
      scale = 0.5
    }
  }
})