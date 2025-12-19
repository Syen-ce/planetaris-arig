require("compat.castra")
require("compat.celestial-weather")
require("compat.pelagos")
require("compat.aquilo-trenches")

if mods["aai-loaders"] and settings.startup["aai-loaders-mode"].value ~= "graphics-only" then
    data.raw["item"]["aai-hyper-loader"].weight = 200*kg
end

if mods["aai-loaders-sane"] then
    data.raw["technology"]["aai-hyper-loader"] = nil
end

if settings.startup["enable-arig-cargo-drops"].value == true then
    if data.raw.technology["planetslib-arig-cargo-drops"] then
        data.raw.technology["planetslib-arig-cargo-drops"].enabled = true
        data.raw.technology["planetslib-arig-cargo-drops"].hidden = true
    end
else
    if data.raw.technology["planetslib-arig-cargo-drops"] then
        data.raw.technology["planetslib-arig-cargo-drops"].enabled = false
        data.raw.technology["planetslib-arig-cargo-drops"].hidden = false
    end
end