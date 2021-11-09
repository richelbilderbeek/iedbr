#' Convert an `mhc_allele_name` to a regular expression to detect it
#'
#' Convert an `mhc_allele_name` to a regular expression to detect it
#' @inheritParams default_params_doc
#' @return the regular expression to detect that `mhc_allele_name`
#' @examples
#' mhc_allele_name <- "HLA-DRB*01:01"
#' mhc_allele_name_regex <- mhc_allele_name_to_regex(mhc_allele_name)
#'
#' # Can detect the regex
#' stringr::str_detect(
#'   string = "HLA-DRB*01:01",
#'   pattern = mhc_allele_name_regex
#' )
#'
#' # Will not detect a match to the regex
#' stringr::str_detect(
#'   string = "HLA-DRB.01:01", # replaced asterisk by dot
#'   pattern = mhc_allele_name_regex
#' )
#' @author Richèl J.C. Bilderbeek
#' @export
mhc_allele_name_to_regex <- function(mhc_allele_name) {
  stringr::str_replace_all(
    string = mhc_allele_name,
    pattern = "\\*",
    replacement = "\\\\*"
  )
}
