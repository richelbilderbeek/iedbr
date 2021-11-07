#' Get all epitopes from an MHC ligand assay
#' @inheritParams default_params_doc
#' @return all epitopes
#' @examples
#' if (beastier::is_on_ci()) {
#'   get_all_b_cell_epitopes()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_all_mhc_ligand_epitopes <- function(
  verbose = FALSE
) {
  query <- iedbr::create_healthy_human_query()
  query$select <- "linear_sequence"
  query_results <- iedbr::query_mhc_search(query = query, verbose = verbose)
  query_results
}
