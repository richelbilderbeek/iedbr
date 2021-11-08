#' Get all epitopes from a B cell assay
#' @inheritParams default_params_doc
#' @return all epitopes
#' @examples
#' if (beastier::is_on_ci()) {
#'   get_all_t_cell_epitopes()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_all_t_cell_epitopes <- function(
  mhc_allele_names = "all",
  verbose = FALSE
) {
  iedbr::get_all_b_or_t_cell_epitopes(
    b_cell_or_t_cell = "t_cell",
    mhc_allele_names = mhc_allele_names,
    verbose = verbose
  )
}
