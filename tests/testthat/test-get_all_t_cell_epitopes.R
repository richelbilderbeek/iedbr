test_that("use", {
  expect_equal(1 + 1, 2) # To prevent 'empty test' testthat message
  if (!beastier::is_on_ci()) return()
  epitopes <- get_all_t_cell_epitopes()
  expect_true(length(epitopes) > 3000) # 3569 at 2021-11-06 14:05 Stockholm time
})

test_that("use", {
  expect_equal(1 + 1, 2) # To prevent 'empty test' testthat message
  if (!beastier::is_on_ci()) return()
  epitopes <- get_all_t_cell_epitopes(mhc_allele_names = "cs.{HLA-A*01:01}")
  expect_true(length(epitopes) > 30) # 40 at 2021-11-08 13:28 Stockholm time
})


