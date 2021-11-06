#' Create a query for the IEDB.
#'
#' Create a query for the IEDB.
#' The parameters are in the same order as \url{http://www.iedb.org/}
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
create_query <- function(
  structure_type = "eq.Linear peptide",
  source_organism_iris = "cs.{NCBITaxon:9606}",
  host_organism_iris = "cs.{NCBITaxon:9606}",
  assays,
  mhc_restriction,
  disease_names = "cs.{healthy}"
) {
  iedbr::check_structure_type(structure_type)
  iedbr::check_source_organism_iris(source_organism_iris)
  iedbr::check_host_organism_iris(host_organism_iris)
  iedbr::check_disease_names(disease_names)
  testthat::expect_equal(length(assays), 1) # For now
  params <- list(
    structure_type = structure_type,
    host_organism_iris = host_organism_iris,
    source_organism_iris = source_organism_iris,
    disease_names = disease_names,
    order = "structure_iri"
  )
  #response <- httr::GET(url = 'https://query-api.iedb.org/epitope_search', query = params)
  response <- httr::GET(url = "https://query-api.iedb.org/epitope_search")
  content <- httr::content(response)

  length(content)
  linear_sequences <- purrr::map_chr(content, function(x) { x$linear_sequence } )
  # content
  # message("Found ", length(content), " candidates")
  # content[[1]]
  linear_sequences
}
