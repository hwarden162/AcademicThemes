test_that("academic_colour_palette is validated", {
  expect_warning(academic_colour_palette(n = 2))
  expect_error(academic_colour_palette(c("a", "c")))
  expect_error(academic_colour_palette(2))
  expect_error(academic_colour_palette("not_a_palette"))
  expect_error(academic_colour_palette("ukri", n = "Hello"))
  expect_error(academic_colour_palette("ukri", n = 2.6))
})

test_that("all palettes are returned", {
  hex_pattern <- "^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$"

  palettes <- academic_colour_palette()
  expect_true(is.list(palettes))

  for (palette in palettes) {
    expect_true(is.vector(palette))
    expect_true(is.character(palette))
    expect_true(all(grepl(hex_pattern, palette)))
  }

  for (palette in names(palettes)) {
    rand_n <- sample(1:20, 1)
    interpolated_palette <- academic_colour_palette(palette, n = rand_n)
    expect_equal(length(interpolated_palette), rand_n)
  }
})

test_that("academic_colour_palette_names are returned", {
  palette_names <- academic_colour_palette_names()
  expect_true(is.character(palette_names))
})

test_that("colour palettes are stored in alphabetical order", {
  palette_names <- academic_colour_palette_names()
  sorted_palette_names <- sort(palette_names)
  expect_equal(palette_names, sorted_palette_names)
})
