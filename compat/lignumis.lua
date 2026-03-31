if not mods["lignumis"] then return end

--------------------------------- Arig
-- Added lumber
local arig_crash = data.raw["simple-entity"]["arig-crash"].minable.results
table.insert(arig_crash,
    {type = "item", name = "lumber", amount_min = 15, amount_max = 30})

-- Wood more efficient    
local cactus_wood = data.raw["recipe"]["planetaris-cactus-wood"]
cactus_wood.ingredients =
      {
        { type = "item", name = "planetaris-cactus", amount = 1 },
      }
cactus_wood.results = { { type = "item", name = "wood", amount = 4 } }

local arig_rock = data.raw["simple-entity"]["arig-big-sand-rock"].minable.results
table.insert(arig_rock,
    {type = "item", name = "gold-ore", amount_min = 19, amount_max = 25})

table.insert(arig_crash,
    {type = "item", name = "gold-plate", amount_min = 5, amount_max = 15})

local planetaris_sand_sifting = data.raw["recipe"]["planetaris-sand-sifting"].results
table.insert(planetaris_sand_sifting,
    {type = "item", name = "gold-ore", amount = 1, probability = 0.05, show_details_in_recipe_tooltip = false})