require("compat.castra")
require("compat.celestial-weather")
require("compat.pelagos")
require("compat.aquilo-trenches")
require("compat.tiber")
require("compat.maraxsis")

if mods["aai-loaders"] and settings.startup["aai-loaders-mode"].value ~= "graphics-only" then
    data.raw["item"]["aai-hyper-loader"].weight = 200*kg
end

if mods["aai-loaders-sane"] then
    data.raw["technology"]["aai-hyper-loader"] = nil
end