test_that("use", {
  expect_equal(1 + 1, 2) # To prevent 'empty test' testthat message
  if (!pureseqtmr::is_on_ci()) return()
  epitopes <- get_all_b_cell_epitopes()
  expect_true(length(epitopes) > 7000) # 7429 at 2021-11-06 12:27
})

test_that("use", {
  expect_equal(1 + 1, 2) # To prevent 'empty test' testthat message
  if (!pureseqtmr::is_on_ci()) return()
  epitopes <- get_all_b_cell_epitopes(mhc_allele_names = "cs.{HLA-A*01:01}")
  expect_true(length(epitopes) > 15) # 23 at 2021-11-08 13:30 Stockholm time
})
