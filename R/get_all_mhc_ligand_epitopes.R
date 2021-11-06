#' Get all epitopes from an MHC ligand assay
#' @inheritParams default_params_doc
#' @return all epitopes
#' @examples
#' if (beastier::is_on_ci()) {
#'   get_all_b_cell_epitopes()
#' }
#' @author Richèl J.C. Bilderbeek
#' @export
get_all_mhc_ligand_epitopes <- function(
  verbose = FALSE
) {
  query <- iedbr::create_healthy_human_query()
  query$select <- "linear_sequence"
  query_resultses <- list()

  i <- 1
  while (1) {
    if (verbose) {
      message("Query #", i)
    }
    offset <- (i - 1) * 10000
    query$offset <- offset
    query_results <- iedbr::query_mhc_search(query = query, verbose = verbose)
    query_resultses[[i]] <- query_results
    if (verbose) {
      message(
        "Query #", i, " ",
        "resulted in ", length(query_resultses[[i]]), " hits"
      )
    }
    if (length(query_resultses[[i]]) < 10000) {
      break
    }
    i <- i + 1
  }
  query_results <- dplyr::bind_rows(query_resultses)
  tibble::deframe(query_results)
}
