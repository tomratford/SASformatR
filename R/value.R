#' Create a format akin to a SAS format
#'
#' @param ...
#'
#' @return A function
#' @export
#'
#' @examples
value <- function(...) {
  values <- rlang::list2(...)

  arguments <- names(values)
  if (any(grepl("[=<>-]", arguments))) {
    str <- "dplyr::case_when("
    for (i in seq_along(values)) {
      val <- values[[i]]
      name <- arguments[i]
      if (grepl("\\d+[\\s]?<[=]?", name, perl = T)) { # 10 < or 10 <= values
        str <- paste(str, name,"x ~ ", paste0("\"", val, "\""))
      } else if (grepl("<[=]?[\\s]?\\d+", name, perl = T)) { # < 10 or 10 <=
        str <- paste(str, "x", name, "~", paste0("\"", val, "\""))
      } else if (grepl("\\d+[\\s]?-[\\s]?\\d+", name, perl = T)) { # 5 - 10 values
        str <- paste(str, gsub("(\\d+)[\\s]?-[\\s]?(\\d+)", "\\1 <= x & x <= \\2 ~", name, perl = T), paste0("\"", val, "\""))
      } else { # Abort as we cannot parse these functions
        print("TODO")
      }
      str <- paste0(str, ",")
    }

    str <- paste(str, "TRUE ~ \"TODO\")")

    function(x) {
        eval(parse(text = str))
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
