#' Internal function
#'
#' Get all epitopes from a B or T cell assay
#' @inheritParams default_params_doc
#' @param b_cell_or_t_cell use "b_cell" for B cells
#' and "t_cell" for T cells
#' @return a \link[tibble]{tibble} tibble with two columns:
#'   * `linear_sequence`: the linear sequence of the epitope
#'   * `mhc_allele_name`: the name of the MHC allele
#' @examples
#' if (pureseqtmr::is_on_ci()) {
#'   get_all_b_or_t_cell_epitopes_and_mhc_alleles(b_cell_or_t_cell = "b_cell")
#'   get_all_b_or_t_cell_epitopes_and_mhc_alleles(b_cell_or_t_cell = "t_cell")
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_all_b_or_t_cell_epitopes_and_mhc_alleles <- function( # nolint indeed a long function name
  b_cell_or_t_cell,
  max_n_queries = Inf,
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
  query$select <- "linear_sequence, mhc_allele_name"
  query_results <- iedbr::query_epitope_search(
    query = query,
    max_n_queries = max_n_queries,
    verbose = verbose
  )
  testthat::expect_true(tibble::is_tibble(query_results))
  testthat::expect_equal(c("linear_sequence", "mhc_allele_name"), names(query_results))
  query_results
}
