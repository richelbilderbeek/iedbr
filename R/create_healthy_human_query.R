#' Create a query for the IEDB for a linear peptide in a healthy human.
#'
#' Create a query for the IEDB for a linear peptide in a healthy human.
#' The parameters are in the same order as \url{http://www.iedb.org/}
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
create_healthy_human_query <- function(
  structure_type = "eq.Linear peptide",
  source_organism_iris = "cs.{NCBITaxon:9606}",
  host_organism_iris = "cs.{NCBITaxon:9606}",
  disease_names = "cs.{healthy}",
  order = "structure_iri"
) {
  iedbr::check_structure_type(structure_type)
  iedbr::check_source_organism_iris(source_organism_iris)
  iedbr::check_host_organism_iris(host_organism_iris)
  iedbr::check_disease_names(disease_names)
  iedbr::check_order(order)
  list(
    structure_type = structure_type,
    host_organism_iris = host_organism_iris,
    source_organism_iris = source_organism_iris,
    disease_names = disease_names,
    order = order
  )
}
