if not mods["cloud-city"] then return end

data.raw["solar-panel"]["planetaris-supported-solar-panel"].collision_mask = {layers = {ground_tile = true, rail_support = true, ["gas-giant-surface"] = true}}

data.raw["electric-pole"]["planetaris-high-support-electric-pole"].collision_mask = {layers = {ground_tile = true, rail_support = true, ["gas-giant-surface"] = true}}
