#' Check if the `max_n_queries` is valid.
#'
#' Check if the `max_n_queries` is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return nothing
#' @examples
#' check_max_n_queries(max_n_queries = Inf)
#' check_max_n_queries(max_n_queries = 3)
#' @author Richèl J.C. Bilderbeek
#' @export
check_max_n_queries <- function(max_n_queries) {
  testthat::expect_equal(length(max_n_queries), 1)
  testthat::expect_true(is.numeric(max_n_queries))
  if (is.infinite(max_n_queries)) {
    return(invisible(max_n_queries))
  }
  testthat::expect_true(max_n_queries >= 1)
  # Must be a whole number
  testthat::expect_equal(0.0, abs(max_n_queries - round(max_n_queries)))
  invisible(max_n_queries)
}
