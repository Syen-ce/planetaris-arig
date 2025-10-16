if mods["crushing-industry"] or mods["aai-industry"] then
    data.extend({
    {
      type = "recipe",
      name = "planetaris-stone-metallic-sifting",
      icon = "__planetaris-unbounded-assets__/graphics/compat/metallic-stone-sifting.png",
      category = "sifting",
      subgroup = "hyarion-basic-processes",
      order = "a-a-c-b",
      energy_required = 10,
      enabled = false,
      auto_recycle = false,
      ingredients =
      {
        {type = "item", name = "planetaris-metallic-ore", amount = 3},
      },
      results = {
        {type="item", name="stone", amount=5}
      }
    },

    table.insert(data.raw["technology"]["planetaris-metallic-ore-processing"].effects,
        {
          type = "unlock-recipe",
          recipe = "planetaris-stone-metallic-sifting"
        }
      )

    })

local planetaris_metallic_smelting = data.raw["recipe"]["planetaris-metallic-smelting"].results
table.insert(planetaris_metallic_smelting,
    {type = "item", name = "stone-brick", amount = 1,  probability = 0.25, show_details_in_recipe_tooltip = false})

local stone_furnace = data.raw["furnace"]["planetaris-quartz-furnace"]
if stone_furnace then
  if stone_furnace.result_inventory_size < 3 then
    stone_furnace.result_inventory_size = 3
  end
end

local stone_furnace = data.raw["furnace"]["stone-furnace"]
if stone_furnace then
  if stone_furnace.result_inventory_size < 3 then
    stone_furnace.result_inventory_size = 3
  end
end

local steel_furnace = data.raw["furnace"]["steel-furnace"]
if steel_furnace then
  if steel_furnace.result_inventory_size < 3 then
    steel_furnace.result_inventory_size = 3
  end
end

local electric_furnace = data.raw["furnace"]["electric-furnace"]
if electric_furnace then
  if electric_furnace.result_inventory_size < 3 then
    electric_furnace.result_inventory_size = 3
  end
end

end