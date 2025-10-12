if (mods["any-planet-start"]) then
  APS.add_choice("arig")
  APS.add_choice("hyarion")
end

if (mods["celestial-weather"]) then
data:extend({
	{
		type = "bool-setting",
		name = "enable-arig-weather",
		setting_type = "startup",
		default_value = true,
		order = "a",
	}
})
end