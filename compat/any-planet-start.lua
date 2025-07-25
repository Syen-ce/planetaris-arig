if mods["any-planet-start"] then
	local planet = settings.startup["aps-planet"].value --[[@as string]]
	if planet == "nauvis" or planet == "none" then
		return
	end

	local discovery_tech = data.raw.technology["planet-discovery-arig"]

	if planet == "vulcanus" then
		for i = #discovery_tech.prerequisites, 1, -1 do
			if discovery_tech.prerequisites[i] == "planet-discovery-vulcanus" then
				table.remove(discovery_tech.prerequisites, i)
				break
			end
		end
	end
end
