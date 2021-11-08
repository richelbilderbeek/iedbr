#' Get all epitopes from an MHC ligand assay
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
#' if (beastier::is_on_ci()) {
#'   get_all_mhc_ligand_epitopes()
#'   get_all_mhc_ligand_epitopes(mhc_allele_name = "cs.{HLA-A*01:01}")
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_all_mhc_ligand_epitopes <- function(
  mhc_allele_name = "all",
  verbose = FALSE
) {
  query <- iedbr::create_healthy_human_query()
  query <- within(query, rm(host_organism_iris))
  query <- within(query, rm(source_organism_iris))
  query$select <- "linear_sequence"
  if (mhc_allele_name != "all") {
    query$select <- "linear_sequence, mhc_allele_name"
    # iedbr::check_mhc_allele_names(mhc_allele_names)
    # query$mhc_allele_names <- mhc_allele_names
  }
  query_results <- iedbr::query_mhc_search(
    query = query,
    verbose = verbose
  )
  if (mhc_allele_name != "all") {
    query_results <- query_results[
      query_results$mhc_allele_name == mhc_allele_name,
    ]
  }
  query_results
}
