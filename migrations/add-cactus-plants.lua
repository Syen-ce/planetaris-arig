for _, planet in pairs(game.planets) do
	if planet.name == "arig" and planet.surface then
		local surface = planet.surface
		local map_gen_settings = surface.map_gen_settings

		map_gen_settings.autoplace_settings.entity.settings["planetaris-cactus-plant"] = {}

		surface.map_gen_settings = map_gen_settings

		surface.regenerate_entity("planetaris-cactus-plant")
	end
end