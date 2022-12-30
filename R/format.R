#' S3 method for class 'SASformat'
#'
#' @param x A vector or list of type SASformat
#' @param ... Not used
#'
#' @return A character vector of a formatted SASformat object
#' @export
#'
#' @method format SASformat
#'
#' @examples
#' proc_format(
#'   AGEGR1 = value(
#'     "< 21" = "<21",
#'     "21 - 39" = "21 - 39",
#'     "40 <=" = ">=40"
#'   )
#' )
#' age <- SASformat(c(10,20,30,40,50),
#'                  "AGEGR1")
#'
#' format(age)
format.SASformat <- function(x, ...) {
  check_sasformat(x) # in case of changes to the catalog
  put(unclass(x),
      attr(x,"format"),
      attr(x,"catalog"))
}
