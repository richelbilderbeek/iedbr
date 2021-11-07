#' Query the IEDB database from an offset
#'
#' Query the IEDB database from an offset.
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with as much rows as hits.
#' @note The IEDB returns 10k hits per query.
#' This means, to get the results of a query of more than 10k hits,
#' the IEDB needs to be queried multiple times.
#' \link{query_iedb} combines multiple calls to the IEDB,
#' using \link{query_iedb_with_offset}.
#' @author Richèl J.C. Bilderbeek
#' @export
query_iedb_with_offset <- function(
  query,
  table,
  offset = 0,
  verbose = FALSE
) {
  iedbr::check_query(query)
  iedbr::check_table(table)
  iedbr::check_offset(offset)
  iedbr::check_verbose(verbose)

  # Adding the offset
  testthat::expect_false("offset" %in% names(query))
  query$offset <- offset
  testthat::expect_true("offset" %in% names(query))
  iedbr::check_query(query)

  url <- paste0("https://query-api.iedb.org/", table)
  response <- httr::GET(url = url, query = query)
  query_results <- httr::content(response)
  if (verbose) {
    message("Got ", length(query_results), " hits")
  }
  # sleep for 1 second between calls so as not to overload the server
  Sys.sleep(1)

  # Converts a list into a tibble
  dplyr::bind_rows(query_results)
}
