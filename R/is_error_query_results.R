#' Determine if the `query_results` is an error result
#'
#' Determine if the `query_results` is an error result,
#' i.e. that the query did not result in a lookup from the datebase
#' and contains an error message (and hint) instead.
#' @inheritParams default_params_doc
#' @return
#'   * \link{TRUE} if the `query_results` is an error result.
#'   * \link{FALSE} if the `query_results` is not error result.
#'
#' Will \link{stop} if `query_results` is invalid
#' @examples
#' is_error_query_results(get_test_query_results_error())
#' @author Richèl J.C. Bilderbeek
#' @export
is_error_query_results <- function(query_results) {
  testthat::expect_true(tibble::is_tibble(query_results))
  "hint" %in% names(query_results)
}
