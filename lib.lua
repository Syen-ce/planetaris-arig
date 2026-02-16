local Public = {}


function add_ingredient_if_missing(tech_name, ingredient_name)
  local tech = data.raw.technology[tech_name]
  if not tech or not tech.unit or not tech.unit.ingredients then return end
  
  for _, ingredient in ipairs(tech.unit.ingredients) do
    if ingredient[1] == ingredient_name then
      return  -- Already has it
    end
  end
  
  table.insert(tech.unit.ingredients, {ingredient_name, 1})
end

function add_prerequisite_if_missing(tech_name, prereq_name)
  local tech = data.raw.technology[tech_name]
  if not tech or not tech.prerequisites then return end
  
  for _, prereq in ipairs(tech.prerequisites) do
    if prereq == prereq_name then
      return  -- Already has it
    end
  end
  
  table.insert(tech.prerequisites, prereq_name)
end


function Public.merge(old, new)
	old = util.table.deepcopy(old)

	for k, v in pairs(new) do
		if v == "nil" then
			old[k] = nil
		else
			old[k] = v
		end
	end

	return old
end

Public.find = function(tbl, f, ...)
	if type(f) == "function" then
		for k, v in pairs(tbl) do
			if f(v, k, ...) then
				return v, k
			end
		end
	else
		for k, v in pairs(tbl) do
			if v == f then
				return v, k
			end
		end
	end
	return nil
end

return Public