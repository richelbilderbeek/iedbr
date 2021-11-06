#' This function does nothing. It is intended to inherit is parameters'
#' documentation.
#' @param assays one or more assays.
#' Possible values are "B Cell", "MHC Ligand" and "T Cell",
#' as these are the names used at \url{http://www.iedb.org/}
#' @param disease_names disease names.
#' Possible value is "healthy"
#' @param host_organism_iris the host.
#' Possible value is "NCBITaxon:9606", which denotes Homo sapiens
#' @param mhc_restriction MHC restriction
#' Possible values are "Any", "Class I",
#' "Class II", "Non-classical" and a haplotype name
#' @param source_organism_iris the epitope source.
#' Possible value is "NCBITaxon:9606", which denotes Homo sapiens
#' @param structure_type structure of the epitope,
#' as checked by \link{check_structure_type}.
#' Possible values are "Linear peptide",
#' as these are the names used at \url{http://www.iedb.org/}
#' @param verbose set to TRUE for more output
#' @author Richèl J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  assays,
  disease_names,
  mhc_restriction,
  source_organism_iris,
  structure_type,
  verbose
) {
  # Nothing
}
