#' Keep rows that match a condition
#'
#' @param .data A tabular environment
#' @inheritParams dplyr::filter
#'
#' @importFrom dplyr filter
#'
#' @export
#'
#' @return
#' An environment
filter.environment <- function(.data, ...) {
  conditions <- enquos(...)

  mask <- new_data_mask(.data)

  keep_list <- lapply(conditions, eval_tidy, mask)
  keep <- Reduce(`&`, keep_list)

  for (name in names(.data)) {
    .data[[name]] <- .data[[name]][keep]
  }

  .data
}
