#' Recode values based off a format in a catalog
#'
#' @param x A vector or list to apply the format to.
#' @param format (`character`) The name of the format to apply
#' @param catalog (`character`) The name of the catalog to get the format from - typically `formatsß`
#'
#' @return A vector or list of the type indicated by the format.
#' @export
#'
#' @examples
#'proc_format(
#'  AGEGR1 = value(
#'    "< 21" = "<21",
#'    "21 - 39" = "21 - 39",
#'    "40 <=" = ">=40"
#'  )
#')
#'age <- c(10,20,30,40,50)
#'agegr1 <- put(age, "AGEGR1")
put <- function(x, format, catalog = "formats") {
  catalog <- get("formats", envir = .GlobalEnv)
  catalog[[format]](x)
}

#' @rdname put
#'
#' @export
input <- function(x, format, catalog = "formats") {
  put(x,format,catalog)
}
