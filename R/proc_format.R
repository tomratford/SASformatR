#' Create a format catalog
#'
#' @param ... See `vignette("getting_started", package = "SASformatR")`
#' @param catalog (`character`) Name of object to store format catalog in
#'
#' @export
#' @return nothing, creates a list `catalog` within the `SASformatR::ctls` environment object as a side effect.
#'
#' @importFrom rlang list2
#'
#' @examples
#'proc_format(
#' AGEGR1 = value(
#'   "< 21" = "<21",
#'   "21 - 39" = "21 - 39",
#'   "40 <=" = ">=40"
#' )
#')
proc_format <- function(..., catalog = "formats", delete = FALSE) {
  if (delete) {
    rm(list = catalog,
       envir = SASformatR::ctls)
    return(invisible(NULL))
  }

  partial <- SASformatR::ctls[[catalog]]
  if (is.null(SASformatR::ctls[[catalog]])) {
    partial <- list()
  }

  newlist <- c(list2(...), partial)

  assign(catalog,
         newlist[!duplicated(names(newlist))],
         envir = SASformatR::ctls)
}

