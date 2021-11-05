#' Query IEDB
#' @param structure_type structure of the epitope.
#' Possible values are "Linear peptide",
#' as these are the names used at \url{http://www.iedb.org/}
#' @param source_organism_iris the epitope source.
#' Possible value is "NCBITaxon:9606", which denotes Homo sapiens
#' @param host_organism_iris the host.
#' Possible value is "NCBITaxon:9606", which denotes Homo sapiens
#' @param assays one or more assays.
#' Possible values are "B Cell", "MHC Ligand" and "T Cell",
#' as these are the names used at \url{http://www.iedb.org/}
#' @param mhc_restriction MHC restriction
#' Possible values are "Any", "Class I",
#' "Class II", "Non-classical" and a haplotype name
#' @param disease_names disease names.
#' Possible value is "healthy"
#' @author Richèl J.C. Bilderbeek
#' @export
query_iedb <- function(
  structure_type = "Linear peptide",
  source_organism_iris = "NCBITaxon:9606",
  host_organism_iris = "NCBITaxon:9606",
  assays,
  mhc_restriction,
  disease_names = "healthy"
) {
  testthat::expect_equal(structure_type, "Linear peptide")
  testthat::expect_equal(source_organism_iris, "NCBITaxon:9606")
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
