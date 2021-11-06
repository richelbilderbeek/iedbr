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
#' @param offset the offset of the results from a query,
#' as checked by \link{check_offset}.
#' A standard query uses an offset of zero
#' and returns maximally `10000` results.
#' To obtain the next results, an `offset` of `10000`
#' is used.
#' @param order the item by which the query is ordered,
#' as checked by \link{check_order}.
#' For bigger queries (i.e. with more than 10k results),
#' `order` is important to obtain each 10k set of results in
#' the same manner.
#' @param query an IEDB query,
#' as created by, for example, \link{create_healthy_human_query}.
#' Use \link{check_query} to check if the `query` is valid
#' @param select the fields that the query returns,
#' as checked by \link{check_select}
#' @param source_organism_iris the epitope source.
#' Possible value is "NCBITaxon:9606", which denotes Homo sapiens
#' @param structure_type structure of the epitope,
#' as checked by \link{check_structure_type}.
#' Possible values are "Linear peptide",
#' as these are the names used at \url{http://www.iedb.org/}
#' @param verbose set to \link{TRUE} for more output
#' @author Richèl J.C. Bilderbeek
#' @note This is an internal function, so it should be marked with
#'   \code{@noRd}. This is not done, as this will disallow all
#'   functions to find the documentation parameters
default_params_doc <- function(
  assays,
  disease_names,
  host_organism_iris,
  mhc_restriction,
  offset,
  order,
  query,
  select,
  source_organism_iris,
  structure_type,
  verbose
) {
  # Nothing
}
