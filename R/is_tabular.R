#' Confirm an object is table shaped
#'
#' Check whether every vector in a [list] or [environment] has the same
#' [length()].
#'
#' @param x List or environment object to be checked.
#'
#' @return Logical. Whether all vectors in `x` have the same length.
is_tabular <- function(x) {
  stopifnot(is.list(x) | is.environment(x))

  if (length(x) %in% c(0, 1)) return(TRUE)

  vec_lengths <- vapply(x, length, numeric(1))

  first_length <- vec_lengths[1]

  all(first_length == vec_lengths[-1])
}
