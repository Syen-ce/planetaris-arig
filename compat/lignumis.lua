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