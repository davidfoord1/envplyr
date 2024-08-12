#' Coerce an environment to a data.frame
#'
#' @param x An R environment.
#'
#' @export
#'
#' @return
#' A data.frame version of `x`
#'
#' @examples
#' iris_env <- as.environment(iris)
#' iris_df <- as.data.frame(iris_env)
#' identical(iris, mtcars_df)
as.data.frame.environment <- function(x) {
  stopifnot(is_tabular(x))

  env_list <- mget(ls(x, all.names = TRUE), envir = x)

  as.data.frame(env_list)
}
