if not mods["bzlead"] then return end

---------------------Add lead to progression on Arig

local arig_crash = data.raw["simple-entity"]["arig-big-sand-rock"].minable.results
table.insert(arig_crash,
    {type = "item", name = "lead-ore", amount_min = 19, amount_max = 25})

local arig_crash = data.raw["simple-entity"]["arig-crash"].minable.results
table.insert(arig_crash,
    {type = "item", name = "lead-plate", amount_min = 5, amount_max = 15})

local planetaris_sand_sifting = data.raw["recipe"]["planetaris-sand-sifting"].results
table.insert(planetaris_sand_sifting,
    {type = "item", name = "lead-ore", amount = 1, independent_probability = 0.05, show_details_in_recipe_tooltip = false})

PlanetarisLib.add_or_replace_recipe_ingredient("planetaris-advanced-solar-panel", "", {type = "item", name = "lead-expansion-bolt", amount = 8})
PlanetarisLib.add_or_replace_recipe_ingredient("planetaris-water-harvester", "", {type = "item", name = "lead-expansion-bolt", amount = 8})