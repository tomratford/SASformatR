#' Create a format akin to a SAS format
#'
#' @param ... See `vignette("getting_started", package = "SASformatR")`
#'
#' @return A function
#' @export
#'
#' @importFrom dplyr case_when recode
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
value <- function(...) {
  values <- rlang::list2(...)

  arguments <- names(values)
  # If we have a numeric conditional
  if (any(grepl("[=<>-]", arguments))) {
    names(values) <- gsub("(\\d+[\\s]?<[=]?)", # '10 <' or '10 <=' values
                          "\\1 x",
                          gsub(
                            "(<[=]?[\\s]?\\d+)", # '< 10' or '<= 10' values
                            "x \\1",
                            gsub(
                              "(\\d+[\\s]?)-([\\s]?\\d+)", # '10 - 15' values
                              "\\1 <= x & x <= \\2",
                              names(values),
                              perl = T
                            ),
                            perl = T
                          ),
                          perl = T)
    comb <- paste(names(values),
                  paste0("\"",values,"\""),
                  sep = " ~ ",
                  collapse = ", ")
    function(x) {
        eval(parse(
          text = paste0("dplyr::case_when(",
                        comb,
                        ")")
        ))
    }
  } else {
    function(x) {
      dplyr::recode(x, ...)
    }
  }
}

#' @rdname value
#'
#' @export
invalue <- function(...) {
  value(...)
}
