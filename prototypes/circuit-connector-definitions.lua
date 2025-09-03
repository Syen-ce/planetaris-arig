-- From Maraxis mod

circuit_connector_definitions["polisher"] = circuit_connector_definitions.create_vector(
    universal_connector_template,
    { --Directions are up, right, down, left.
        {variation = 11, main_offset = util.by_pixel(48, 26), shadow_offset = util.by_pixel(0, 0), show_shadow = false},
        {variation = 11, main_offset = util.by_pixel(48, 26), shadow_offset = util.by_pixel(0, 0), show_shadow = false},
        {variation = 11, main_offset = util.by_pixel(48, 26), shadow_offset = util.by_pixel(0, 0), show_shadow = false},
        {variation = 11, main_offset = util.by_pixel(48, 26), shadow_offset = util.by_pixel(0, 0), show_shadow = false},
    }
)