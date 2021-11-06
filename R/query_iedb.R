#' Query IEDB
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble}
#' @author Richèl J.C. Bilderbeek
#' @export
query_iedb <- function(
  query,
  verbose = FALSE
) {
  iedbr::check_query(query)
  response <- httr::GET(url = 'https://query-api.iedb.org/epitope_search', query = query)
  # response <- httr::GET(url = "https://query-api.iedb.org/epitope_search")
  query_results <- httr::content(response)
  if (verbose) {
    message("Got ", length(query_results), " hits")
  }
  # sleep for 1 second between calls so as not to overload the server
  Sys.sleep(1)

  query_results
}
