#' Query IEDB's `epitope_search` table
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble}
#' @author Richèl J.C. Bilderbeek
#' @export
query_epitope_search <- function(
  query,
  verbose = FALSE
) {
  iedbr::query_iedb(
    query = query,
    table = "epitope_search",
    verbose = verbose
  )
}
