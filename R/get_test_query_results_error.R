#' Get a `query_results` that is an error result, to be used in testing
#'
#' Get a `query_results` that is an error result, to be used in testing
#  This `query_results` is copied from a real error
#' @return a `query_results` that is an error result
#' @author Richèl J.C. Bilderbeek
#' @export
get_test_query_results_error <- function() {
  tibble::tibble(
    hint = "Perhaps you meant to reference the column \"mhc_search.host_organism_iri\".", # nolint indeed a long line
    code = "42703",
    message = "column mhc_search.host_organism_iris does not exist"
  )
}
