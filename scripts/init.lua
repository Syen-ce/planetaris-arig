local Public = {}

script.on_init(function()
	Public.whitelist_construction_robots()
end)

function Public.whitelist_construction_robots()
	remote.call("planetslib", "add_to_cargo_drop_item_name_whitelist", "construction-robot", "arig")
end

return Public