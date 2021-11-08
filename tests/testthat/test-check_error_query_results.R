test_that("use", {
  expect_error(
    check_error_query_results(
      get_test_query_results_error()
    )
  )
  expect_silent(
    check_error_query_results(
      list()
    )
  )
})
