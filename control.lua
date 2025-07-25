local energy_penalty = 600.0  -- simulate 600x usage
local target_surface = "arig"

local function parse_energy(str)
  -- Convert "5000J" to 5000 (number)
  return tonumber(str:match("(%d+)")) or 0
end

script.on_event(defines.events.on_tick, function(event)
  if event.tick % 60 ~= 0 then return end  -- run every second

  local surface = game.surfaces[target_surface]
  if not surface then return end

  for _, robot in pairs(surface.find_entities_filtered{type = "logistic-robot"}) do
    if robot.valid and robot.energy then
      local base_energy = parse_energy(robot.prototype.energy_per_move)
      local penalty = base_energy * (energy_penalty - 1)
      robot.energy = math.max(0, robot.energy - penalty)
    end
  end

  for _, robot in pairs(surface.find_entities_filtered{type = "construction-robot"}) do
    if robot.valid and robot.energy then
      local base_energy = parse_energy(robot.prototype.energy_per_move)
      local penalty = base_energy * (energy_penalty - 1)
      robot.energy = math.max(0, robot.energy - penalty)
    end
  end
end)