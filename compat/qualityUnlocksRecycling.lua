if not mods["QualityUnlocksRecycling"] then return end

-- Remove surface conditions from recycler recipe to allow crafting on any surface
if data.raw.recipe["recycler"] then
  data.raw.recipe["recycler"].surface_conditions = nil
end