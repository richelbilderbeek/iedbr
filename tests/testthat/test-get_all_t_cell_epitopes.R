test_that("use", {
  epitopes <- get_all_t_cell_epitopes()
  expect_true(length(epitopes) > 3000) # 3569 at 2021-11-06 14:05
})
