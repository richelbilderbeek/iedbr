#' Get all valid values for `select`
#'
#' Get all valid values for `select`,
#' as checked by \link{check_select}
#' @return all valid values for `select`
#' @examples
#' get_selectors()
#' @author Richèl J.C. Bilderbeek
#' @export
get_selectors <- function() {
  c(
    "structure_id",
    "structure_iri",
    "linear_sequence",
    "mhc_allele_name",
    "tcell_ids",
    "tcell_irs",
    "bcell_ids",
    "bcell_iris"
  )
}
