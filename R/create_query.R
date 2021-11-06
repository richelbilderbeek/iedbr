#' Query IEDB
#' @inheritParams default_params_doc
#' @author Richèl J.C. Bilderbeek
#' @export
create_query <- function(
  structure_type = "Linear peptide",
  source_organism_iris = "NCBITaxon:9606",
  host_organism_iris = "NCBITaxon:9606",
  assays,
  mhc_restriction,
  disease_names = "healthy"
) {
  iedbr::check_structure_type(structure_type)
  iedbr::check_source_organism_iris(source_organism_iris)
  testthat::expect_equal(host_organism_iris, "NCBITaxon:9606")
  testthat::expect_equal(length(assays), 1) # For now
  testthat::expect_equal(disease_names, "healthy")
  params <- list(
    structure_type = "eq.Linear peptide",
    host_organism_iris = "cs.{NCBITaxon:9606}",
    source_organism_iris = "cs.{NCBITaxon:9606}",
    disease_names = "cs.{healthy}",
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
