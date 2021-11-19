#' Get all epitopes with MHC alleles from an MHC ligand assay
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble} tibble with two columns:
#'   * `linear_sequence`: the linear sequence of the epitope
#'   * `mhc_allele_name`: the name of the MHC allele
#' @seealso
#'  * use \link{get_all_b_cell_epitopes_and_mhc_alleles}
#'    to get all epitopes from a B cell assay
#'  * use \link{get_all_mhc_ligand_epitopes_and_mhc_alleles}
#'    to get all epitopes from an MHC ligand assay
#'  * use \link{get_all_t_cell_epitopes_and_mhc_alleles}
#'    to get all epitopes from a T cell assay
#' @examples
#' if (pureseqtmr::is_on_ci()) {
#'   get_all_mhc_ligand_epitopes_and_mhc_alleles(
#'     max_n_queries = 3
#'   )
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_all_mhc_ligand_epitopes_and_mhc_alleles <- function( # nolint indeed a long function name
  max_n_queries = Inf,
  verbose = FALSE
) {
  host_organism_iris <- NULL; rm(host_organism_iris) # nolint, fixes warning: no visible binding for global variable
  source_organism_iris <- NULL; rm(source_organism_iris) # nolint, fixes warning: no visible binding for global variable

  iedbr::check_max_n_queries(max_n_queries)
  iedbr::check_verbose(verbose)

  query <- iedbr::create_healthy_human_query()
  query <- within(query, rm(host_organism_iris))
  query <- within(query, rm(source_organism_iris))
  query$select <- "linear_sequence, mhc_allele_name"
  query_results <- iedbr::query_mhc_search(
    query = query,
    max_n_queries = max_n_queries,
    verbose = verbose
  )
  testthat::expect_true(tibble::is_tibble(query_results))
  testthat::expect_equal(
    c("linear_sequence", "mhc_allele_name"),
    names(query_results)
  )
  query_results
}
