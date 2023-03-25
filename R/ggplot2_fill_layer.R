#' Scale Plot Fills With Academic Themes (Continuous)
#'
#' @param palette_name The name of a colour palette in `AcademicThemes`.
#' @param ... Arguments passed to `ggplot2::scale_fill_gradientn()`
#'
#' @return A layer that can be added to a ggplot2 object.
#' @export
#'
#' @examples
#' library(ggplot2)
#' ggplot(
#'   data.frame(
#'     x = rnorm(10000),
#'     y = rnorm(10000)
#'   ),
#'   aes(x = x, y = y)
#' ) +
#'   geom_hex() +
#'   scale_fill_academic_c("cruk") +
#'   theme_classic() +
#'   labs(
#'     x = "X-Axis",
#'     y = "Y-Axis",
#'     fill = "Fill"
#'   )
scale_fill_academic_c <- function(palette_name, ...) {
  palette <- academic_colour_palette(palette_name)
  ggplot2::scale_fill_gradientn(
    colours = palette
  )
}

#' Scale Plot Fills With Academic Themes (Discrete)
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
#'     x = LETTERS[1:5],
#'     y = 5:1
#'   ),
#'   aes(x = x, y = y, fill = x)
#' ) +
#'   geom_col() +
#'   scale_fill_academic_d("cruk") +
#'   theme_classic() +
#'   labs(
#'     x = "X-Axis",
#'     y = "Y-Axis",
#'     fill = "Fill"
#'   )
scale_fill_academic_d <- function(palette_name, ...) {
  palette <- grDevices::colorRampPalette(academic_colour_palette(palette_name))
  ggplot2::discrete_scale(
    palette = palette,
    aesthetics = "fill",
    scale_name = paste0("AcademicTheme: ", palette_name),
    ...
  )
}

