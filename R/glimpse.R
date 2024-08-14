#' Get a glimpse of your data
#'
#' @param x An R environment
#' @inheritParams pillar::glimpse
#'
#' @importFrom dplyr glimpse
#' @export
#'
#' @return
#' Original `x` is (invisibly) returned
glimpse.environment <- function(x, width = NULL, ...) {
  if (!is.null(width) && !is.finite(width)) {
    cli::cli_abort("`width` must be finite.")
  }

  if (is.null(width)) width <- getOption("width")

  if (is_tabular(x)) {
    first_col <- x[[names(x)[[1]]]]
    cli::cat_line("Rows: ", length(first_col))
    cli::cat_line("Columns: ", length(x))

    obj_types <- unlist(eapply(x, pillar::new_pillar_type))
    obj_types <- cli::col_grey(cli::style_italic(paste0("<", obj_types, ">")))
    obj_names <- format(pillar::new_pillar_title(names(x)))
    obj_names <- paste("$", pillar::align(obj_names), obj_types)


    # data_width <- width - pillar::get_extent(obj_names) - 1
    formatted <- eapply(x, paste, collapse = ", ") |> as.character()

    truncated <- paste0(
      substr(formatted, 1, width - nchar(obj_names) - 3),
      "..."
    )

    cli::cat_line(obj_names, " ", truncated)
  } else {
    cli::cat_line("Objects: ", length(x))
  }

  cli::cat_line(cli::col_br_blue(format(x)))
  invisible(x)
}
