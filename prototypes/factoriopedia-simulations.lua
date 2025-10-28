require("__base__/prototypes/factoriopedia-util");
local simulations = {}

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

return simulations
