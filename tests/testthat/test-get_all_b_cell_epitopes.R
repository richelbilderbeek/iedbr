test_that("use", {
  epitopes <- get_all_b_cell_epitopes()
  expect_true(length(epitopes) > 10)
})
