if not mods["castra"] then return end

data.raw["tile"]["nuclear-ground"].autoplace = {
    probability_expression = 'max(expression_in_range_base(-10, 0.25, 0.45, 0.3),\z
                                               expression_in_range_base(0.4, -10, 0.45, 0.25)) + noise_layer_noise(6)'
}