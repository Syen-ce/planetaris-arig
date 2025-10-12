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
        can_be_disabled = false
    },
    {
        type = "autoplace-control",
        name = "hyarion_iron",
        order = "e-z-a",
        category = "resource",
        richness = true,
        can_be_disabled = false,
    },
    {
        type = "autoplace-control",
        name = "hyarion_carbon",
        order = "e-z-a",
        category = "resource",
        richness = true,
        can_be_disabled = false,
    },
    {
        type = "autoplace-control",
        name = "hyarion_quartz",
        order = "e-z-b",
        category = "resource",
        richness = true,
        can_be_disabled = false,
    },
    {
        type = "autoplace-control",
        name = "hyarion_emerald",
        order = "e-z-b",
        category = "resource",
        richness = true,
        can_be_disabled = false,
    },
    {
        type = "autoplace-control",
        name = "hyarion_ruby",
        order = "e-z-b",
        category = "resource",
        richness = true,
        can_be_disabled = false,
    },
    {
        type = "autoplace-control",
        name = "hyarion_sapphire",
        order = "e-z-b",
        category = "resource",
        richness = true,
        can_be_disabled = false,
    },
})