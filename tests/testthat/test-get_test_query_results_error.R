test_that("use", {
  query_results <- tibble::tibble(
    hint = "Perhaps you meant to reference the column \"mhc_search.host_organism_iri\".",
    code = "42703",
    message = "column mhc_search.host_organism_iris does not exist"
  )
  expect_identical(get_test_query_results_error(), query_results)
})
