test_that("use, 3 queries", {
  expect_equal(1 + 1, 2) # To prevent 'empty test' testthat message
  if (!pureseqtmr::is_on_ci()) return()
  epitopes <- get_all_b_cell_epitopes(max_n_queries = 3, verbose = TRUE)
  expect_true(length(epitopes) > 7000) # 7429 at 2021-11-06 12:27
})

test_that("use, 3 queries", {
  expect_equal(1 + 1, 2) # To prevent 'empty test' testthat message
  if (!pureseqtmr::is_on_ci()) return()
  epitopes <- get_all_b_cell_epitopes(
    mhc_allele_names = "cs.{HLA-A*01:01}",
    max_n_queries = 3
  )
  expect_true(length(epitopes) > 15) # 23 at 2021-11-08 13:30 Stockholm time
})

test_that("use, full", {
  expect_equal(1 + 1, 2) # To prevent 'empty test' testthat message
  if (!pureseqtmr::is_on_ci()) return()
  epitopes <- get_all_b_cell_epitopes()
  expect_true(length(epitopes) > 7000) # 7429 at 2021-11-06 12:27
})

test_that("use, full", {
  expect_equal(1 + 1, 2) # To prevent 'empty test' testthat message
  if (!pureseqtmr::is_on_ci()) return()
  epitopes <- get_all_b_cell_epitopes(mhc_allele_names = "cs.{HLA-A*01:01}")
  expect_true(length(epitopes) > 15) # 23 at 2021-11-08 13:30 Stockholm time
})

test_that("use, full, problem MHC allele", {
  expect_equal(1 + 1, 2) # To prevent 'empty test' testthat message
  if (!pureseqtmr::is_on_ci()) return()
  epitopes <- get_all_b_cell_epitopes(mhc_allele_names = "cs.{HLA-B*08:01}")
  expect_equal(length(epitopes), 0) # 2021-11-09 11:32 Stockholm time
})
