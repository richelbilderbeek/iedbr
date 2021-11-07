#' Check if the `verbose` is valid.
#'
#' Check if the `verbose` is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return nothing
#' @examples
#' check_verbose(TRUE)
#' check_verbose(FALSE)
#' @author Richèl J.C. Bilderbeek
#' @export
check_verbose <- function(verbose) {
  testthat::expect_equal(length(verbose), 1)
  testthat::expect_true(is.logical(verbose))
  testthat::expect_true(!is.na(verbose))
  invisible(verbose)
}
