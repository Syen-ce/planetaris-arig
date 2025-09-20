require("__base__/prototypes/factoriopedia-util");
local simulations = {}

-----------////////////////////////////////////////////////////////////// INTERMEDIATE PRODUCTS

simulations.factoriopedia_carbon_ore = { init = make_resource("planetaris-carbon-ore") }
simulations.factoriopedia_metallic_ore = { init = make_resource("planetaris-metallic-ore") }
simulations.factoriopedia_quartz_ore = { init = make_resource("planetaris-quartz-ore") }

-----------////////////////////////////////////////////////////////////// CLIFF

simulations.factoriopedia_cliff_arig =
{
  planet = "arig",
  hide_factoriopedia_gradient = true,
  init =
  [[
    game.simulation.camera_position = {0, 2.5}
    for x = -8, 8, 1 do
      for y = -3, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "planetaris-sandstone-3"}}
      end
    end
    for x = -8, 8, 4 do
      game.surfaces[1].create_entity{name = "arig-cliff", position = {x, 0}, cliff_orientation = "west-to-east"}
    end
  ]]
}

simulations.factoriopedia_cliff_hyarion =
{
  planet = "hyarion",
  hide_factoriopedia_gradient = true,
  init =
  [[
    game.simulation.camera_position = {0, 2.5}
    for x = -8, 8, 1 do
      for y = -3, 4 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "hyarion-ash-soil"}}
      end
    end
    for x = -8, 8, 4 do
      game.surfaces[1].create_entity{name = "hyarion-cliff", position = {x, 0}, cliff_orientation = "west-to-east"}
    end
  ]]
}

simulations.factoriopedia_hyarion_crater_cliff =
{
  planet = "hyarion",
  hide_factoriopedia_gradient = true,
  init =
  [[
    game.simulation.camera_zoom = 0.5
    game.simulation.camera_position = {-0.5, 1.5}
    for x = -28, 24, 1 do
      for y = -10, 14 do
        game.surfaces[1].set_tiles{{position = {x, y}, name = "hyarion-ash-soil"}}
      end
    end

    game.surfaces[1].create_entity{name = "hyarion-crater-cliff", position = {-0.5, -3.324}, cliff_orientation = "west-to-east"}
    game.surfaces[1].create_entity{name = "hyarion-crater-cliff", position = {-5.44922, -1.875}, cliff_orientation = "south-to-east"}
    game.surfaces[1].create_entity{name = "hyarion-crater-cliff", position = {4.4492, -1.875}, cliff_orientation = "west-to-south"}
    game.surfaces[1].create_entity{name = "hyarion-crater-cliff", position = {-7.5, 1.625}, cliff_orientation = "south-to-north"}
    game.surfaces[1].create_entity{name = "hyarion-crater-cliff", position = {6.5, 1.625}, cliff_orientation = "north-to-south"}
    game.surfaces[1].create_entity{name = "hyarion-crater-cliff", position = {-5.44922, 5.121}, cliff_orientation = "east-to-north"}
    game.surfaces[1].create_entity{name = "hyarion-crater-cliff", position = {4.4492, 5.121}, cliff_orientation = "north-to-west"}
  ]]
}

-----------////////////////////////////////////////////////////////////// PRODUCTION

local make_collector_simulation = function(name, zoom, X, Y)
  return
  [[
    require("__core__/lualib/story")
    game.simulation.camera_zoom = ]]..zoom..[[
    game.simulation.camera_position = {]]..X..[[, ]]..Y..[[}
    game.surfaces[1].create_entity{name = "]]..name..[[", position = {0, 0}}
    local story_table =
    {
      {
        {
          name = "start",
          action = function() game.surfaces[1].execute_lightning{name = "planetaris-refraction-ray", position = {0, 2}} end
        },
        {
          condition = story_elapsed_check(1),
          action = function() story_jump_to(storage.story, "start") end
        }
      }
    }
    tip_story_init(story_table)
  ]]
end

simulations.factoriopedia_big_refraction_ray_collector = { planet = "hyarion", init = make_collector_simulation("planetaris-big-refraction-ray-collector", "1.4", "0", "-1") }
simulations.factoriopedia_refraction_ray_collector = { planet = "hyarion", init = make_collector_simulation("planetaris-refraction-ray-collector", "1.4", "0.5", "-2") }

simulations.factoriopedia_refraction_ray =
{
  planet = "hyarion",
  init =
  [[
    require("__core__/lualib/story")
    game.simulation.camera_position = {0, 0}
    local story_table =
    {
      {
        {
          name = "start",
          action = function() game.surfaces[1].execute_lightning{name = "planetaris-refraction-ray", position = {0, 0.5}} end
        },
        {
          condition = story_elapsed_check(1),
          action = function() story_jump_to(storage.story, "start") end
        }
      }
    }
    tip_story_init(story_table)
  ]]
}



return simulations
