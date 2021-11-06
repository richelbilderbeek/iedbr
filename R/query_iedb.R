#' Query IEDB
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
query_iedb <- function(
  query,
  verbose = FALSE
) {
  iedbr::check_query(query)
  response <- httr::GET(url = 'https://query-api.iedb.org/epitope_search', query = query)
  response <- httr::GET(url = "https://query-api.iedb.org/epitope_search")
  content <- httr::content(response)

  if (verbose) {
    message("Got ", length(content), " hits")
  }
  # sleep for 1 second between calls so as not to overload the server
  Sys.sleep(1)

  length(content)
  linear_sequences <- purrr::map_chr(content, function(x) { x$linear_sequence } )
  # content
  # message("Found ", length(content), " candidates")
  # content[[1]]
  linear_sequences
}
