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
    num_rows <- length(x[[names(x)[[1]]]])
    num_cols <- length(x)
    cli::cat_line(cli::col_grey("# A tabular environment: ", num_rows, " x ", num_cols))
  } else {
    cli::cat_line(cli::col_grey("# An environment with ", length(x), " objects"))
  }

  invisible(x)
}
