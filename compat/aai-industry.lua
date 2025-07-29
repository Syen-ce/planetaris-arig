if not mods["aai-industry"] then return end

---------------------Make the progression faster adding motors to crashes
local arig_crash = data.raw["simple-entity"]["arig-crash"].minable.results
table.insert(arig_crash,
    {type = "item", name = "burner-assembling-machine", amount_min = 1, amount_max = 3})