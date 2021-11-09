#' Query IEDB's `mhc_search` table
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble}
#' @author Richèl J.C. Bilderbeek
#' @export
query_mhc_search <- function(
  query,
  max_n_queries = Inf,
  verbose = FALSE
) {
  iedbr::query_iedb(
    query = query,
    table = "mhc_search",
    max_n_queries = max_n_queries,
    verbose = verbose
  )
}
