local function on_built_tower(event)
	local tower = event.entity or event.created_entity
	if not (tower and tower.valid and tower.name == "planetaris-condensing-agricultural-tower") then
		return
	end
	storage.arig_condensing_agricultural_tower = storage.arig_condensing_agricultural_tower or {}
	storage.arig_condensing_agricultural_tower[tower.unit_number] = { 
		tower = tower, 
		tank = nil
	}
end

local function on_removed_tower(event)
	local tower = event.entity
	if not (tower and tower.valid and tower.name == "planetaris-condensing-agricultural-tower") then
		return
	end

	local data = storage.arig_condensing_agricultural_tower and storage.arig_condensing_agricultural_tower[tower.unit_number]
	if data and data.tank and data.tank.valid then
		data.tank.destroy()
	end
	if storage.arig_condensing_agricultural_tower then
		storage.arig_condensing_agricultural_tower[tower.unit_number] = nil
	end
end

-- Every 1 second - ensure tank exists

script.on_nth_tick(60, function()
	if not storage.arig_condensing_agricultural_tower then
		return
	end

	for id, data in pairs(storage.arig_condensing_agricultural_tower) do
		local tower = data.tower
		if not (tower and tower.valid) then
			if data.tank and data.tank.valid then
				data.tank.destroy()
			end
			storage.arig_condensing_agricultural_tower[id] = nil
		else
			local tank = data.tank

			if not (tank and tank.valid) then
				local tank_position = {x = tower.position.x, y = tower.position.y}
				
				local new_tank = tower.surface.create_entity({
					name = "hidden-condensing-agricultural-tower-tank",
					position = tank_position,
					direction = defines.direction.south,
					force = tower.force,
					create_build_effect_smoke = false,
					move_stuck_players = true,
				})
				if new_tank then
					new_tank.destructible = false
					data.tank = new_tank
				end
			end
		end
	end
end)

-- When tower harvests a plant, generate water

script.on_event(defines.events.on_tower_mined_plant, function(event)
	local tower = event.entity or event.tower or event.agricultural_tower
	
	if not tower or not tower.valid then
		return
	end
	
	if tower.name ~= "planetaris-condensing-agricultural-tower" then
		return
	end
	
	local data = storage.arig_condensing_agricultural_tower and storage.arig_condensing_agricultural_tower[tower.unit_number]
	if not data or not data.tank or not data.tank.valid then
		return
	end
	
	local tank = data.tank
	
	-- 1500 water per harvest - ((1500 * 23 avaliable tiles)/5 mins of growing) / 60 seconds = 115 water/second
	tank.insert_fluid({name = "water", amount = 1500})
end)

--------------------------------------------------------------
-- Initialization
--------------------------------------------------------------

local function on_init(event)
	storage.arig_condensing_agricultural_tower = storage.arig_condensing_agricultural_tower or {}
end
script.on_init(on_init)

local function on_configuration_changed(event)
	storage.arig_condensing_agricultural_tower = storage.arig_condensing_agricultural_tower or {}
end
script.on_configuration_changed(on_configuration_changed)

---------------------------------------------------------------
-- Event handlers
---------------------------------------------------------------

script.on_event(defines.events.on_built_entity, function(event)
	local e = event.created_entity or event.entity
	if not e then return end
	on_built_tower(event)
end)

script.on_event(defines.events.on_robot_built_entity, function(event)
	local e = event.created_entity or event.entity
	if not e then return end
	on_built_tower(event)
end)

script.on_event(defines.events.on_space_platform_built_entity, function(event)
	local e = event.entity
	if not (e and e.valid) then return end
	on_built_tower(event)
end)

script.on_event(
	{ defines.events.on_entity_died, defines.events.on_player_mined_entity, defines.events.on_robot_mined_entity },
	function(event)
		local e = event.entity
		if not e then return end
		on_removed_tower(event)
	end
)