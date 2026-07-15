if not mods["bztitanium"] then return end

---------------------Add titanium to progression on Arig

local arig_crash = data.raw["simple-entity"]["arig-big-sand-rock"].minable.results
table.insert(arig_crash,
    {type = "item", name = "titanium-ore", amount_min = 12, amount_max = 19})

local arig_crash = data.raw["simple-entity"]["arig-crash"].minable.results
table.insert(arig_crash,
    {type = "item", name = "titanium-plate", amount_min = 4, amount_max = 12})

local planetaris_sand_sifting = data.raw["recipe"]["planetaris-sand-sifting"].results
table.insert(planetaris_sand_sifting,
    {type = "item", name = "titanium-ore", amount = 1, independent_probability = 0.05, show_details_in_recipe_tooltip = false})