if not mods["loaders-modernized"] then return end

local loaders = {

  ["hyper-"] = {
    underground_name = "planetaris-hyper-underground-belt",
    upgrade_from_tier = "turbo-",
    order = "06",
    tint = util.color("F0F3F7d1"),
    prerequisite_techs = { "planetaris-hyper-transport-belt", "mdrn-turbo-loader" },
    recipe_data = {
      ingredients = {
        { type = "item", name = "planetaris-hyper-transport-belt", amount = 1 },
        { type = "item", name = "mdrn-turbo-loader",      amount = 1 },
        { type = "item", name = "planetaris-heavy-glass",   amount = 1 },
        { type = "fluid", name = "lubricant", amount = 40 },
      }
    }
  }
}

if mods["Krastorio2-spaced-out"] then

  if data.raw["loader-1x1"]["mdrn-superior-loader"] then
    loaders["hyper-"].next_upgrade ="mdrn-superior-loader"
    loaders["superior-"] = {
      order = "07",
      recipe_data = {
        ingredients = {
          { type = "item", name = "kr-superior-transport-belt", amount = 1 },
          { type = "item", name = "mdrn-hyper-loader",      amount = 1 },
          { type = "item", name = "kr-superior-inserter",   amount = 2 },
          { type = "fluid", name = "lubricant", amount = 40 },
        }
      }
    }
  end

  if data.raw["loader-1x1"]["mdrn-stack-loader"] then
    loaders["stack-"] = {
      tint = util.color("000000d1")
    }
  end
end

MdrnLoaders.add_loaders(loaders)
