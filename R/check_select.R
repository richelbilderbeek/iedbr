#' Check if the `select` is valid.
#'
#' Check if the `select` is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return nothing
#' @examples
#' check_select("linear_sequence")
#' @author Richèl J.C. Bilderbeek
#' @export
check_select <- function(select) {
  testthat::expect_equal(length(select), 1)
  # Other values are not supported yet
  testthat::expect_equal(select, "linear_sequence")
  invisible(select)
}
