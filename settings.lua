data:extend({
	{
		type = "bool-setting",
		name = "enable-arig-cargo-drops",
		setting_type = "startup",
		default_value = false,
		order = "a-a-a",
	},
	{
		type = "bool-setting",
		name = "compression-for-aquilo",
		setting_type = "startup",
		default_value = true,
		order = "a-b-a",
	},
	{
		type = "bool-setting",
		name = "compression-for-promethium",
		setting_type = "startup",
		default_value = true,
		order = "a-b-a",
	},
	{
		type = "bool-setting",
		name = "debug-cactus-recipe",
		setting_type = "startup",
		default_value = false,
		order = "a-c-a",
	},
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

if (mods["TechnologyPriceMultiplier"]) then
data:extend({
	{
		type = "bool-setting",
		name = "ignore-arig-tech-price-exponent",
		setting_type = "startup",
		default_value = true,
		order = "c-b",
	}
})
end