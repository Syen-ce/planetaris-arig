require("compat.castra")
require("compat.celestial-weather")
require("compat.pelagos")
require("compat.aquilo-trenches")
require("compat.maraxsis")

if mods["aai-loaders"] and settings.startup["aai-loaders-mode"].value ~= "graphics-only" then
    data.raw["item"]["aai-hyper-loader"].weight = 200*kg
end

if mods["aai-loaders-sane"] then
    data.raw["technology"]["aai-hyper-loader"] = nil
end

if not mods["any-planet-start"] then
    if data.raw.technology["planetslib-arig-cargo-drops"] then
        data.raw.technology["planetslib-arig-cargo-drops"].hidden = false
    end
end

-- Update Base techs with compression
if not mods["atomic-arig"] then -- for some reason this crashes with atomic arig
    if settings.startup["compression-for-aquilo"].value == true then
    add_ingredient_if_missing("planet-discovery-aquilo", "planetaris-compression-science-pack")
    add_prerequisite_if_missing("planet-discovery-aquilo", "planetaris-compression-science")
    end

    if settings.startup["compression-for-promethium"].value == true then
    add_ingredient_if_missing("promethium-science-pack", "planetaris-compression-science-pack")
    add_prerequisite_if_missing("promethium-science-pack", "planetaris-compression-science")
    end
end