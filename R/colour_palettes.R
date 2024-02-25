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
    ahrc =           c("#192B65", "#707FB1", "#9BA957", "#F3AB3E"),
    bbsrc =          c("#293C91", "#C43089", "#E5B440"),
    cgem_igc =       c("#0E2E5A", "#D22D48"),
    cruk =           c("#2E0188", "#00B6EA", "#EE0286"),
    eastbio =        c("#284E96", "#386C4D", "#E07E38", "#BB2D4A"),
    epsrc =          c("#711D4B", "#459B8D"),
    nerc =           c("#5A5419", "#B2BB44"),
    res_eng =        c("#50515F", "#797F5C", "#B1BB50"),
    roslin_edi =     c("#BA4B91", "#6ABBEE", "#7EB966", "#C9773D"),
    tu_dort =        c("#87888A", "#7DB831"),
    ukri_ahrc =      c("#2D2E5F", "#E38D33", "#F1BB44"),
    ukri_bbsrc =     c("#2D2E5F", "#874598", "#D263E5"),
    ukri_epsrc =     c("#2D2E5F", "#46958A", "#68CCAD"),
    ukri_esrc =      c("#2D2E5F", "#BB4264", "#ED6560"),
    ukri_iuk =       c("#2D2E5F", "#7E2A96", "#AF3DB5"),
    ukri_mrc =       c("#2D2E5F", "#3A88A9", "#00BAD2"),
    ukri_nerc =      c("#2D2E5F", "#518346", "#7DBD5C"),
    ukri_re =        c("#2D2E5F", "#B3473A", "#EE722E"),
    ukri_stfc =      c("#2D2E5F", "#0C3283", "#2B61EF"),
    uni_of_birm =    c("#221F20", "#DA3732", "#4799D1"),
    uni_of_bristol = c("#000000", "#B03C3D"),
    uni_of_camb =    c("#000000", "#B03C3D", "#D44435"),
    uni_of_dund =    c("#CA342A", "#442593", "#0026D6", "#F5DC4B"),
    uni_of_edi =     c("#0E2E5C", "#D22D48"),
    uni_of_lee =     c("#923637", "#5A855B"),
    uni_of_liv =     c("#1E2D77", "#9A7529"),
    uni_of_manc =    c("#63338B", "#F9D348"),
    uni_of_sheff =   c("#242353", "#448CCC", "#F3E65E"),
    uni_of_soton =   c("#131F56", "#822A18", "#D3B83F"),
    uni_of_st_andr = c("#205396", "#DA4232", "#F6ED53"),
    uni_of_stirl =   c("#000000", "#2C673D"),
    x_net_bio =      c("#3E81A3", "#DB8251")
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
