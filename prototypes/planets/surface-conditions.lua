-- Code from Rubia mod

-- Defining surface condition
data:extend({
  {
    type = "surface-property",
    name = "planetaris-dust-concentration",
    default_value = 5, --5%
    order = "f[arig]",
  },
  {
    type = "surface-property",
    name = "planetaris-crystalization-resistance",
    default_value = 0, --0%
    order = "f[arig]",
  }
})

-- dust_concentration Planets
local function set_dust_concentration(planet_name,concentration)
  if (data.raw["planet"][planet_name]) then 
    data.raw["planet"][planet_name].surface_properties["planetaris-dust-concentration"] = concentration end
end
set_dust_concentration("arig", 60)
set_dust_concentration("hyarion", 20)
set_dust_concentration("nauvis", 5)
set_dust_concentration("fulgora", 1)
set_dust_concentration("vulcanus", 10)
set_dust_concentration("gleba", 5)
set_dust_concentration("aquilo", 5)

--Mod planets. Keep it roughly alphabetical
set_dust_concentration("cerys", 5)
set_dust_concentration("corrundum", 10)
set_dust_concentration("cubium", 10)
set_dust_concentration("frozeta", 5)
set_dust_concentration("igrys", 10)
set_dust_concentration("jahtra", 10)
set_dust_concentration("lignumis", 5)
set_dust_concentration("maraxsis", 0)
set_dust_concentration("moshine", 5)
set_dust_concentration("muluna", 0)
set_dust_concentration("paracelsin", 5)
set_dust_concentration("rubia", 10)
set_dust_concentration("tenebris", 15)

-- crystalization Planets
local function set_crystalization(planet_name,resistance)
  if (data.raw["planet"][planet_name]) then 
    data.raw["planet"][planet_name].surface_properties["planetaris-crystalization-resistance"] = resistance end
end
set_crystalization("arig", 0)
set_crystalization("hyarion", 50)
set_crystalization("nauvis", 0)
set_crystalization("fulgora", 0)
set_crystalization("vulcanus", 0)
set_crystalization("gleba", 0)
set_crystalization("aquilo", 5)

--Mod planets. Keep it roughly alphabetical
set_crystalization("cerys", 5)
set_crystalization("corrundum", 0)
set_crystalization("cubium", 0)
set_crystalization("frozeta", 5)
set_crystalization("igrys", 0)
set_crystalization("jahtra", 0)
set_crystalization("lignumis", 0)
set_crystalization("maraxsis", 5)
set_crystalization("moshine", 0)
set_crystalization("muluna", 0)
set_crystalization("paracelsin", 0)
set_crystalization("rubia", 0)
set_crystalization("tenebris", 0)