if not mods["science-tab"] then return end

if not data.raw["item-subgroup"]["science-tab-planetaris-science-pack"] then
    data:extend {
        {
            type = "item-subgroup",
            name = "science-tab-planetaris-science-pack",
            group = "science",
            order = "p[planetaris-science-pack]"
        }
    }
end

data.raw.tool["planetaris-compression-science-pack"].subgroup = "science-tab-planetaris-science-pack"
data.raw.tool["planetaris-compression-science-pack"].order = "a[arig]-a"

if mods["Krastorio2-spaced-out"] then
    if data.raw["item-group"]["science"] then
            data.raw.item["kr-compression-research-data"].subgroup = 'krastorio-research-data'
            data.raw.recipe["kr-compression-research-data"].subgroup = 'krastorio-research-data'
    end
end