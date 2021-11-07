#' Query the IEDB database
#'
#' Query the IEDB database.
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} with as much rows as hits.
#' @note The IEDB returns 10k hits per query.
#' This means, to get the results of a query of more than 10k hits,
#' the IEDB needs to be queried multiple times.
#' \link{query_iedb} combines multiple calls to the IEDB,
#' using \link{query_iedb_with_offset}.
#' @author Richèl J.C. Bilderbeek
#' @export
query_iedb <- function(
  query,
  table,
  verbose = FALSE
) {
  iedbr::check_query(query)
  iedbr::check_table(table)
  iedbr::check_verbose(verbose)

  # Let only 'query_iedb_with_offset' add the offset
  testthat::expect_false("offset" %in% names(query))

  query_resultses <- list()
  i <- 1
  while (1) {
    if (verbose) {
      message("Query #", i)
    }
    offset <- (i - 1) * 10000
    query_results <- iedbr::query_iedb_with_offset(
      query = query,
      table = table,
      offset = offset,
      verbose = FALSE
    )
    if (iedbr::is_error_query_results(query_results)) {
      stop(
        "Query failed for query: \n",
        " \n",
        "{ \n",
        paste0("  ", iedbr::query_to_str(query)),
        "} \n",
        " \n",
        "IEDB message: ", query_results$message, " \n",
        "IEDB error code: ", query_results$code, " \n",
        "IEDB hint: ", query_results$hint, " \n"
      )
    }
    query_resultses[[i]] <- query_results
    if (verbose) {
      message(
        "Query #", i, " ",
        "resulted in ", length(query_resultses[[i]]), " hits"
      )
    }
    if (length(query_resultses[[i]]) < 10000) {
      break
    }
    i <- i + 1
  }
  query_results <- dplyr::bind_rows(query_resultses)
}
