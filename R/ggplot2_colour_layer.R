#' Scale Plot Colours With Academic Themes (Continuous)
#'
#' @param palette_name The name of a colour palette in `AcademicThemes`.
#' @param ... Arguments passed to `ggplot2::scale_colour_gradientn()`
#'
#' @return A layer that can be added to a ggplot2 object.
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(
#'   data.frame(
#'     x = runif(1500),
#'     y = runif(1500)
#'   ),
#'   aes(x = x, y = y, colour = x)
#' ) +
#'   geom_point() +
#'   scale_colour_academic_c("cruk") +
#'   theme_classic() +
#'   labs(
#'     x = "X-Axis",
#'     y = "Y-Axis",
#'     colour = "Colour"
#'   )
scale_colour_academic_c <- function(palette_name, ...) {
  palette <- academic_colour_palette(palette_name)
  ggplot2::scale_colour_gradientn(
    colours = palette
  )
}

#' Scale Plot Colours With Academic Themes (Discrete)
#'
#' @param palette_name The name of a colour palette in `AcademicThemes`.
#' @param ... Arguments passed to `ggplot2::discrete_scale()`.
#'
#' @return A layer that can be added to a ggplot2 object.
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(
#'   data.frame(
#'     x = runif(1500),
#'     y = runif(1500),
#'     c = sample(LETTERS[1:3], 1500, replace = TRUE)
#'   ),
#'   aes(x = x, y = y, colour = c)
#' ) +
#'   geom_point() +
#'   scale_colour_academic_d("cruk") +
#'   theme_classic() +
#'   labs(
#'     x = "X-Axis",
#'     y = "Y-Axis",
#'     colour = "Colour"
#'   )
scale_colour_academic_d <- function(palette_name, ...) {
  palette <- grDevices::colorRampPalette(academic_colour_palette(palette_name))
  ggplot2::discrete_scale(
    palette = palette,
    aesthetics = "colour",
    scale_name = paste0("AcademicTheme: ", palette_name),
    ...
  )
}

