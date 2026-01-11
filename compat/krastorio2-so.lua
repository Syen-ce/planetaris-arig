if not mods["Krastorio2-spaced-out"] then return end

--------------------- Add krastorio2 mmaterials to the progression

local planetaris_sand_sifting = data.raw["recipe"]["planetaris-sand-sifting"].results
table.insert(planetaris_sand_sifting,
    {type = "item", name = "kr-coke", amount = 1, probability = 0.02, show_details_in_recipe_tooltip = false})

local arig_crash = data.raw["simple-entity"]["arig-crash"].minable.results
table.insert(arig_crash,
    {type = "item", name = "kr-automation-core", amount_min = 2, amount_max = 5})

local planetaris_sifter = data.raw["recipe"]["planetaris-sifter"].ingredients
table.insert(planetaris_sifter,
    {type = "item", name = "kr-automation-core", amount = 1})

local planetaris_press = data.raw["recipe"]["planetaris-press"].ingredients
table.insert(planetaris_press,
    {type = "item", name = "kr-automation-core", amount = 2})

    ---------------------Add rare metal to progression on Arig

local arig_crash = data.raw["simple-entity"]["arig-big-sand-rock"].minable.results
table.insert(arig_crash,
    {type = "item", name = "kr-rare-metal-ore", amount_min = 15, amount_max = 21})

local planetaris_sand_sifting = data.raw["recipe"]["planetaris-sand-sifting"].results
table.insert(planetaris_sand_sifting,
    {type = "item", name = "kr-rare-metal-ore", amount = 1, probability = 0.02, show_details_in_recipe_tooltip = false})