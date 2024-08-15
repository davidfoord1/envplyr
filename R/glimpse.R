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


  # exclude hidden objects
  obj_names <- names(x)[!startsWith(names(x), ".")]

  if (is_tabular(x)) {
    first_obj <- x[[names(x)[[1]]]]
    cli::cat_line("Rows: ", length(first_obj))
    cli::cat_line("Columns: ", length(obj_names))
  } else {
    cli::cat_line("Objects: ", length(obj_names))
  }

    obj_types <- lapply(eapply(x, pillar::new_pillar_type), format)

    obj_names <- format(pillar::new_pillar_title(obj_names))

    obj_names <- paste("$", pillar::align(obj_names), obj_types)

    obj_contents <- eapply(
      x,
      \(obj) {
        contents <- format(obj)

        if (!is.null(names(obj))) {
          contents <- paste0("$", names(obj))
          if (identical(obj, x)) {
            contents <- cli::col_br_blue(format(obj))
          }
        }

        paste(contents, collapse = ", ")
      }
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
