#' Check if the `table` is valid.
#'
#' Check if the `table` is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return nothing
#' @examples
#' check_table("mhc_search")
#' check_table("epitope_search")
#' @author Richèl J.C. Bilderbeek
#' @export
check_table <- function(table) {
  testthat::expect_equal(length(table), 1)
  testthat::expect_true(
    table %in% c("epitope_search", "mhc_search", "reference_search")
  )
  invisible(table)
}
