if not mods["Krastorio2-spaced-out"] then return end

require("PlanetarisLib")
require("prototypes.entities.transport-belts")
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

    ---------------------Hyper belts

    -- belt
data.raw["item"]["planetaris-hyper-transport-belt"].order = "a[transport-belt]-e-a[hyper-transport-belt]" -- before superior
PlanetarisLib.add_or_replace_recipe_ingredient("kr-superior-transport-belt", "turbo-transport-belt", {type = "item", name = "planetaris-hyper-transport-belt", amount = 1})

    -- undergroud
data.raw["item"]["planetaris-hyper-underground-belt"].order = "b[underground-belt]-e-a[hyper-underground-belt]" -- before superior
PlanetarisLib.add_or_replace_recipe_ingredient("kr-superior-underground-belt", "turbo-underground-belt", {type = "item", name = "planetaris-hyper-underground-belt", amount = 1})

    -- splitter
data.raw["item"]["planetaris-hyper-splitter"].order = "c[splitter]-e-a[hyper-splitter]" -- before superior
PlanetarisLib.add_or_replace_recipe_ingredient("kr-superior-splitter", "turbo-splitter", {type = "item", name = "planetaris-hyper-splitter", amount = 1})


   ---------------------Add kr hyper loader

if settings.startup["kr-loaders"].value then

local graphics = require("__Krastorio2-spaced-out__.prototypes.buildings.loader-graphics")
local sounds = require("__base__.prototypes.entity.sounds")

data:extend({
  {
    type = "recipe",
    name = "kr-hyper-loader",
    category = "electromagnetics",
    energy_required = 2,
    enabled = false,
    ingredients = {
      { type = "item", name = "planetaris-hyper-transport-belt", amount = 1 },
      { type = "item", name = "kr-advanced-loader", amount = 2 },
      { type = "item", name = "planetaris-silica", amount = 20 },
      { type = "fluid", name = "lubricant", amount = 40 },
    },
    results = { { type = "item", name = "kr-hyper-loader", amount = 1 } },
    surface_conditions = {{property = "planetaris-dust-concentration", min = 50, max = 100, }},
  },
  {
    type = "item",
    name = "kr-hyper-loader",
    icon = "__planetaris-arig__/graphics/compat/k2so/icons/hyper-loader.png",
    subgroup = "belt",
    order = "d[loader]-a4[kr-advanced-loader]-a",
    place_result = "kr-hyper-loader",
    stack_size = 50,
    weight = 40*kg,
    default_import_location = "arig",
  },
  {
    type = "loader-1x1",
    name = "kr-hyper-loader",
    icon = "__planetaris-arig__/graphics/compat/k2so/icons/hyper-loader.png",
    flags = { "placeable-neutral", "player-creation" },
    minable = { mining_time = 0.25, result = "kr-hyper-loader" },
    placeable_by = { item = "kr-hyper-loader", count = 1 },
    fast_replaceable_group = "transport-belt",
    next_upgrade = "kr-superior-loader",
    collision_box = { { -0.4, -0.45 }, { 0.4, 0.45 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    speed = 0.15625,
    max_belt_stack_size = 4,
    adjustable_belt_stack_size = true,
    container_distance = 0.75,
    filter_count = 5,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      drain = "1.2kW",
    },
    energy_per_item = "9kJ",
    max_health = 300,
    heating_energy = "50kW",
    corpse = "small-remnants",
    resistances = { { type = "fire", percent = 90 } },
    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,
    belt_animation_set = hyper_belt_animation_set,
    animation_speed_coefficient = 32,
    icon_draw_specification = {scale = 0.7},
    structure = graphics.structure({ 240, 240, 240 }),
    structure_render_layer = graphics.structure_render_layer,
    circuit_wire_max_distance = default_circuit_wire_max_distance,
  },
})

PlanetarisLib.add_or_replace_recipe_ingredient("kr-superior-loader", "kr-advanced-loader", {type = "item", name = "kr-hyper-loader", amount = 2})

  if mods["planetaris-hyarion"] then
    data.raw.item["kr-hyper-loader"].default_import_location = "hyarion"
    data.raw.recipe["kr-hyper-loader"].surface_conditions = {{property = "planetaris-crystalization-resistance", min = 50, max = 100, }}
  end

end