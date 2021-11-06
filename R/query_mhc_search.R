#' Query IEDB's `mhc_search` table
#' @inheritParams default_params_doc
#' @return a \link[tibble]{tibble}
#' @author Richèl J.C. Bilderbeek
#' @export
query_mhc_search <- function(
  query,
  verbose = FALSE
) {
  iedbr::query_iedb(
    query = query,
    table = "mhc_search",
    verbose = verbose
  )
}
