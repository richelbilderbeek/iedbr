#' Check if the `structure_type` is valid.
#'
#' Check if the `structure_type` is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return nothing
#' @examples
#' check_structure_type("eq.Linear peptide")
#' @author Richèl J.C. Bilderbeek
#' @export
check_structure_type <- function(structure_type) {
  testthat::expect_equal(length(structure_type), 1)
  # Other values are not supported yet
  testthat::expect_equal(structure_type, "eq.Linear peptide")
  invisible(structure_type)
}
