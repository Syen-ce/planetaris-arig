data:extend({
	{
		type = "bool-setting",
		name = "enable-arig-cargo-drops",
		setting_type = "startup",
		default_value = false,
		order = "a-a-a",
	},{
		type = "bool-setting",
		name = "enable-hyarion-cargo-drops",
		setting_type = "startup",
		default_value = false,
		order = "a-a-b",
	},
})

if (mods["any-planet-start"]) then
  APS.add_choice("arig")
  --APS.add_choice("hyarion")
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
	},
	----
	{
		type = "bool-setting",
		name = "enable-hyarion-weather",
		setting_type = "startup",
		default_value = true,
		order = "c-b",
	},{
		type = "bool-setting",
		name = "enable-hyarion-dust",
		setting_type = "startup",
		default_value = true,
		order = "c-c",
	},{
		type = "double-setting",
		name = "hyarion_dust_particle-speed",
		setting_type = "startup",
		default_value = 0.3,
		order = "c-c",
	},{
		type = "bool-setting",
		name = "enable-hyarion-lights",
		setting_type = "startup",
		default_value = true,
		order = "c-d",
	},{
		type = "double-setting",
		name = "hyarion-lights-particle-speed",
		setting_type = "startup",
		default_value = 0.04,
		order = "c-d",
	},{
		type = "bool-setting",
		name = "enable-hyarion-fog",
		setting_type = "startup",
		default_value = true,
		order = "c-e",
	}
})
end