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
  query_results <- iedbr::query_epitope_search(
    query = query,
    verbose = verbose
  )
  tibble::deframe(query_results)
}
