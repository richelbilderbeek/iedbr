#' Check if the `mhc_allele_name` is valid.
#'
#' Check if the `mhc_allele_name` is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return nothing
#' @seealso use \link{check_mhc_allele_names} to check a
#' selection of one or more alleles, as based on their names
#' @examples
#' check_mhc_allele_name("HLA-A*01:01")
#' check_mhc_allele_name("all")
#' @author Richèl J.C. Bilderbeek
#' @export
check_mhc_allele_name <- function(
  mhc_allele_name,
  mhc_allele_name_regex = "HLA-.*"
) {
  testthat::expect_equal(length(mhc_allele_name), 1)
  if (mhc_allele_name == "all") {
    return(invisible(mhc_allele_name))
  }
  # Split the string into two
  # First column: full string if match
  # Second column: the allele name
  s <- stringr::str_match(mhc_allele_name, mhc_allele_name_regex)
  testthat::expect_equal(nrow(s), 1)
  if (is.na(s[1, 1])) stop(
    "Invalid value of 'mhc_allele_name': \n",
    "'mhc_allele_name' does not match the regular expression. \n",
    "'mhc_allele_name': ", mhc_allele_name, " \n",
    "'mhc_allele_name_regex': ", mhc_allele_name_regex
  )
  invisible(mhc_allele_name)
}
