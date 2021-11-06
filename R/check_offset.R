#' Check if the `offset` is valid.
#'
#' Check if the `offset` is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return nothing
#' @examples
#' check_offset(offset = 0)
#' check_offset(10000)
#' @author Richèl J.C. Bilderbeek
#' @export
check_offset <- function(offset) {
  testthat::expect_equal(length(offset), 1)
  testthat::expect_true(is.numeric(offset))
  testthat::expect_true(offset >= 0)
  invisible(offset)
}
