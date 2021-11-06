#' Get all epitopes from a B cell assay
#' @inheritParams default_params_doc
#' @return all epitopes
#' @examples
#' get_all_t_cell_epitopes()
#' @author Richèl J.C. Bilderbeek
#' @export
get_all_t_cell_epitopes <- function(
  verbose = FALSE
) {
  iedbr::get_all_b_or_t_cell_epitopes(b_cell_or_t_cell = "t_cell")
}
