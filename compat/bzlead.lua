if not mods["bzlead"] then return end

---------------------Add lead to progression on Arig

local arig_crash = data.raw["simple-entity"]["arig-big-sand-rock"].minable.results
table.insert(arig_crash,
    {type = "item", name = "lead-ore", amount_min = 19, amount_max = 25})

local arig_crash = data.raw["simple-entity"]["arig-crash"].minable.results
table.insert(arig_crash,
    {type = "item", name = "lead-plate", amount_min = 5, amount_max = 15})

local planetaris_sand_sifting = data.raw["recipe"]["planetaris-sand-sifting"].results
table.insert(planetaris_sand_sifting,
    {type = "item", name = "lead-ore", amount = 1, probability = 0.05, show_details_in_recipe_tooltip = false})

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
    {type = "item", name = "lead-plate", amount = 1,  probability = 0.30, show_details_in_recipe_tooltip = false})

    data.extend({
        {
        type = "recipe",
        name = "planetaris-metallic-lead-sifting",
        category = "sifting",
        subgroup = "hyarion-basic-processes",
        order = "a-a-d",
        enabled = false,
        auto_recycle = false,
        energy_required = 10,
        icon = "__bzlead__/graphics/icons/lead-ore.png",
        localised_name = {"", {"item-name.lead-ore"}, " (", {"space-location-name.hyarion"}, ")"},
        ingredients =
        {
        {type = "item", name = "planetaris-metallic-ore", amount = 5},
        },
        results = {{type="item", name="lead-ore", amount=3}},
        allow_productivity = false,
        crafting_machine_tint = {primary = {0.267, 0.2, 0.302, 1}, secondary = {0.267, 0.2, 0.302, 1}},
        },
    })

    table.insert(data.raw["technology"]["planetaris-metallic-ore-processing"].effects,
        {
          type = "unlock-recipe",
          recipe = "planetaris-metallic-lead-sifting"
        }
      )