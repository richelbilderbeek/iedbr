#' Determine if the `query_results` is an error result
#'
#' Determine if the `query_results` is an error result,
#' i.e. that the query did not result in a lookup from the datebase
#' and contains an error message (and hint) instead.
#' @inheritParams default_params_doc
#' @return
#'   * \link{TRUE} if the `query_results` is an error result.
#'   * \link{FALSE} if the `query_results` is not error result.
#' @examples
#' is_error_query_results(get_test_query_results_error())
#' @author Richèl J.C. Bilderbeek
#' @export
is_error_query_results <- function(
  query_results,
  verbose = FALSE
) {
  iedbr::check_verbose(verbose)
  result <- FALSE
  tryCatch({
    iedbr::check_error_query_results(
      query_results = query_results
    )
    result <- TRUE
  }, error = function(e) {
    if (verbose) message(e$message)
  }
  )
  # 'result' determines if there is no error.
  # In this case, we are interested if there is an error
  !result
}
