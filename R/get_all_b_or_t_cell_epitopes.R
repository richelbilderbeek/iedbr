#' Internal function
#'
#' Get all epitopes from a B or T cell assay
#' @inheritParams default_params_doc
#' @param b_cell_or_t_cell use "b_cell" for B cells
#' and "t_cell" for T cells
#' @return all epitopes
#' @examples
#' get_all_b_cell_epitopes()
#' @author Richèl J.C. Bilderbeek
#' @export
get_all_b_or_t_cell_epitopes <- function(
  b_cell_or_t_cell,
  verbose = FALSE
) {
  testthat::expect_equal(length(b_cell_or_t_cell), 1)
  testthat::expect_true(b_cell_or_t_cell %in% c("b_cell", "t_cell"))
  query <- iedbr::create_healthy_human_query()
  if (b_cell_or_t_cell == "b_cell") {
    query$bcell_ids <- "not.is.null"
  } else {
    testthat::expect_equal(b_cell_or_t_cell, "t_cell")
    query$tcell_ids <- "not.is.null"
  }
  query$select <- "linear_sequence"
  query_resultses <- list()

  i <- 1
  while (1) {
    if (verbose) {
      message("Query #", i)
    }
    offset <- (i - 1) * 10000
    query$offset <- offset
    query_results <- iedbr::query_iedb(query = query, verbose = verbose)
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
  tibble::deframe(query_results)
}
