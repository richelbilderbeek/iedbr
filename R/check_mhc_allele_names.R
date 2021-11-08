#' Check if the `mhc_allele_names` is valid.
#'
#' Check if the `mhc_allele_names` is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return nothing
#' @examples
#' check_mhc_allele_names("cs.{HLA-A*01:01}")
#' @author Richèl J.C. Bilderbeek
#' @export
check_mhc_allele_names <- function(mhc_allele_names) {
  testthat::expect_equal(length(mhc_allele_names), 1)
  # Other values are not supported yet
  testthat::expect_equal(mhc_allele_names, "cs.{HLA-A*01:01}")
  invisible(mhc_allele_names)
}
