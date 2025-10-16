if not mods["bztin"] then return end

---------------------Add tin to progression on Arig

local arig_crash = data.raw["simple-entity"]["arig-big-sand-rock"].minable.results
table.insert(arig_crash,
    {type = "item", name = "tin-ore", amount_min = 19, amount_max = 25})

local arig_crash = data.raw["simple-entity"]["arig-crash"].minable.results
table.insert(arig_crash,
    {type = "item", name = "tin-plate", amount_min = 2, amount_max = 8})

local planetaris_sand_sifting = data.raw["recipe"]["planetaris-sand-sifting"].results
table.insert(planetaris_sand_sifting,
    {type = "item", name = "tin-ore", amount = 1, probability = 0.02, show_details_in_recipe_tooltip = false})

--------------------- Hyarion

local stone_furnace = data.raw["furnace"]["planetaris-quartz-furnace"]
if stone_furnace then
  if stone_furnace.result_inventory_size < 4 then
    stone_furnace.result_inventory_size = 4
  end
end

local stone_furnace = data.raw["furnace"]["stone-furnace"]
if stone_furnace then
  if stone_furnace.result_inventory_size < 4 then
    stone_furnace.result_inventory_size = 4
  end
end

local steel_furnace = data.raw["furnace"]["steel-furnace"]
if steel_furnace then
  if steel_furnace.result_inventory_size < 4 then
    steel_furnace.result_inventory_size = 4
  end
end

local electric_furnace = data.raw["furnace"]["electric-furnace"]
if electric_furnace then
  if electric_furnace.result_inventory_size < 4 then
    electric_furnace.result_inventory_size = 4
  end
end

local planetaris_metallic_smelting = data.raw["recipe"]["planetaris-metallic-smelting"].results
table.insert(planetaris_metallic_smelting,
    {type = "item", name = "tin-plate", amount = 1,  probability = 0.25, show_details_in_recipe_tooltip = false})

    data.extend({
        {
        type = "recipe",
        name = "planetaris-metallic-tin-sifting",
        category = "sifting",
        subgroup = "hyarion-basic-processes",
        order = "a-a-e",
        enabled = false,
        auto_recycle = false,
        energy_required = 10,
        icon = "__bztin__/graphics/icons/tin-ore.png",
        localised_name = {"", {"item-name.tin-ore"}, " (", {"space-location-name.hyarion"}, ")"},
        ingredients =
        {
        {type = "item", name = "planetaris-metallic-ore", amount = 5},
        },
        results = {{type="item", name="tin-ore", amount=3}},
        allow_productivity = false,
        crafting_machine_tint = {primary = {0.984, 0.988, 0.663, 1}, secondary = {0.984, 0.988, 0.663, 1}},
        },
    })

    table.insert(data.raw["technology"]["planetaris-metallic-ore-processing"].effects,
        {
          type = "unlock-recipe",
          recipe = "planetaris-metallic-tin-sifting"
        }
      )