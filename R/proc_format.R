#' Create a format catalog
#'
#' @param ... See `vignette("getting_started", package = "SASformatR")`
#' @param catalog (`character`) Name of object to store format catalog in
#'
#' @return nothing, creates an object `formats` as a side effect
#' @export
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
proc_format <- function(..., catalog = "formats") {
  if (exists(catalog, envir = .GlobalEnv)) {
    partial <- get(catalog, envir = .GlobalEnv)
  } else {
    partial <- list()
  }

  newlist <- c(list2(...), partial)

  assign(catalog,
         newlist[!duplicated(names(newlist))],
         envir = .GlobalEnv)
}
