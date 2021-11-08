#' Check that the `query_results` is a success result
#'
#' Check that the `query_results` is a success result,
#' i.e. that the query did result in a useful lookup from the database
#' @inheritParams default_params_doc
#' @return Nothing. Will stop if `query_results` is an error result.
#' @author Richèl J.C. Bilderbeek
#' @export
check_error_query_results <- function(
  query_results
) {
  if (length(query_results) == 0) return()
  if (!tibble::is_tibble(query_results)) {
    testthat::expect_true("message" %in% names(query_results))
    testthat::expect_true("details" %in% names(query_results))
    stop(
      "Query failed. \n",
      "IEDB message: ", query_results$message, " \n",
      "IEDB details: ", query_results$details, " \n"
    )
  }
  if ("hint" %in% names(query_results)) {
    stop(
      "Query failed. \n",
      "IEDB message: ", query_results$message, " \n",
      "IEDB error code: ", query_results$code, " \n",
      "IEDB hint: ", query_results$hint, " \n"
    )
  }

}
