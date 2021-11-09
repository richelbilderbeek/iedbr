test_that("use", {
  query_results <- get_all_b_cell_epitopes_and_mhc_alleles(
    max_n_queries = 3
  )
  expect_true(tibble::is_tibble(query_results))
  expect_equal(
    c("linear_sequence", "mhc_allele_name"),
    names(query_results)
  )
})
