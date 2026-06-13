if not mods["bzzirconium"] then return end

local planetaris_sand_sifting = data.raw["recipe"]["planetaris-sand-sifting"].results
table.insert(planetaris_sand_sifting,
    {type = "item", name = "zircon", amount = 1, probability = 0.02, show_details_in_recipe_tooltip = false})