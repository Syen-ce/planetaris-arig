if not mods["canal-excavator"] then return end

data:extend({{
  type = "mod-data",
  name = "canex-arig-config",
  data_type = "canex-surface-config",
  data = {
    surfaceName = "arig",
    localisation = {"space-location-name.arig"},
    oreStartingAmount = 5,
    mining_time = 8,
    tint = {r = 255, g = 189, b = 131},
    mineResult = "stone"
  }
}})