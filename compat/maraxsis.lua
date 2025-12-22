local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")

if not mods["maraxsis"] then return end

-- remove space connections
if data.raw["space-connection"]["vulcanus-maraxsis"] then
    data.raw["space-connection"]["vulcanus-maraxsis"] = nil
end

if data.raw["space-connection"]["fulgora-maraxsis"] and mods["planetaris-hyarion"] then
    data.raw["space-connection"]["fulgora-maraxsis"] = nil
end