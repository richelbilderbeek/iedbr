#' Internal function
#'
#' Get all epitopes from a B or T cell assay
#' @inheritParams default_params_doc
#' @param b_cell_or_t_cell use "b_cell" for B cells
#' and "t_cell" for T cells
#' @return all epitopes
#' @examples
#' if (!beastier::is_on_ci()) {
#'   get_all_b_or_t_cell_epitopes(b_cell_or_t_cell = "b_cell")
#'   get_all_b_or_t_cell_epitopes(b_cell_or_t_cell = "t_cell")
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_all_b_or_t_cell_epitopes <- function(
  b_cell_or_t_cell,
  mhc_allele_names = "all",
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
  if (mhc_allele_names != "all") {
    iedbr::check_mhc_allele_names(mhc_allele_names)
    query$mhc_allele_names <- mhc_allele_names
  }
  query_results <- iedbr::query_epitope_search(
    query = query,
    verbose = verbose
  )
  tibble::deframe(query_results)
}
