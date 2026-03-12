if not mods["Krastorio2-spaced-out"] then return end

require("PlanetarisLib")
local data_util = require("__Krastorio2-spaced-out__/data-util")

local function add_light(item)
	local card = data.raw.tool[item]
	card.pictures = {
		layers = {
			{
				filename = card.icon,
				size = 64,
				scale = 0.5,
			},
			{
				filename = "__k2so-assets__/icons/cards/tech-card-light.png",
				size = 64,
				scale = 0.5,
				draw_as_light = true,
			},
		},
	}
end

------------- compression tech data

data.extend({
	{
		type = "item",
		name = "kr-compression-research-data",
		icon = "__planetaris-arig__/graphics/compat/k2so/icons/compression-research-data.png",
		subgroup = "science-pack",
		order = "a05[agricultural-research-data]-p-a",
		stack_size = 200,
		weight = 1 * kg,
		spoil_result = "spoilage",
		spoil_ticks = 54000,
		default_import_location = "arig",
	},
	{
		type = "recipe",
		name = "kr-compression-research-data",
        category = "compressing",
        enabled = false,
        auto_recycle = false,
        surface_conditions =
        {
        {
            property = "planetaris-dust-concentration",
            min = 50,
            max = 100,
        }
        },
        ingredients =
        {
        {type = "item", name = "planetaris-glass-panel", amount = 2},
        {type = "item", name = "planetaris-raw-diamond", amount = 1},
        {type = "item", name = "planetaris-sandstone-brick", amount = 5},
        },
        results =
        {
        {type = "item",  name = "kr-compression-research-data", amount = 1},
        },
        energy_required = 10,
        allow_productivity = true,
        crafting_machine_tint =
        {
            primary = {r = 0.79, g = 0.98, b = 0.008, a = 1.000},
            secondary = {r = 0.635, g = 0.8, b = 0.294, a = 1.000},
        }
    },
})

--
data_util.set_icon(data.raw.tool["planetaris-compression-science-pack"], "__planetaris-arig__/graphics/compat/k2so/icons/compression-tech-card.png")
data.raw.tool["planetaris-compression-science-pack"].localised_name = { "item-name.kr-compression-tech-card" }
add_light("planetaris-compression-science-pack")

data_util.make_tech_card("planetaris-compression-science-pack", {
	{ type = "item", name = "kr-compression-research-data", amount = 5 },
})
data_util.add_recipe_unlock("planetaris-compression-science", "kr-compression-research-data")
data.raw.technology["planetaris-compression-science"].localised_name = { "item-name.kr-compression-research-data" }
data_util.set_icon(data.raw.technology["planetaris-compression-science"],"__planetaris-arig__/graphics/compat/k2so/technology/compression-tech-card.png",256)


--------------------- Add krastorio2 mmaterials to the progression

local planetaris_sand_sifting = data.raw["recipe"]["planetaris-sand-sifting"].results
table.insert(planetaris_sand_sifting,
    {type = "item", name = "kr-coke", amount = 1, probability = 0.02, show_details_in_recipe_tooltip = false})

local arig_crash = data.raw["simple-entity"]["arig-crash"].minable.results
table.insert(arig_crash,
    {type = "item", name = "kr-automation-core", amount_min = 2, amount_max = 5})

local planetaris_sifter = data.raw["recipe"]["planetaris-sifter"].ingredients
table.insert(planetaris_sifter,
    {type = "item", name = "kr-automation-core", amount = 1})

local planetaris_press = data.raw["recipe"]["planetaris-press"].ingredients
table.insert(planetaris_press,
    {type = "item", name = "kr-automation-core", amount = 2})

    ---------------------Add rare metal to progression on Arig

local arig_crash = data.raw["simple-entity"]["arig-big-sand-rock"].minable.results
table.insert(arig_crash,
    {type = "item", name = "kr-rare-metal-ore", amount_min = 15, amount_max = 21})

local planetaris_sand_sifting = data.raw["recipe"]["planetaris-sand-sifting"].results
table.insert(planetaris_sand_sifting,
    {type = "item", name = "kr-rare-metal-ore", amount = 1, probability = 0.02, show_details_in_recipe_tooltip = false})