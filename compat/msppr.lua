local item_tints = require("__base__.prototypes.item-tints")
local item_sounds = require("__base__.prototypes.item_sounds")

if not mods["multi_surface_promethium_plate_recipe"] then return end

data:extend({
    {
        type = "item",
        name = "msppr-arig",
        icon = "__planetaris-arig__/graphics/compat/msppr-arig.png",
        subgroup = "msppr",
        order = "d[promethium]-r[fulgora]-arig",
        inventory_move_sound = item_sounds.sulfur_inventory_move,
        pick_sound = item_sounds.resource_inventory_pickup,
        drop_sound = item_sounds.sulfur_inventory_move,
        stack_size = 100,
        weight = 1 * kg,
        random_tint_color = item_tints.ice_blue,
    },

    {
        type = "recipe",
        name = "msppr-arig",
        subgroup = "science-pack",
        category = "compressing",
        surface_conditions = {
            {
            property = "planetaris-crystalization-resistance",
            min = 50,
            max = 100,
            }
        },
        enabled = false,
        ingredients = {
            { type = "item",  name = "planetaris-cactus-seeds", amount = 10 },
            { type = "item",  name = "planetaris-raw-diamond", amount = 5 },
            { type = "item",  name = "planetaris-silica", amount = 1 },
            { type = "fluid", name = "planetaris-pure-sand", amount = 20 },
        },
        energy_required = 10,
        msppr = {
            result = { type = "item", name = "msppr-arig", amount = 1 },
            recipe_chain_order = "fulgora-arig",
        },
        results = { { type = "item", name = "msppr-arig", amount = 1 } },
        allow_productivity = false,
        auto_recycle = false,
    },
})
