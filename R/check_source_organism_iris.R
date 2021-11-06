#' Check if the `source_organism_iris` is valid.
#'
#' Check if the `source_organism_iris` is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return nothing
#' @examples
#' check_source_organism_iris("cs.{NCBITaxon:9606}")
#' @author Richèl J.C. Bilderbeek
#' @export
check_source_organism_iris <- function(source_organism_iris) {
  testthat::expect_equal(length(source_organism_iris), 1)
  # Other values are not supported yet
  testthat::expect_equal(source_organism_iris, "cs.{NCBITaxon:9606}")
  invisible(source_organism_iris)
}
