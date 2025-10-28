if not mods["bztin"] then return end

---------------------Add tin to progression on Arig

local arig_crash = data.raw["simple-entity"]["arig-big-sand-rock"].minable.results
table.insert(arig_crash,
    {type = "item", name = "tin-ore", amount_min = 19, amount_max = 25})

local arig_crash = data.raw["simple-entity"]["arig-crash"].minable.results
table.insert(arig_crash,
    {type = "item", name = "tin-plate", amount_min = 2, amount_max = 8})

local planetaris_sand_sifting = data.raw["recipe"]["planetaris-sand-sifting"].results
table.insert(planetaris_sand_sifting,
    {type = "item", name = "tin-ore", amount = 1, probability = 0.02, show_details_in_recipe_tooltip = false})