local cargo_drop_fire = table.deepcopy(data.raw["fire"]["fire-flame"])
cargo_drop_fire.name = "cargo-drop-fire"
cargo_drop_fire.initial_lifetime = (cargo_drop_fire.initial_lifetime or 60) * 4  -- ~4x longer
cargo_drop_fire.maximum_lifetime = (cargo_drop_fire.maximum_lifetime or 60) * 4

data:extend({cargo_drop_fire})