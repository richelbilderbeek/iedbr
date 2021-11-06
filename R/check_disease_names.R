#' Check if the `disease_names` is valid.
#'
#' Check if the `disease_names` is valid.
#' Will \link{stop} if not
#' @inheritParams default_params_doc
#' @return nothing
#' @examples
#' check_disease_names("cs.{healthy}")
#' @author Richèl J.C. Bilderbeek
#' @export
check_disease_names <- function(disease_names) {
  testthat::expect_equal(length(disease_names), 1)
  # Other values are not supported yet
  testthat::expect_equal(disease_names, "cs.{healthy}")
  invisible(disease_names)
}
