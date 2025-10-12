local simulations = require("__space-age__/prototypes/tips-and-tricks-simulations")

data:extend {{
    type = "tips-and-tricks-item",
    name = "arig-briefing",
    category = "space-age",
    tag = "[planet=arig]",
    indent = 0,
    order = "e-a",
    trigger = {
        type = "research",
        technology = "planet-discovery-arig"
    },
    skip_trigger = {
        type = "or",
        triggers = {
            {
                type = "change-surface",
                surface = "arig"
            },
        }
    },
    simulation = {
        init_update_count = 200,
        planet = "arig",
        mute_wind_sounds = false,
        init =
        [[
            game.simulation.camera_position = {0, 1.5}

            for x = -11, 10, 1 do
            for y = -4, 6 do
                game.surfaces[1].set_tiles{{position = {x, y}, name = "planetaris-sandstone-1"}}
            end
            end
            
            for k, position in pairs ({
                {-1, 7},{-1, 8},
                {0, 5},{0, 6},{0, 7},{0, 8},
                {1, 3},{1, 4},{1, 5},{1, 6},{1, 7},
                {1, -3},{1, -4},{1, -5},{1, -6},
                {0, -4},{0, -5},{0, -6}}) do
            game.surfaces[1].set_tiles{{position = position, name = "arig-sand"}}
            end

            for x = 2, 10, 1 do
            for y = -10, 10 do
                game.surfaces[1].set_tiles{{position = {x, y}, name = "arig-sand"}}
            end
            end

             for k, position in pairs ({
                {-8, 0},{-9, 0},{-10, 0},{-11, 0},
                {-7, 1},{-8, 1},{-9, 1},{-10, 1},{-11, 1},
                {-7, 2},{-8, 2},{-9, 2},{-10, 2},{-10, 2},
                {-6, 3},{-7, 3},{-8, 3},{-9, 3},{-10, 3},{-11, 3},
                {-5, 4},{-6, 4},{-7, 4},{-8, 4},{-9, 4},{-10, 4},{-11, 4},
                {-5, 5},{-6, 5},{-7, 5},{-8, 5},{-9, 5},{-10, 5},{-11, 5},
                {-4, 6},{-5, 6},{-6, 6},{-7, 6},{-8, 6},{-9, 6},{-10, 6},{-11, 6}
                }) do
            game.surfaces[1].set_tiles{{position = position, name = "planetaris-arig-rock"}}
            end

            for k, position in pairs ({
                {-12, -5},{-11, -5},{-10, -5},{-9, -5},{-9, -5},{-8, -5},
                {-12, -4},{-11, -4},{-10, -4},{-9, -4},{-9, -4},{-8, -4},
                {-12, -3},{-11, -3},{-10, -3},{-9, -3},{-9, -3},
                {-12, -2},{-11, -2},{-10, -2},{-9, -2},{-9, -2}}) do
            game.surfaces[1].set_tiles{{position = position, name = "planetaris-sandstone-3"}}
            end

            local create_list = {}
                for k, position in pairs ({{-5, -2},{-7, -3},{-10, -1}}) do
                table.insert(create_list, { name = "arig-small-cactus", position = position, amount = 1})
                end
                for k, position in pairs ({{-10, 5}}) do
                table.insert(create_list, { name = "arig-crack-decal", position = position, amount = 1})
                end
                for k, position in pairs ({{-3, 2}}) do
                table.insert(create_list, { name = "arig-crack-decal-large", position = position, amount = 1})
                end
                for k, position in pairs ({{-10, 3},{-6, 6}}) do
                table.insert(create_list, { name = "arig-small-sand-rock", position = position, amount = 1})
                end
                for k, position in pairs ({{-8, 3},{-10, 5},{-10, 4},{-7, 6},{-8, 4},{-4, -1},{-9, -2}}) do
                table.insert(create_list, { name = "arig-tiny-rock-cluster", position = position, amount = 1})
                end
                for k, position in pairs ({{-3, -1}}) do
                table.insert(create_list, { name = "arig-dune-decal", position = position, amount = 1})
                end
            game.surfaces[1].create_decoratives{decoratives = create_list}

            game.surfaces[1].create_entity{name = "arig-big-sand-rock", position = {-9, 4}}
            game.surfaces[1].create_entity{name = "arig-big-sand-rock", position = {-7, 5}}
            game.surfaces[1].create_entity{name = "arig-crash", position = {7, -2}}
        ]]
}
}}

data:extend {{
    type = "tips-and-tricks-item",
    name = "hyarion-briefing",
    category = "space-age",
    tag = "[planet=hyarion]",
    indent = 0,
    order = "e-a-b",
    trigger = {
        type = "research",
        technology = "planet-discovery-hyarion"
    },
    skip_trigger = {
        type = "or",
        triggers = {
            {
                type = "change-surface",
                surface = "hyarion"
            },
        }
    },
    simulation = {
        init_update_count = 200,
        planet = "hyarion",
        mute_wind_sounds = false,
        init =
        [[
            game.simulation.camera_position = {0, 1.5}

            for x = -11, 10, 1 do
            for y = -12, 12 do
                game.surfaces[1].set_tiles{{position = {x, y}, name = "hyarion-soil-light"}}
            end
            end

            for x = 2, 10, 1 do
            for y = -10, 10 do
                game.surfaces[1].set_tiles{{position = {x, y}, name = "hyarion-crystal-light"}}
            end
            end

             for k, position in pairs ({
                {1, -10},{1, -9},{1, -8},{1, -7},{1, 0},{1, 1},{1, 2},{1, 3},{1, 4},{1, 5},{1, 6},{1, 7},{1, 8},{1, 9},{1, 10},
                {0, -10},{0, -9},{0, -8},{0, 2},{0, 3},{0, 4},{0, 5},{0, 6},{0, 7},{0, 8},{0, 9},{0, 10},
                {-1, -10},{-1, -9},{-1, 4},{-1, 5},{-1, 6},{-1, 7},{-1, 8},{0-1, 9},{-1, 10},
                }) do
            game.surfaces[1].set_tiles{{position = position, name = "hyarion-crystal-light"}}
            end

             for k, position in pairs ({
                {-8, 0},{-9, 0},{-10, 0},{-11, 0},
                {-7, 1},{-8, 1},{-9, 1},{-10, 1},{-11, 1},
                {-7, 2},{-8, 2},{-9, 2},{-10, 2},{-10, 2},
                {-6, 3},{-7, 3},{-8, 3},{-9, 3},{-10, 3},{-11, 3},
                {-5, 4},{-6, 4},{-7, 4},{-8, 4},{-9, 4},{-10, 4},{-11, 4},
                {-5, 5},{-6, 5},{-7, 5},{-8, 5},{-9, 5},{-10, 5},{-11, 5},
                {-4, 6},{-5, 6},{-6, 6},{-7, 6},{-8, 6},{-9, 6},{-10, 6},{-11, 6}
                }) do
            game.surfaces[1].set_tiles{{position = position, name = "hyarion-folds"}}
            end

            for k, position in pairs ({
                {-12, -5},{-11, -5},{-10, -5},{-9, -5},{-9, -5},{-8, -5},
                {-12, -4},{-11, -4},{-10, -4},{-9, -4},{-9, -4},{-8, -4},
                {-12, -3},{-11, -3},{-10, -3},{-9, -3},{-9, -3},
                {-12, -2},{-11, -2},{-10, -2},{-9, -2},{-9, -2}}) do
            game.surfaces[1].set_tiles{{position = position, name = "hyarion-cracks-warm"}}
            end

            for k, position in pairs ({
                {-12, 7},{-12, 6},{-12, 5},{-12, 4},{-12, 3},
                {-11, 7},{-11, 6},{-11, 5},{-11, 4},{-11, 3},
                {-10, 7},{-10, 6},{-10, 5},{-10, 4},
                {-9, 7},{-9, 6},{-9, 5},{-9, 4},
                {-8, 7},{-8, 6},
                }) do
            game.surfaces[1].set_tiles{{position = position, name = "lava"}}
            end

            local create_list = {}
                for k, position in pairs ({{-10, -1},{2, 2}}) do
                table.insert(create_list, { name = "hyarion-crack-decal-large", position = position, amount = 1})
                end
                for k, position in pairs ({{8,-4},{8,-3},{8,-5},{9,-4},{9,-4}}) do
                table.insert(create_list, { name = "hyarion-small-crystal", position = position, amount = 1})
                end
                for k, position in pairs ({{-3, 2}}) do
                table.insert(create_list, { name = "hyarion-crack-decal", position = position, amount = 1})
                end
                for k, position in pairs ({{-4,-3},{-5,-2},{-5,0},{-4,-3},{-3,-3},{-2,-1},{-3,-4},{-4,-5},{-3,-6}}) do
                table.insert(create_list, { name = "hyarion-tiny-rock-cluster", position = position, amount = 1})
                end
                for k, position in pairs ({{-3, -1},{-5, -1},{-8, -2}}) do
                table.insert(create_list, { name = "hyarion-rock-decal-large", position = position, amount = 1})
                end
            game.surfaces[1].create_decoratives{decoratives = create_list}

            game.surfaces[1].create_entity{name = "ruby-geode", position = {4, -1}}
            game.surfaces[1].create_entity{name = "sapphire-geode", position = {6, 6}}
            game.surfaces[1].create_entity{name = "hyarion-pointy-crystal", position = {3, -4}}
            game.surfaces[1].create_entity{name = "hyarion-pointy-crystal", position = {10, 5}}
            game.surfaces[1].create_entity{name = "hyarion-huge-volcanic-rock", position = {-5,-2}}
            game.surfaces[1].create_entity{name = "hyarion-huge-volcanic-rock", position = {-6,-3}}
            game.surfaces[1].create_entity{name = "hyarion-big-volcanic-rock", position = {-6,-1}}
            game.surfaces[1].create_entity{name = "hyarion-big-volcanic-rock", position = {-4,-3}}
            game.surfaces[1].create_entity{name = "hyarion-chimney-truncated", position = {8, 1}}
            game.surfaces[1].create_entity{name = "hyarion-chimney-truncated", position = {6, 4}}
            game.surfaces[1].create_entity{name = "hyarion-chimney-cold", position = {2, 5}}
        ]]
}
}}