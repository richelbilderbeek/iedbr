#' Check if the `mhc_allele_names` is valid.
#'
#' Check if the `mhc_allele_names` is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return nothing
#' @seealso use \link{check_mhc_allele_name} to check an allele name
#' @examples
#' check_mhc_allele_names("cs.{HLA-A*01:01}")
#' @author Richèl J.C. Bilderbeek
#' @export
check_mhc_allele_names <- function(
  mhc_allele_names,
  mhc_allele_names_regex = "(cs)\\.\\{(HLA-.*)\\}"
) {
  testthat::expect_equal(length(mhc_allele_names), 1)
  # Split the string into three
  # First column: full string if match
  # Second column: a PostgREST operator,
  #   from https://postgrest.org/en/v8.0/api.html#operators
  # Third column: an allele name
  s <- stringr::str_match(mhc_allele_names, mhc_allele_names_regex)
  testthat::expect_equal(nrow(s), 1)
  if (is.na(s[1, 1])) stop(
    "Invalid value of 'mhc_allele_names': \n",
    "'mhc_allele_names' does not match the regular expression. \n",
    "'mhc_allele_names': ", mhc_allele_names, " \n",
    "'mhc_allele_names_regex': ", mhc_allele_names_regex
  )
  invisible(mhc_allele_names)
}
