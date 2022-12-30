#' Internally create a `SASformat` object
#'
#' @param vector see `SASformat()`
#' @param format see `SASformat()`
#' @param catalog see `SASformat()`
#'
#' @return An object of type `SASformat`
#'
init_sasformat <- function(vector, format, catalog) {
  `attributes<-`(vector, list(class = "SASformat",
                              format = format,
                              catalog = catalog))
}

#' Create a `SASformat` object
#'
#' @param vector Any list or vector
#' @param format (`character`) Name of format to apply
#' @param catalog (`character`) Name of catalog to find format in
#'
#' @return A `SASformat` vector, with appropriate methods
#' @export
#'
#' @examples
#'proc_format(
#'  AGEGR1 = value(
#'    "< 21" = "<21",
#'    "21 - 39" = "21 - 39",
#'    "40 <=" = ">=40"
#'. )
#')
#'age <- c(10,20,30,40,50)
#'agegr1 <- SASformat(age, "AGEGR1")
SASformat <- function(vector, format, catalog = "formats") {
  x <- init_sasformat(vector, format, catalog)
  check_sasformat(x)
  x
}

#' Check a SASformat object
#'
#' This is used to ensure that the correct formats and catalogs exist at runtime.
#'
#' @param sasformat a `SASformat` object
#'
#' @importFrom cli cli_abort
#'
#' @return nothing, errors as a side effect
#'
check_sasformat <- function(sasformat) {
  catalog <- attr(sasformat, "catalog")
  if (is.null(SASformatR::ctls[[catalog]])) {
    cli_abort("Format catalog `{catalog}` does not exist")
  }
  format <- attr(sasformat, "format")
  if (is.null(SASformatR::ctls[[catalog]][[format]])) {
    cli_abort("Format `{format}` does not exist in catalog `{catalog}`")
  }
}
