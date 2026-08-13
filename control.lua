local spawn_scattered_containers = require("scripts.scattered-containers")

local PLANET_NAME = "arig"
local DROP_CENTER = {x = 0, y = 0}

local function add_to_loot(mod, item_name, min, max, chance)
  if script.active_mods[mod] then
    table.insert(loot, {name = item_name, min = min, max = max, chance = chance})
  end
end

loot = {
      {name = "iron-plate",         min = 10, max = 30, chance = 0.8},
      {name = "copper-plate",       min = 10, max = 25, chance = 0.8},
      {name = "iron-gear-wheel",    min = 10, max = 20, chance = 0.4},
      {name = "electronic-circuit", min = 5,  max = 20, chance = 0.5},
      {name = "steel-plate",        min = 10, max = 20, chance = 0.5},
      {name = "transport-belt",     min = 20, max = 30, chance = 0.4},
      {name = "inserter",           min = 5,  max = 15, chance = 0.4},
      {name = "construction-robot", min = 15, max = 20, chance = 0.3},
      {name = "assembling-machine-1", min = 1,  max = 1,  chance = 0.2},
      {name = "steel-furnace",      min = 1,  max = 2,  chance = 0.2},
    }

add_to_loot("bzcarbon", "graphite", 15, 25, 0.4)
add_to_loot("bzlead", "lead-plate", 15, 25, 0.4)
add_to_loot("bzsilicon", "silicon", 5, 15, 0.3)
add_to_loot("bztitanium", "titanium-plate", 5, 12, 0.3)
add_to_loot("crushing-industry-coal", "engine-unit", 3, 5, 0.2)
add_to_loot("crushing-industry-coal", "burner-crusher", 3, 5, 0.3)
add_to_loot("Krastorio2-spaced-out", "kr-automation-core", 5, 10, 0.4)
add_to_loot("lignumis", "lumber", 15, 25, 0.3)
add_to_loot("aai-industry", "burner-assembling-machine", 1, 1, 0.3)

if script.active_mods["aai-industry"] then
  for i, list in pairs(loot) do
    if list.name == "assembling-machine-1" then
      table.remove(loot, i)
    end
  end
end

local function try_spawn_drop(surface)
  storage.cargo_drop_done = storage.cargo_drop_done or {}
  if storage.cargo_drop_done[surface.name] then return end
  storage.cargo_drop_done[surface.name] = true

local spawned = spawn_scattered_containers(surface, DROP_CENTER, {
    count = 6,
    min_radius = 6,
    max_radius = 20,
    entity_names = {
      "arig-crash-chest-1", 
      "arig-crash-chest-2",
      "arig-crash-site-furnace", 
      "arig-crash-site-chemical-plant",
      "arig-crash-cargo-drop-1",
      "arig-crash-cargo-drop-2",
      "arig-crash-cargo-drop-3"},
    force = "neutral",
    empty_chance = 0.15,
    loot = loot
  })

  -- Remember where the chests ended up so the effect can appear at the
  -- actual crash site, not just an abstract center point.
  storage.cargo_drop_positions = storage.cargo_drop_positions or {}
  local positions = {}
  for _, entity in pairs(spawned) do
    if entity.valid then
      table.insert(positions, entity.position)
    end
  end
  storage.cargo_drop_positions[surface.name] = positions
 
  storage.cargo_drop_effect_pending = storage.cargo_drop_effect_pending or {}
  storage.cargo_drop_effect_pending[surface.name] = true
end
 
local function on_chunk_generated(event)
  local surface = event.surface
  if surface.name ~= PLANET_NAME then return end
 
  local area = event.area
  if DROP_CENTER.x >= area.left_top.x and DROP_CENTER.x < area.right_bottom.x
      and DROP_CENTER.y >= area.left_top.y and DROP_CENTER.y < area.right_bottom.y then
    try_spawn_drop(surface)
  end
end
 
script.on_event(defines.events.on_chunk_generated, on_chunk_generated)



-------------------------- Fire smoke effect

-- How close a player needs to get before the effect triggers.
local EFFECT_TRIGGER_RADIUS = 25

-- How often
local EFFECT_CHECK_INTERVAL = 30

local SPAWN_FIRE = true
-- Chance (0-1)
local FIRE_CHANCE_PER_CHEST = 0.8
local SMOKE_PER_CHEST = 3

local function spawn_impact_effects(surface, positions)
  for _, pos in pairs(positions) do
    for _ = 1, SMOKE_PER_CHEST do
      local offset = {
        x = pos.x + (math.random() - 0.5) * 3,
        y = pos.y + (math.random() - 0.5) * 3,
      }
      surface.create_trivial_smoke({name = "smoke-fast", position = offset})
    end

    if SPAWN_FIRE and math.random() < FIRE_CHANCE_PER_CHEST then
      local offset = {
        x = pos.x + (math.random() - 0.5) * 2,
        y = pos.y + (math.random() - 0.5) * 2,
      }
      surface.create_entity({name = "crash-site-fire-smoke", position = offset})
    end
  end
end

local function check_for_pending_effects()
  if not storage.cargo_drop_effect_pending then return end

  for surface_name, pending in pairs(storage.cargo_drop_effect_pending) do
    if pending then
      local surface = game.surfaces[surface_name]
      local positions = storage.cargo_drop_positions and storage.cargo_drop_positions[surface_name]

      if surface and surface.valid and positions then
        for _, player in pairs(game.connected_players) do
          if player.surface == surface then
            local distance = ((player.position.x - DROP_CENTER.x) ^ 2
              + (player.position.y - DROP_CENTER.y) ^ 2) ^ 0.5

            if distance <= EFFECT_TRIGGER_RADIUS then
              spawn_impact_effects(surface, positions)
              storage.cargo_drop_effect_pending[surface_name] = false
            break
            end
          end
        end
      end
    end
  end
end

script.on_nth_tick(EFFECT_CHECK_INTERVAL, check_for_pending_effects)