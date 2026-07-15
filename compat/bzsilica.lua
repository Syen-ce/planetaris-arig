if not mods["bzsilicon"] then return end

---------------------Add lead to progression on Arig

local arig_crash = data.raw["simple-entity"]["arig-big-sand-rock"].minable.results
table.insert(arig_crash,
    {type = "item", name = "silica", amount_min = 19, amount_max = 25})

local arig_crash = data.raw["simple-entity"]["arig-crash"].minable.results
table.insert(arig_crash,
    {type = "item", name = "silicon", amount_min = 5, amount_max = 15})

local planetaris_sand_sifting = data.raw["recipe"]["planetaris-sand-sifting"].results
table.insert(planetaris_sand_sifting,
    {type = "item", name = "silica", amount = 1, independent_probability = 0.04, show_details_in_recipe_tooltip = false})

PlanetarisLib.add_or_replace_recipe_ingredient("planetaris-silica", "", {type = "item", name = "silica", amount = 1})