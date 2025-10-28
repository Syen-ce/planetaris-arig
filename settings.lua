data:extend({
	{
		type = "bool-setting",
		name = "enable-arig-cargo-drops",
		setting_type = "startup",
		default_value = false,
		order = "a-a-a",
	}
})

if (mods["any-planet-start"]) then
  APS.add_choice("arig")
end

if (mods["celestial-weather"]) then
data:extend({
	{
		type = "bool-setting",
		name = "enable-arig-weather",
		setting_type = "startup",
		default_value = true,
		order = "b-a-a",
	},{
		type = "double-setting",
		name = "arig_sand_particle-speed",
		setting_type = "startup",
		default_value = 1.5,
		order = "b-a-b",
	}
})
end