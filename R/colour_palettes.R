#' Get An Academic Colour Palette
#'
#' Return either a specific colour palette or all colour palettes offered by
#' `AcademicThemes`.
#'
#' @param palette A string containing the name of the palette to be returned. If
#'     no name is given then all palettes are returned instead.
#'
#' @return A single vector or a list of vectors containing HEX codes for academic
#'     colour palettes.
#' @export
#'
#' @examples
#' # Get the colour palette used by the UKRI
#' academic_colour_palette("ukri")
academic_colour_palette <- function(palette = NA) {
  # Generate the colour palettes
  # ================================================================
  # ========================= CONTRIBUTORS =========================
  # == To add a new colour palette, please add the vector of HEX  ==
  # ==   codes to the list below in alphabetical order by name.   ==
  # ==  Where possible the vector of colours should be in some    ==
  # == logical order (e.g. the order in which they appear in the  ==
  # ==   logo of the institution). Preferably the colours should  ==
  # ==          also be in order from darker to lighter.          ==
  # ================================================================
  # ================================================================
  palettes <- list(
    cgem_igc = c("#0e2e5a", "#b62641"),
    cruk = c("#2e0188", "#00b6ea", "#ee0286"),
    eastbio = c("#284e96", "#386c4d", "#e07e38", "#bb2d4a"),
    ukri = c("#2D2E5F", "#3A88A9", "#00BAD2"),
    ukri_purple = c("#2D2E5F", "#874598", "#d263e5")
  )

  # If no colour palette is selected then return them all
  if (any(is.na(palette))) {
    return(palettes)
  }

  # Check the selected colour palette is valid
  if (length(palette) > 1) {
    stop("\n \u2716 Given palette name should only contain one entry")
  }
  # Check the selected colour palette is a string
  if (!is.character(palette)) {
    stop("\n \u2716 Given palette name should be a string")
  }
  # Check the selected colour palette is in the list of colour palettes
  if (!(palette %in% names(palettes))) {
    stop(paste0('\n \u2716 "', palette, '" is not a colour palette in `AcademicThemes`'))
  }

  # Return the selected colour palette
  return(palettes[[palette]])
}

#' Get The Academic Colour Palette Names
#'
#' @return A vector of the names of the colour palettes available in `AcademicThemes`.
#' @export
#'
#' @examples
#' academic_colour_palette_names()
academic_colour_palette_names <- function() {
  # Get the colour palettes
  palettes <- academic_colour_palette()
  # Return the names of the colour palettes
  names(palettes)
}
