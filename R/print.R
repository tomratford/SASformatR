#' S3 method for class 'SASformat'
#'
#' @param x A
#' @param ... Not used
#'
#' @export
#'
#' @method print SASformat
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
#' print(age)
print.SASformat <- function(x, ...) {
  print(format(x))
}
