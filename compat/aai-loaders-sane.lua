if not mods["aai-loaders-sane"] then return end

    local hyper_recipe = data.raw["recipe"]["aai-hyper-loader"]

    hyper_recipe.ingredients = {
        {type = "item", name = "aai-turbo-loader", amount = 1},
        {type = "item", name = "planetaris-silica", amount = 15},
        {type = "item", name = "processing-unit", amount = 2},
        {type = "fluid", name = "lubricant", amount = 40}
    }

    hyper_recipe.energy_required = 2
    
    table.insert(data.raw["technology"]["planetaris-hyper-transport-belt"].effects, {type="unlock-recipe", recipe=hyper_recipe.name})