#' Check if the `query` is valid.
#'
#' Check if the `query` is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return nothing
#' @examples
#' check_query("structure_iri")
#' @author Richèl J.C. Bilderbeek
#' @export
check_query <- function(query) {
  if ("disease_names" %in% names(query)) {
    iedbr::check_disease_names(query$disease_names)
  }
  if ("host_organism_iris" %in% names(query)) {
    iedbr::check_host_organism_iris(query$host_organism_iris)
  }
  if ("mhc_allele_names" %in% names(query)) {
    iedbr::check_mhc_allele_names(query$mhc_allele_names)
  }
  if ("offset" %in% names(query)) {
    iedbr::check_offset(query$offset)
  }
  if ("order" %in% names(query)) {
    iedbr::check_order(query$order)
  }
  if ("select" %in% names(query)) {
    iedbr::check_select(query$select)
  }
  if ("structure_type" %in% names(query)) {
    iedbr::check_structure_type(query$structure_type)
  }
  if ("source_organism_iris" %in% names(query)) {
    iedbr::check_source_organism_iris(query$source_organism_iris)
  }
  invisible(query)
}
