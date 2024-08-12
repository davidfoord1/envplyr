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
#' identical(iris, iris_df)
as.data.frame.environment <- function(x) {
  stopifnot(is_tabular(x))

  env_list <- mget(ls(x, all.names = TRUE), envir = x)

  as.data.frame(env_list)
}

#' Coerce a data frame to a tibble
#'
#' @param x An environment
#'
#' @importFrom tibble as_tibble
#' @export
#'
#' @return
#' A tibble version of `x`.
#'
#' @examples
#' iris_env <- as.environment(iris)
#' iris_tbl <- tibble::as_tibble(iris_env)
#' all(iris == iris_tbl)
as_tibble.environment <- function(x) {
  stopifnot(is_tabular(x))

  env_list <- mget(ls(x, all.names = TRUE), envir = x)

  tibble::as_tibble(env_list)
}
