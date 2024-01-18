test_that("continuous colour scales are created", {
  for (palette in academic_colour_palette_names()) {
    function_value <- scale_colour_academic_c(palette)
    palette <- academic_colour_palette(palette)
    expected_value <- ggplot2::scale_colour_gradientn(colours = palette)
    expect_equal(
      function_value,
      expected_value
    )
  }
})

test_that("discrete colours scales are created", {
  for (palette_name in academic_colour_palette_names()) {
    function_value <- scale_colour_academic_d(palette_name)
    colours <- academic_colour_palette(palette_name)
    palette <- grDevices::colorRampPalette(colours)
    expected_value <- ggplot2::discrete_scale(
      palette = palette,
      aesthetics = "colour",
      scale_name = paste0("AcademicTheme: ", palette_name)
    )
    expect_equal(
      .subset2(function_value, "palette"),
      .subset2(expected_value, "palette")
    )
    expect_equal(
      function_value$aesthetics,
      expected_value$aesthetics,
    )
  }
})
