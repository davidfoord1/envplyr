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

  cli::cat_line(cli::col_br_blue(format(x)))

  if (is_tabular(x)) {
    first_obj <- x[[names(x)[[1]]]]
    cli::cat_line("Rows: ", length(first_obj))
    cli::cat_line("Columns: ", length(x))
  } else {
    cli::cat_line("Objects: ", length(x))
  }

    obj_types <- lapply(eapply(x, pillar::new_pillar_type, all.names = TRUE), format)
    obj_names <- format(pillar::new_pillar_title(names(x)))
    obj_names <- paste("$", pillar::align(obj_names), obj_types)

    obj_contents <- eapply(
      x,
      \(obj) {
        contents <- format(obj)

        if (!is.null(names(obj))) {
          contents <- names(obj)
          if (identical(obj, x)) {
            contents <- cli::col_br_blue(format(obj))
          }
        }

        paste(contents, collapse = ", ")
      },
      all.names = TRUE
    )

    contents_width <- width - nchar(obj_names)

    ellipsis <- ifelse(nchar(obj_contents) > contents_width, "...", "")

    truncated <- paste0(
      substr(obj_contents, 1, contents_width - nchar(ellipsis)),
      ellipsis
    )

  cli::cat_line(obj_names, " ", truncated)

  invisible(x)
}
