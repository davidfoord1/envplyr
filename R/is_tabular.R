#' Confirm an object is table shaped
#'
#' Check whether every vector in an [environment] has the same [length()]
#'
#' @param x Container object to be checked.
#'
#' @return
#' Logical. Whether all vectors in `x` have the same length.
is_tabular <- function(x) {
  vec_lengths <- vapply(x, length, numeric(1))

  first_length <- vec_lengths[1]

  all(first_length == vec_lengths[-1])
}
