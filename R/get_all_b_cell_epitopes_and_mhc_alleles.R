#' Get all epitopes and MHC allele names from a B cell assay
#' @inheritParams default_params_doc
#' @return all epitopes
#' @seealso
#'  * use \link{get_all_b_cell_epitopes_and_mhc_alleles}
#'    to get all epitopes from a B cell assay
#'  * use \link{get_all_mhc_ligand_epitopes_and_mhc_alleles}
#'    to get all epitopes from an MHC ligand assay
#'  * use \link{get_all_t_cell_epitopes_and_mhc_alleles}
#'    to get all epitopes from a T cell assay
#' @examples
#' if (pureseqtmr::is_on_ci()) {
#'   get_all_b_cell_epitopes_and_mhc_alleles(max_n_queries = 3)
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_all_b_cell_epitopes_and_mhc_alleles <- function( # nolint indeed a long function name
  max_n_queries = Inf,
  verbose = FALSE
) {
  t <- iedbr::get_all_b_or_t_cell_epitopes_and_mhc_alleles(
    b_cell_or_t_cell = "b_cell",
    max_n_queries = max_n_queries,
    verbose = verbose
  )
  testthat::expect_true(tibble::is_tibble(t))
  testthat::expect_equal(c("linear_sequence", "mhc_allele_name"), names(t))
  t
}
