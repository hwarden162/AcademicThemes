#' Get An Academic Colour Palette
#'
#' Return either a specific colour palette or all colour palettes offered by
#' `AcademicThemes`.
#'
#' @param palette A string containing the name of the palette to be returned. If
#'     no name is given then all palettes are returned instead.
#' @param n A number indicating how many different colours should be included in
#'     the palette. If not specified only the specific colours in the palette
#'     will be returned.
#'
#' @return A single vector or a list of vectors containing HEX codes for academic
#'     colour palettes.
#' @export
#'
#' @examples
#' # Get the colour palette used by the UKRI
#' academic_colour_palette("ukri_mrc")
academic_colour_palette <- function(palette = NA, n = NA) {
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
    ahrc = c("#192B65", "#707FB1", "#9BA957", "#F3AB3E"),
    bbsrc = c("#293C91", "#C43089", "#E5B440"),
    cgem_igc = c("#0E2E5A", "#B62641"),
    cruk = c("#2E0188", "#00B6EA", "#EE0286"),
    eastbio = c("#284E96", "#386C4D", "#E07E38", "#BB2D4A"),
    epsrc = c("#711D4B", "#459B8D"),
    nerc = c("#5A5419", "#B2BB44"),
    res_eng = c("#50515F", "#797F5C", "#B1BB50"),
    roslin_edi = c("#BA4B91", "#6ABBEE", "#7EB966", "#C9773D"),
    ukri_ahrc = c("#2D2E5F", "#E38D33", "#F1BB44"),
    ukri_bbsrc = c("#2D2E5F", "#874598", "#D263E5"),
    ukri_epsrc = c("#2D2E5F", "#46958A", "#68CCAD"),
    ukri_esrc = c("#2D2E5F", "#BB4264", "#ED6560"),
    ukri_iuk = c("#2D2E5F", "#7E2A96", "#AF3DB5"),
    ukri_mrc = c("#2D2E5F", "#3A88A9", "#00BAD2"),
    ukri_nerc = c("#2D2E5F", "#518346", "#7DBD5C"),
    ukri_re = c("#2D2E5F", "#B3473A", "#EE722E"),
    ukri_stfc = c("#2D2E5F", "#0C3283", "#2B61EF")
  )

  # If no colour palette is selected then return them all
  if (any(is.na(palette))) {
    if (!is.na(n)) {
      warning("\n Argument `n` was ignored as no colour palette was specified")
    }
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
  if (!is.na(n)) {
    # Check that n is numeric
    if (!is.numeric(n)) {
      stop("\n \u2716 `n` should be numeric")
    }
    # Check that n is an integer
    if (round(n) != n) {
      stop("\n \u2716 `n` should be an integer")
    }

    grDevices::colorRampPalette(palettes[[palette]])(n)
  } else {
    return(palettes[[palette]])
  }
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
