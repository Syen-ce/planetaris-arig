-- Condensing Agricultural Tower Compatibility

script.on_init(function()
  if remote.interfaces["condensing-tower"] then
    remote.call("condensing-tower", "add_plant", 
                "planetaris-cactus-plant", "water", 1500, 0)
  end
end)

script.on_configuration_changed(function()
  if remote.interfaces["condensing-tower"] then
    remote.call("condensing-tower", "add_plant", 
                "planetaris-cactus-plant", "water", 1500, 0)
  end
end)