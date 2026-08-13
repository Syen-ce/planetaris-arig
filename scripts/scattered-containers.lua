-- Scatters container entities around a center position, each with a chance
-- to contain a random subset of items from a loot table.


local function spawn_scattered_containers(surface, center, opts)
  opts = opts or {}
  local count = opts.count or 5
  local min_radius = opts.min_radius or 5
  local max_radius = opts.max_radius or 15
  local entity_names = opts.entity_names or {opts.entity_name or "wooden-chest"}
  local force = opts.force or "neutral"
  local loot = opts.loot or {}
  local empty_chance = opts.empty_chance or 0

  local spawned = {}

  for i = 1, count do
    local angle = math.random() * 2 * math.pi
    local dist = min_radius + math.random() * (max_radius - min_radius)
    local rough_pos = {
      x = center.x + math.cos(angle) * dist,
      y = center.y + math.sin(angle) * dist,
    }

    local entity_name = entity_names[math.random(#entity_names)]
    local target_pos = surface.find_non_colliding_position(entity_name, rough_pos, 6, 0.5)
    if target_pos then
      local container = surface.create_entity({
        name = entity_name,
        position = target_pos,
        force = force,
      })

      if container and container.valid then
        if math.random() >= empty_chance then
          for _, item in pairs(loot) do
            local chance = item.chance or 1
            if math.random() < chance then
              local count_to_insert = math.random(item.min, item.max)
              container.insert({name = item.name, count = count_to_insert})
            end
          end
        end
        table.insert(spawned, container)
      end
    end
  end

  return spawned
end

return spawn_scattered_containers