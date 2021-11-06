test_that("use", {
  epitopes <- get_all_b_cell_epitopes()
  expect_true(length(epitopes) > 7000) # 7429 at 2021-11-06 12:27
})
