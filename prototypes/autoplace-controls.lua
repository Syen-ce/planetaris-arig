data:extend({

    -- ARIG
    {
        type = "autoplace-control",
        name = "arig_cliff",
        category = "cliff",
        order = "c-z-c",
    },
    {
        type = "autoplace-control",
        name = "arig_sand",
        order = "c-z-b-b",
        category = "terrain",
        can_be_disabled = false,
    },
    {
        type = "autoplace-control",
        name = "arig_rocks",
        order = "c-z-b-a",
        category = "terrain",
        can_be_disabled = false,
    },
    {
        type = "autoplace-control",
        name = "arig_crash",
        order = "c-z-b-a",
        category = "terrain",
        can_be_disabled = false,
    },
    {
        type = "autoplace-control",
        name = "heavy-oil-geyser",
        localised_name = {"", "[entity=heavy-oil-geyser] ", {"entity-name.heavy-oil-geyser"}},
        richness = true,
        order = "b-e",
        category = "resource"
      },

    -- HYARION
    {
        type = "autoplace-control",
        name = "hyarion_volcanism",
        order = "e-z-a",
        category = "terrain",
        can_be_disabled = true
    },
    {
        type = "autoplace-control",
        name = "hyarion_iron",
        localised_name = {"", "[entity=planetaris-metallic-ore] ", {"entity-name.planetaris-metallic-ore"}},
        order = "e-z-a",
        category = "resource",
        richness = true,
        can_be_disabled = true,
    },
    {
        type = "autoplace-control",
        name = "hyarion_carbon",
        localised_name = {"", "[entity=planetaris-carbon-ore] ", {"entity-name.planetaris-carbon-ore"}},
        order = "e-z-a",
        category = "resource",
        richness = true,
        can_be_disabled = true,
    },
    {
        type = "autoplace-control",
        name = "hyarion_quartz",
        localised_name = {"", "[entity=planetaris-quartz-ore] ", {"entity-name.planetaris-quartz-ore"}},
        order = "e-z-a",
        category = "resource",
        richness = true,
        can_be_disabled = true,
    },
    {
        type = "autoplace-control",
        name = "hyarion_emerald",
        localised_name = {"", "[entity=emerald-geode] ", {"entity-name.emerald-geode"}},
        order = "e-z-b",
        category = "resource",
        richness = true,
        can_be_disabled = true,
    },
    {
        type = "autoplace-control",
        name = "hyarion_ruby",
        localised_name = {"", "[entity=ruby-geode] ", {"entity-name.ruby-geode"}},
        order = "e-z-b",
        category = "resource",
        richness = true,
        can_be_disabled = true,
    },
    {
        type = "autoplace-control",
        name = "hyarion_sapphire",
        localised_name = {"", "[entity=sapphire-geode] ", {"entity-name.sapphire-geode"}},
        order = "e-z-b",
        category = "resource",
        richness = true,
        can_be_disabled = true,
    },
})