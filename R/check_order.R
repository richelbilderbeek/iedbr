#' Check if the `order` is valid.
#'
#' Check if the `order` is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return nothing
#' @examples
#' check_order("structure_iri")
#' @author Richèl J.C. Bilderbeek
#' @export
check_order <- function(order) {
  testthat::expect_equal(length(order), 1)
  # Other values are not supported yet
  testthat::expect_equal(order, "structure_iri")
  invisible(order)
}
