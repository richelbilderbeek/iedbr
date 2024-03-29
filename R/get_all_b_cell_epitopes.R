#' Get all epitopes from a B cell assay
#' @inheritParams default_params_doc
#' @return all epitopes
#' @seealso
#'  * use \link{get_all_b_cell_epitopes}
#'    to get all epitopes from a B cell assay
#'  * use \link{get_all_mhc_ligand_epitopes}
#'    to get all epitopes from an MHC ligand assay
#'  * use \link{get_all_t_cell_epitopes}
#'    to get all epitopes from a T cell assay
#' @examples
#' if (pureseqtmr::is_on_ci()) {
#'   get_all_b_cell_epitopes()
#'   get_all_b_cell_epitopes(mhc_allele_names = "cs.{HLA-A*01:01}")
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_all_b_cell_epitopes <- function(
  mhc_allele_names = "all",
  max_n_queries = Inf,
  verbose = FALSE
) {
  epitopes <- iedbr::get_all_b_or_t_cell_epitopes(
    b_cell_or_t_cell = "b_cell",
    mhc_allele_names = mhc_allele_names,
    max_n_queries = max_n_queries,
    verbose = verbose
  )
  testthat::expect_true(is.character(epitopes))
  testthat::expect_false(tibble::is_tibble(epitopes))
  epitopes
}
