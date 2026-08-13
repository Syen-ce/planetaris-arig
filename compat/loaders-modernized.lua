if not mods["loaders-modernized"] then return end

local loaders = {

  ["hyper-"] = {
    underground_name = "planetaris-hyper-underground-belt",
    upgrade_from_tier = "turbo-",
    order = "06",
    tint = util.color("85F0F0F0"),
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

  local kr_loader = data.raw["loader-1x1"]["mdrn-superior-loader"]
  local kr_loader_recipe = data.raw["recipe"]["mdrn-superior-loader"]

  if kr_loader then
    kr_loader.next_upgrade ="mdrn-hyper-loader"
    kr_loader.order = "07"
  end
 
  if kr_loader_recipe then
    kr_loader_recipe.ingredients = {
        { type = "item", name = "hyper-underground-belt", amount = 1 },
        { type = "item", name = "mdrn-hyper-loader",      amount = 1 },
        { type = "item", name = "kr-superior-inserter",   amount = 2 },
        { type = "fluid", name = "lubricant", amount = 40 },
      }
  end
end


MdrnLoaders.add_loaders(loaders)