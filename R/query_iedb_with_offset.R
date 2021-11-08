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
  # iedbr::check_query(query)

  url <- paste0("https://query-api.iedb.org/", table)
  response <- httr::GET(url = url, query = query)
  response_content <- httr::content(response)
  #names(response_content[[1]])
  # Try to put this into a tibble, return a list if that fails
  # 'dplyr::bind_rows' converts the list into a tibble
  query_results <- NA
  tryCatch(
    query_results <- dplyr::bind_rows(response_content),
    error = function(e) {
      message(
        "Query resulted in a non-tibbleable list, ",
        "returning the raw list instad"
      )
    }
  )
  # Too bad, cannot make that messy list into a tibble
  if (length(query_results) == 1 && is.na(query_results)) {
    return(response_content)
  }

  tryCatch(
    iedbr::check_error_query_results(query_results),
    error = function(e) {
      stop(
        "Query failed for query: \n",
        " \n",
        paste0("  ", iedbr::query_to_str(query)),
        " \n",
        "error message: ", e$message
      )
    }
  )
  testthat::expect_false(iedbr::is_error_query_results(query_results))
  if (verbose) {
    message("Got ", nrow(query_results), " hits")
  }
  # sleep for 1 second between calls so as not to overload the server
  Sys.sleep(1)

  query_results
}
