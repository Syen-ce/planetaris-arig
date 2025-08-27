if not mods.pystellarexpedition then
    data:extend{{
        type = "research-with-science-pack-achievement",
        name = "research-with-compression",
        order = "e[research]-a[research-with]-h[compression]",
        science_pack = "planetaris-compression-science-pack",
        icon = "__planetaris-unbounded__/graphics/achievement/research-with-compression.png",
        icon_size = 128
    }}
end

data:extend{
    {
    type = "change-surface-achievement",
    name = "visit-arig",
    order = "a[progress]-g[visit-planet]-j[arig]",
    surface = "maraxsis",
    icon = "__planetaris-unbounded__/graphics/achievement/visit-arig.png",
    icon_size = 128,
    },
    {
    type = "build-entity-achievement",
    name = "everything-is-better-with-support",
    order = "a[progress]-e[energy-production]-d",
    to_build = "planetaris-supported-solar-panel",
    icon = "__planetaris-unbounded__/graphics/achievement/everything-is-better-with-support.png",
    icon_size = 128
  },
}