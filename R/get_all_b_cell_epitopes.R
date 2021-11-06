#' Get all epitopes from a B cell assay
#' @return all epitopes
#' @examples
#' get_all_b_cell_epitopes()
#' @author Richèl J.C. Bilderbeek
#' @export
get_all_b_cell_epitopes <- function() {
  query <- iedbr::create_healthy_human_query()
  query$bcell_ids <- "not.is.null"
  query_iedb(query = query)
}
