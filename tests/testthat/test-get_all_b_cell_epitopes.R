test_that("use", {
  expect_equal(1 + 1, 2) # To prevent 'empty test' testthat message
  if (!beastier::is_on_ci()) return()
  epitopes <- get_all_b_cell_epitopes()
  expect_true(length(epitopes) > 7000) # 7429 at 2021-11-06 12:27
})
