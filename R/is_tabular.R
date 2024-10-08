#' Confirm an object is table shaped
#'
#' Check whether every vector in a [list] or [environment] has the same
#' [length()].
#'
#' @param x List or environment object to be checked.
#'
#' @return Logical. Whether all vectors in `x` have the same length.
#'
#'
#' @section Examples (internal to envplyr):
#' ```r
#' # TRUE
#' is_tabular(iris)
#' is_tabular(as.environment(iris))
#' is_tabular(new.env())
#' is_tabular(as.environment(list(chr = letters, num = 1:26)))
#'
#' # FALSE
#' is_tabular(list(letters, 1:3))
#' is_tabular(as.environment(list(chr = letters, num = 1:3)))
#' ```
is_tabular <- function(x) {
  stopifnot(is.list(x) | is.environment(x))

  # exclude hidden objects
  obj_names <- names(x)[!startsWith(names(x), ".")]

  if (length(obj_names) %in% c(0, 1)) return(TRUE)

  vec_lengths <- eapply(x, length)

  first_length <- vec_lengths[[1]]

  all(first_length == vec_lengths[-1])
}
