require("compat.castra")
require("compat.celestial-weather")
require("compat.pelagos")
require("compat.aquilo-trenches")

data.raw["assembling-machine"]["planetaris-assembling-machine-4"].crafting_categories = data.raw["assembling-machine"]["assembling-machine-3"].crafting_categories

--if not mods["Krastorio2-spaced-out"] then
--    data.raw["furnace"]["planetaris-quartz-furnace"].energy_usage = "45kW"
--end

if mods["aai-loaders"] and settings.startup["aai-loaders-mode"].value ~= "graphics-only" then
    data.raw["item"]["aai-hyper-loader"].weight = 200*kg
end

if mods["aai-loaders-sane"] then
    data.raw["technology"]["aai-hyper-loader"] = nil
end