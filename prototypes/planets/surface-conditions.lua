-- Code from Rubia mod

-- Defining surface condition
data:extend({
  {
    type = "surface-property",
    name = "planetaris-dust-concentration",
    default_value = 5, --5%
    order = "f[arig]",
  }
})

-- Planets
local function set_wind_speed(planet_name,speed)
  if (data.raw["planet"][planet_name]) then 
    data.raw["planet"][planet_name].surface_properties["planetaris-dust-concentration"] = speed end
end
set_wind_speed("arig", 60)
set_wind_speed("nauvis", 5)
set_wind_speed("fulgora", 1)
set_wind_speed("vulcanus", 10)
set_wind_speed("gleba", 5)
set_wind_speed("aquilo", 5)

--Mod planets. Keep it roughly alphabetical
set_wind_speed("cerys", 5)
set_wind_speed("corrundum", 10)
set_wind_speed("cubium", 10)
set_wind_speed("frozeta", 5)
set_wind_speed("igrys", 10)
set_wind_speed("jahtra", 10)
set_wind_speed("lignumis", 5)
set_wind_speed("maraxsis", 0)
set_wind_speed("moshine", 5)
set_wind_speed("muluna", 0)
set_wind_speed("paracelsin", 5)
set_wind_speed("rubia", 10)
set_wind_speed("tenebris", 15)