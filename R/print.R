#' Print values of an environment
#'
#' @inheritParams base::print
#'
#' @export
#'
#' @return
#' Returns `x` invisibly
print.environment <- function(x, ...) {
  cli::cat_line(cli::col_br_blue(format(x)))

  if (is_tabular(x)) {
    dimensions <- paste(length(x[[names(x)[[1]]]]), "x", length(x))
  }

  cli::cat_line(cli::col_grey("# An environment: ", dimensions))

  pillar::pillar()

  invisible(x)
}
