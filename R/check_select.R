#' Check if the `select` is valid.
#'
#' Check if the `select` is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return nothing
#' @examples
#' check_select("linear_sequence")
#' check_select(get_selectors()[1])
#' @author Richèl J.C. Bilderbeek
#' @export
check_select <- function(select) {
  testthat::expect_equal(length(select), 1)
  selectors <- stringr::str_split(
    select,
    pattern = ", ?"
  )[[1]]
  for (selector in selectors) {
    if (!selector %in% get_selectors()) {
      stop(
        "Invalid element in select: ", selector, " \n",
        "Tip: use 'iedbr::get_selectors()' to get all valid elements of select"
      )
    }
  }
  invisible(select)
}
