#' @title S3 method for 'SASformat'
#'
#' @param x A `SASformat` object
#' @param ... Passed to the base method
#'
#' @return An subset `SASformat` object
#' @export
#'
#' @method `[` SASformat
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
#' age[1]
`[.SASformat` <- function(x, ...) {
  structure(NextMethod(),
            class = class(x),
            format = attr(x, "format"),
            catalog = attr(x, "catalog"))
}
