if not mods["LithiumBattery"] then return end


if settings.startup["disable-hyper-belts"].value == true then

    if data.raw.technology["planetaris-hyper-transport-belt"] then
        data.raw.technology["planetaris-hyper-transport-belt"].hidden = true
    end

    if data.raw.item["planetaris-hyper-underground-belt"] then
        data.raw.recipe["planetaris-hyper-underground-belt"].hidden = true
        data.raw.item["planetaris-hyper-underground-belt"].hidden = true
        data.raw["underground-belt"]["planetaris-hyper-underground-belt"].hidden = true
    end

    if data.raw.item["planetaris-hyper-splitter"] then
        data.raw.recipe["planetaris-hyper-splitter"].hidden = true
        data.raw.item["planetaris-hyper-splitter"].hidden = true
        data.raw["splitter"]["planetaris-hyper-splitter"].hidden = true
    end

    if data.raw.item["planetaris-hyper-transport-belt"] then
        data.raw.recipe["planetaris-hyper-transport-belt"].hidden = true
        data.raw.item["planetaris-hyper-transport-belt"].hidden = true
        data.raw["transport-belt"]["planetaris-hyper-transport-belt"].hidden = true
    end

    if mods["aai-loaders"] and data.raw["loader"]["aai-hyper-loader"] then
        data.raw.recipe["aai-hyper-loader"].hidden = true
        data.raw.item["aai-hyper-loader"].hidden = true
        data.raw["loader"]["aai-hyper-loader"].hidden = true
        data.raw.technology["aai-hyper-loader"].hidden = true
    end

end