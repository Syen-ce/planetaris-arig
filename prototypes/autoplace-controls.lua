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
      }
})