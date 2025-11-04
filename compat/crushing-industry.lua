if not settings.startup["crushing-industry-coal"] then return end


---------------------Made the progression faster adding crushers and engines to crashes

local arig_crash = data.raw["simple-entity"]["arig-crash"].minable.results
table.insert(arig_crash,
    {type = "item", name = "burner-crusher", amount_min = 1, amount_max = 3})

local arig_crash = data.raw["simple-entity"]["arig-crash"].minable.results
table.insert(arig_crash,
    {type = "item", name = "engine-unit", amount_min = 3, amount_max = 5})

    

if settings.startup["crushing-industry-coal"].value then

---------------------Updated recipe

data.raw["recipe"]["planetaris-compression-rocket-fuel"].ingredients = {
      {type = "item", name = "solid-fuel", amount = 2},      
      {type = "item", name = "crushed-coal", amount = 2},
      {type = "item", name = "sulfur", amount = 1},
    }
end