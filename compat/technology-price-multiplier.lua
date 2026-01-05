if not mods["TechnologyPriceMultiplier"] then return end

if settings.startup["ignore-arig-tech-price-exponent"].value == true then
    data.raw["technology"]["planetaris-sandstone-foundation"].essential = false
    data.raw["technology"]["planetaris-advanced-sand-sifting"].essential = false
    data.raw["technology"]["planetaris-silica-processing"].essential = false
    data.raw["technology"]["planetaris-arig-roboport"].essential = false
    data.raw["technology"]["planetaris-water-harvesting"].essential = false
    data.raw["technology"]["planetaris-hyper-transport-belt"].essential = false
    data.raw["technology"]["planetaris-big-chest"].essential = false
    data.raw["technology"]["planetaris-advanced-solar-panel"].essential = false
    data.raw["technology"]["planetaris-supported-solar-panel"].essential = false
    data.raw["technology"]["planetaris-raw-quartz-productivity"].essential = false
    data.raw["technology"]["planetaris-heavy-glass-productivity"].essential = false
    data.raw["technology"]["planetslib-arig-cargo-drops"].essential = false
end

-- if settings.startup["ignore-arig-tech-price-exponent"].value == false then
--     data.raw["technology"]["planetaris-sandstone-foundation"].essential = false
--     data.raw["technology"]["planetaris-advanced-sand-sifting"].essential = false
--     data.raw["technology"]["planetaris-silica-processing"].essential = false
--     data.raw["technology"]["planetaris-arig-roboport"].essential = false
--     data.raw["technology"]["planetaris-water-harvesting"].essential = false
--     data.raw["technology"]["planetaris-hyper-transport-belt"].essential = false
--     data.raw["technology"]["planetaris-big-chest"].essential = false
--     data.raw["technology"]["planetaris-advanced-solar-panel"].essential = false
--     data.raw["technology"]["planetaris-supported-solar-panel"].essential = false
--     data.raw["technology"]["planetaris-raw-quartz-productivity"].essential = false
--     data.raw["technology"]["planetaris-heavy-glass-productivity"].essential = false
--     data.raw["technology"]["planetslib-arig-cargo-drops"].essential = false
-- end