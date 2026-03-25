planetaris_sifter_cover_pictures = function()
  local layers =
  {
    north =
    {
      layers =
      {
        {
        filename = "__planetaris-arig__/graphics/entity/sifter/sifter-pipe-connection-vertical.png",
        priority = "extra-high",
        width = 400,
        height = 400,
        scale = 0.3,
        shift = {1, 1.77}
        },
      }
    },
    east =
    {
      layers =
      {
        {
        filename = "__planetaris-arig__/graphics/entity/sifter/sifter-pipe-connection-horizontal.png",
        priority = "extra-high",
        width = 400,
        height = 400,
        scale = 0.3,
        shift = {-2, 0.7}
        },
      }
    },
    south =
    {
      layers =
      {
        {
        filename = "__planetaris-arig__/graphics/entity/sifter/sifter-pipe-connection-vertical.png",
        priority = "extra-high",
        width = 400,
        height = 400,
        scale = 0.3,
        shift = {-1, -2.23}
        },
      }
    },
    west =
    {
      layers =
      {
        {
        filename = "__planetaris-arig__/graphics/entity/sifter/sifter-pipe-connection-horizontal.png",
        priority = "extra-high",
        width = 400,
        height = 400,
        scale = 0.3,
        shift = {2, -1.3}
        },
      }
    },
  }
  return layers
end


planetaris_mirrored_sifter_cover_pictures = function()
  local layers =
  {
    north =
    {
      layers =
      {
        {
        filename = "__planetaris-arig__/graphics/entity/sifter/sifter-pipe-connection-vertical.png",
        priority = "extra-high",
        width = 400,
        height = 400,
        scale = 0.3,
        shift = {-1, 1.77}
        },
      }
    },
    east =
    {
      layers =
      {
        {
        filename = "__planetaris-arig__/graphics/entity/sifter/sifter-pipe-connection-horizontal.png",
        priority = "extra-high",
        width = 400,
        height = 400,
        scale = 0.3,
        shift = {-2, -1.3}
        },
      }
    },
    south =
    {
      layers =
      {
        {
        filename = "__planetaris-arig__/graphics/entity/sifter/sifter-pipe-connection-vertical.png",
        priority = "extra-high",
        width = 400,
        height = 400,
        scale = 0.3,
        shift = {1, -2.23}
        },
      }
    },
    west =
    {
      layers =
      {
        {
        filename = "__planetaris-arig__/graphics/entity/sifter/sifter-pipe-connection-horizontal.png",
        priority = "extra-high",
        width = 400,
        height = 400,
        scale = 0.3,
        shift = {2, 0.7}
        },
      }
    },
  }
  return layers
end