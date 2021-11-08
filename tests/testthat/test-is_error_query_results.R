test_that("use", {
  expect_true(is_error_query_results(get_test_query_results_error()))

  # An empty list is a successful query with zero results
  expect_false(is_error_query_results(list()))
})
