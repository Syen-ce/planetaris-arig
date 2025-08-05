if not mods["planet-muluna"] then return end

--Add second result slot for glass recipe

local muluna_stone_furnace = data.raw["furnace"]["muluna-steam-stone-furnace"]
if muluna_stone_furnace then
  if muluna_stone_furnace.result_inventory_size < 2 then
    muluna_stone_furnace.result_inventory_size = 2
  end
end

local muluna_steel_furnace = data.raw["furnace"]["muluna-steam-steel-furnace"]
if muluna_steel_furnace then
  if muluna_steel_furnace.result_inventory_size < 2 then
    muluna_steel_furnace.result_inventory_size = 2
  end
end