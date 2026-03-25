PlanetarisLib =
{
  table = {}
}

PlanetarisLib.item_recipe_blacklist = {
    ["item"] = true,
    ["recipe"] = true,
    ["fluid"] = true,
    ["technology"] = true,
    ["item-with-entity-data"] = true,
    ["selection-tool"] = true,
    ["repair-tool"] = true,
    ["armor"] = true,
    ["gun"] = true,
    ["ammo"] = true,
    ["capsule"] = true,
    ["module"] = true,
    ["tool"] = true,
    ["blueprint"] = true,
    ["deconstruction-item"] = true,
    ["upgrade-item"] = true,
    ["spidertron-remote"] = true,
}

PlanetarisLib.item_types = {
    ["item"] = true,
    ["fluid"] = true,
    ["item-with-entity-data"] = true,
    ["selection-tool"] = true,
    ["repair-tool"] = true,
    ["armor"] = true,
    ["gun"] = true,
    ["ammo"] = true,
    ["capsule"] = true,
    ["module"] = true,
    ["tool"] = true,
    ["blueprint"] = true,
    ["deconstruction-item"] = true,
    ["upgrade-item"] = true,
    ["spidertron-remote"] = true,
}


------------- FROM KRASTORIO DATA UTIL
--- Prints the given error message to the log, or invokes a script error if in debug mode.
--- @param message string
function PlanetarisLib.error(message)
	if DEBUG then
		error(message)
	else
		local output = "\n      PLANETARIS ERROR: " .. message
		local i = 2
		while true do
			local info = debug.getinfo(i, "nSl")
			if not info then
				break
			end

			output = output .. "\n        " .. info.source .. ":" .. info.currentline
			if info.name then
				output = output .. " in function '" .. info.name .. "'"
			else
				output = output .. " in main chunk"
			end

			i = i + 1
		end
		log(output)
	end
end

--- @param target_name string
--- @return string|nil, table|nil
function PlanetarisLib.find_prototype(target_name)
	local priority = {"entity", "assembling-machine", "furnace", "mining-drill", "recipe", "pipe", "pipe-to-ground", "storage-tank"}
	for _, type_name in ipairs(priority) do
		if data.raw[type_name] and data.raw[type_name][target_name] then
			return type_name, data.raw[type_name][target_name]
		end
	end
	-- Fall back to searching everything
	for type_name, prototypes in pairs(data.raw) do
		if type(prototypes) == "table" and prototypes[target_name] then
			return type_name, prototypes[target_name]
		end
	end
	return nil, nil
end

function PlanetarisLib.find_entity(entity_name)
    for type_name, prototypes in pairs(data.raw) do
        if not PlanetarisLib.item_recipe_blacklist[type_name] and type(prototypes) == "table" and prototypes[entity_name] then
            return type_name, prototypes[entity_name]
        end
    end
    return nil, nil
end

---------------------------------------------------------------------------
------------------------- General
---------------------------------------------------------------------------

--- @param original table
--- @return table
function PlanetarisLib.deep_copy(original)
	local copy
	if type(original) == "table" then
		copy = {}
		for k, v in pairs(original) do
			copy[PlanetarisLib.deep_copy(k)] = PlanetarisLib.deep_copy(v)
		end
		setmetatable(copy, PlanetarisLib.deep_copy(getmetatable(original)))
	else
		copy = original
	end
	return copy
end

--- @param t table
--- @param value any
--- @return boolean
function PlanetarisLib.table_contains(t, value)
	for _, v in pairs(t) do
		if v == value then
			return true
		end
	end
	return false
end


---------------------------------------------------------------------------
------------------------- Recipes
---------------------------------------------------------------------------

--- Add or replace new ingredient
--- @param recipe_name data.RecipeID
--- @param old_ingredient_name data.FluidID|data.ItemID
--- @param new_ingredient data.IngredientPrototype
function PlanetarisLib.add_or_replace_recipe_ingredient(recipe_name, old_ingredient_name, new_ingredient)
	local recipe = data.raw.recipe[recipe_name]
	if not recipe then
		PlanetarisLib.error("Recipe " .. recipe_name .. " does not exist.")
		return
	end
	if not recipe.ingredients then
		recipe.ingredients = { new_ingredient }
		return
	end
	for i, ingredient in pairs(recipe.ingredients) do
		if ingredient.name == old_ingredient_name then
			recipe.ingredients[i] = new_ingredient
			return
		end
	end
	table.insert(recipe.ingredients, new_ingredient)
end

--- Converts name of ingredient into another, keeps the rest of properties
--- @param recipe_name data.RecipeID
--- @param old_ingredient_name data.FluidID|data.ItemID
--- @param new_ingredient_name data.FluidID|data.ItemID
function PlanetarisLib.convert_recipe_ingredient(recipe_name, old_ingredient_name, new_ingredient_name)
	local recipe = data.raw.recipe[recipe_name]
	if not recipe then
		PlanetarisLib.error("Recipe " .. recipe_name .. " does not exist.")
		return
	end
	if not recipe.ingredients then
		PlanetarisLib.error("Recipe " .. recipe_name .. " has no ingredients.")
		return
	end
	for _, ingredient in pairs(recipe.ingredients) do
		if ingredient.name == old_ingredient_name then
			ingredient.name = new_ingredient_name
			break
		end
	end
end

--- Removes ingredient
--- @param recipe_name data.RecipeID
--- @param ingredient_name data.FluidID|data.ItemID
function PlanetarisLib.remove_recipe_ingredient(recipe_name, ingredient_name)
	local recipe = data.raw.recipe[recipe_name]
	if not recipe then
		PlanetarisLib.error("Recipe " .. recipe_name .. " does not exist.")
		return
	end
	if not recipe.ingredients then
		PlanetarisLib.error("Recipe " .. recipe_name .. " has no ingredients.")
		return
	end
	for i, ingredient in pairs(recipe.ingredients) do
		if ingredient.name == ingredient_name then
			table.remove(recipe.ingredients, i)
			return
		end
	end
	PlanetarisLib.error("Recipe " .. recipe_name .. " does not have ingredient " .. ingredient_name .. ".")
end

--- Scales an ingredient by a multiplier and rounds it
--- @param recipe_name data.RecipeID
--- @param ingredient_name data.FluidID|data.ItemID
--- @param multiplier number
function PlanetarisLib.scale_recipe_ingredient_amount(recipe_name, ingredient_name, multiplier)
	local recipe = data.raw.recipe[recipe_name]
	if not recipe then
		PlanetarisLib.error("Recipe " .. recipe_name .. " does not exist.")
		return
	end
	if not recipe.ingredients then
		PlanetarisLib.error("Recipe " .. recipe_name .. " has no ingredients.")
		return
	end
	for _, ingredient in pairs(recipe.ingredients) do
		if ingredient.name == ingredient_name then
			ingredient.amount = math.max(1, math.floor(ingredient.amount * multiplier + 0.5))
			return
		end
	end
	PlanetarisLib.error("Recipe " .. recipe_name .. " does not have ingredient " .. ingredient_name .. ".")
end

--- Adds or replaces a result in a recipe
--- @param recipe_name data.RecipeID
--- @param old_result_name data.FluidID|data.ItemID
--- @param new_result data.ProductPrototype
function PlanetarisLib.add_or_replace_recipe_result(recipe_name, old_result_name, new_result)
	local recipe = data.raw.recipe[recipe_name]
	if not recipe then
		PlanetarisLib.error("Recipe " .. recipe_name .. " does not exist.")
		return
	end
	if not recipe.results then
		recipe.results = { new_result }
		return
	end
	for i, result in pairs(recipe.results) do
		if result.name == old_result_name then
			recipe.results[i] = new_result
			return
		end
	end
	table.insert(recipe.results, new_result)
end

--- Removes a result from a recipe
--- @param recipe_name data.RecipeID
--- @param result_name data.FluidID|data.ItemID
function PlanetarisLib.remove_recipe_result(recipe_name, result_name)
	local recipe = data.raw.recipe[recipe_name]
	if not recipe then
		PlanetarisLib.error("Recipe " .. recipe_name .. " does not exist.")
		return
	end
	if not recipe.results then
		PlanetarisLib.error("Recipe " .. recipe_name .. " has no results.")
		return
	end
	for i, result in pairs(recipe.results) do
		if result.name == result_name then
			table.remove(recipe.results, i)
			return
		end
	end
	PlanetarisLib.error("Recipe " .. recipe_name .. " does not have result " .. result_name .. ".")
end

--- Adds a crafting category
--- @param recipe_name string
--- @param category string
function PlanetarisLib.set_recipe_category(recipe_name, category)
    local recipe = data.raw.recipe[recipe_name]
    if not recipe then
        PlanetarisLib.error("Recipe:" .. recipe_name .. " does not exist.")
        return
    end
    recipe.crafting_categories = category
end

--- Hide recipe in factoriopedia
--- @param recipe_name string
function PlanetarisLib.hide_recipe_factoriopedia(recipe_name)
	local recipe = data.raw.recipe[recipe_name]
	if not recipe then
        return
    end
    recipe.hidden_in_factoriopedia = true
end

---------------------------------------------------------------------------
------------------------- Entities
---------------------------------------------------------------------------

--- Sets energy usage
--- @param target_type string
--- @param target_name data.EntityID
--- @param energy_usage string  
function PlanetarisLib.set_energy_usage(target_type, target_name, energy_usage)
    local prototype = data.raw[target_type] and data.raw[target_type][target_name]
    if not prototype then
        PlanetarisLib.error(target_type .. ":" .. target_name .. " does not exist.")
        return
    end
    if prototype.energy_usage == nil then
        PlanetarisLib.error(target_name .. " does not have an energy_usage field.")
        return
    end
    prototype.energy_usage = energy_usage
end

--- Sets the minable result of an entity
--- @param target_type string
--- @param target_name data.EntityID
--- @param result_name data.ItemID
--- @param count number|nil
function PlanetarisLib.set_minable_result(target_type, target_name, result_name, count)
    local prototype = data.raw[target_type] and data.raw[target_type][target_name]
    if not prototype then
        PlanetarisLib.error(target_type .. ":" .. target_name .. " does not exist.")
        return
    end
    if not prototype.minable then
        PlanetarisLib.error(target_name .. " is not minable.")
        return
    end
    prototype.minable.results = {{type = "item", name = result_name, amount = count or 1}}
end

--- Adds a minable result to an entity
--- @param target_type string
--- @param target_name data.EntityID
--- @param result_name data.ItemID
--- @param count number|nil
function PlanetarisLib.add_minable_result(target_type, target_name, result_name, count)
    local prototype = data.raw[target_type] and data.raw[target_type][target_name]
    if not prototype then
        PlanetarisLib.error(target_type .. ":" .. target_name .. " does not exist.")
        return
    end
    if not prototype.minable then
        PlanetarisLib.error(target_name .. " is not minable.")
        return
    end
    if not prototype.minable.results then
        prototype.minable.results = {}
    end
    -- Check if result already present
    for _, result in ipairs(prototype.minable.results) do
        if result.name == result_name then
            result.amount = count or result.amount
            return
        end
    end
    table.insert(prototype.minable.results, {type = "item", name = result_name, amount = count or 1})
end

--- Removes a minable result from an entity
--- @param target_type string
--- @param target_name data.EntityID
--- @param result_name data.ItemID
function PlanetarisLib.remove_minable_result(target_type, target_name, result_name)
    local prototype = data.raw[target_type] and data.raw[target_type][target_name]
    if not prototype then
        PlanetarisLib.error(target_type .. ":" .. target_name .. " does not exist.")
        return
    end
    if not prototype.minable or not prototype.minable.results then
        PlanetarisLib.error(target_name .. " has no minable results.")
        return
    end
    for i, result in ipairs(prototype.minable.results) do
        if result.name == result_name then
            table.remove(prototype.minable.results, i)
            return
        end
    end
    PlanetarisLib.error(target_name .. " does not have minable result " .. result_name .. ".")
end

--- Sets the number of module slots on an entity
--- @param target_type string
--- @param target_name data.EntityID
--- @param slot_count number
function PlanetarisLib.set_module_slots(target_type, target_name, slot_count)
    local prototype = data.raw[target_type] and data.raw[target_type][target_name]
    if not prototype then
        PlanetarisLib.error(target_type .. ":" .. target_name .. " does not exist.")
        return
    end
    if prototype.module_slots == nil then
        PlanetarisLib.error(target_name .. " does not support module slots.")
        return
    end
    prototype.module_slots = slot_count
end

---------------------------------------------------------------------------
------------------------- Technologies
---------------------------------------------------------------------------

function PlanetarisLib.add_tech_ingredient_if_missing(tech_name, ingredient_name)
    local tech = data.raw.technology[tech_name]
    if not tech then 
        PlanetarisLib.error("Tech"..tech_name.."dont exist")
    return
    end

    if not tech.unit or not tech.unit.ingredients then
        PlanetarisLib.error("Tech"..tech_name.."unit or ingredient not found")
    end
  
    for _, ingredient in ipairs(tech.unit.ingredients) do
        if ingredient[1] == ingredient_name then
        return  -- Already has it
        end
    end
  
    table.insert(tech.unit.ingredients, {ingredient_name, 1})
end

function PlanetarisLib.add_tech_prerequisite_if_missing(tech_name, prereq_name)
    local tech = data.raw.technology[tech_name]
    if not tech then 
        PlanetarisLib.error("Tech"..tech_name.."dont exist")
        return
    end

    if not tech.prerequisites then
        tech.prerequisites = {{prereq_name}}
    end
  
    for _, prereq in ipairs(tech.prerequisites) do
        if prereq == prereq_name then
        return  -- Already has it
        end
    end
    
    table.insert(tech.prerequisites, prereq_name)
end

--- Removes a prerequisite from a technology
--- @param tech_name data.TechnologyID
--- @param prereq_name data.TechnologyID
function PlanetarisLib.remove_tech_prerequisite(tech_name, prereq_name)
	local tech = data.raw.technology[tech_name]
	if not tech then
		PlanetarisLib.error("Tech " .. tech_name .. " does not exist.")
		return
	end
	if not tech.prerequisites then
		PlanetarisLib.error("Tech " .. tech_name .. " has no prerequisites.")
		return
	end
	for i, prereq in ipairs(tech.prerequisites) do
		if prereq == prereq_name then
			table.remove(tech.prerequisites, i)
			return
		end
	end
	PlanetarisLib.error("Tech " .. tech_name .. " does not have prerequisite " .. prereq_name .. ".")
end

--- Adds a recipe unlock effect to a technology
--- @param tech_name data.TechnologyID
--- @param recipe_name data.RecipeID
function PlanetarisLib.add_tech_unlock(tech_name, recipe_name)
	local tech = data.raw.technology[tech_name]
	if not tech then
		PlanetarisLib.error("Tech " .. tech_name .. " does not exist.")
		return
	end
	if not data.raw.recipe[recipe_name] then
		PlanetarisLib.error("Recipe " .. recipe_name .. " does not exist.")
		return
	end
	if not tech.effects then
		tech.effects = {}
	end
	for _, effect in ipairs(tech.effects) do
		if effect.type == "unlock-recipe" and effect.recipe == recipe_name then
			return -- Already unlocks it
		end
	end
	table.insert(tech.effects, {type = "unlock-recipe", recipe = recipe_name})
end

function PlanetarisLib.technology_icon_constant_preservation(technology_icon)
    if mods["planetaris-tellus"] then
        local icons =
        {
            {
            icon = technology_icon,
            icon_size = 256
            },
            {
            icon = "__planetaris-tellus__/graphics/icons/constant-preservation.png",
            icon_size = 128,
            scale = 0.5,
            shift = {50, 50},
            floating = true
            }
        }
        return icons
    end
    PlanetarisLib.error("Tellus not enabled")
end

---------------------------------------------------------------------------
------------------------- Planets 
---------------------------------------------------------------------------

--- Adds a surface condition to an recipe prototype
--- @param entity_name string
--- @param surface_condition string
--- @param max_amount number|nil
--- @param min_amount number|nil
function PlanetarisLib.add_entity_surface_condition(entity_name, surface_condition, max_amount, min_amount)
    local _, prototype = PlanetarisLib.find_entity(entity_name)
  	if not prototype then
		  PlanetarisLib.error(entity_name .. " does not exist.")
		  return
    end
    local min = min_amount or 1
    local max = max_amount or 50

    if not prototype.surface_conditions then
      prototype.surface_conditions = {{property = surface_condition, max = max, min = min}}
      return
    end
    table.insert(prototype.surface_conditions, {property = surface_condition, max = max, min = min})
end

--- Adds a surface condition to an entity prototype
--- @param recipe_name data.RecipeID
--- @param surface_condition string
--- @param max_amount number|nil
--- @param min_amount number|nil
function PlanetarisLib.add_recipe_surface_condition(recipe_name, surface_condition, max_amount, min_amount)
    local recipe = data.raw.recipe[recipe_name]
  	if not recipe then
		  PlanetarisLib.error("Recipe:" ..recipe_name .. " does not exist.")
		  return
    end
    local min = min_amount or 1
    local max = max_amount or 50

    if not recipe.surface_conditions then
      recipe.surface_conditions = {{property = surface_condition, max = max, min = min}}
      return
    end
    table.insert(recipe.surface_conditions, {property = surface_condition, max = max, min = min})
end

--- @param entity_name string
function PlanetarisLib.clear_entity_surface_condition(entity_name)
    local _, prototype = PlanetarisLib.find_prototype(entity_name)
  	if not prototype then
		  PlanetarisLib.error("Entity:" .. entity_name .. " does not exist.")
		  return
    end
    if prototype.surface_conditions then
      prototype.surface_conditions = {}
    end
end

--- @param recipe_name data.RecipeID
function PlanetarisLib.clear_recipe_surface_condition(recipe_name)
    local recipe = data.raw.recipe[recipe_name]
  	if not recipe then
		  PlanetarisLib.error("Entity:" .. recipe_name .. " does not exist.")
		  return
    end
    if recipe.surface_conditions then
      recipe.surface_conditions = {}
    end
end

--- Removes surface_conditions
--- @param entity_name string
--- @param surface_condition string
function PlanetarisLib.remove_surface_condition(entity_name, surface_condition)
	local _, prototype = PlanetarisLib.find_entity(entity_name)
	if not prototype then
		PlanetarisLib.error("Entity " .. entity_name .. " does not exist.")
		return
	end
	for i, conditions in pairs(prototype.surface_conditions) do
		if conditions.property == surface_condition then
			table.remove(prototype.surface_conditions, i)
			return
		end
	end
end

return PlanetarisLib