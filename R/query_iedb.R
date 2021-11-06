#' Query IEDB's `epitope_search` table
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble}
#' @author Richèl J.C. Bilderbeek
#' @export
query_iedb <- function(
  query,
  table,
  verbose = FALSE
) {
  iedbr::check_query(query)
  url <- paste0("https://query-api.iedb.org/", table)
  response <- httr::GET(url = url, query = query)
  query_results <- httr::content(response)
  if (verbose) {
    message("Got ", length(query_results), " hits")
  }
  # sleep for 1 second between calls so as not to overload the server
  Sys.sleep(1)

  query_results
}
