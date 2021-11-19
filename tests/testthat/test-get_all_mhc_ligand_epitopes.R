test_that("use, all epitopes, 3 queries", {
  expect_equal(1 + 1, 2) # To prevent 'empty test' testthat message
  if (!pureseqtmr::is_on_ci()) return()
  epitopes <- get_all_mhc_ligand_epitopes(
    max_n_queries = 3,
    verbose = TRUE
  )
  expect_true(is.character(epitopes))
  expect_false(tibble::is_tibble(epitopes))
  expect_equal(length(epitopes), 30000) # 10k times the number of queries
})

test_that("use, one haplotype, 3 queries", {
  expect_equal(1 + 1, 2) # To prevent 'empty test' testthat message
  if (!pureseqtmr::is_on_ci()) return()
  epitopes <- get_all_mhc_ligand_epitopes(
    mhc_allele_name = "HLA-A*01:01",
    max_n_queries = 3,
    verbose = TRUE
  )
  expect_true(length(epitopes) > 140) # 156 at 2021-11-09 11:07 Stockholm time
  expect_true(is.character(epitopes))
  expect_false(tibble::is_tibble(epitopes))
})

test_that("use, all epitopes, full", {
  expect_equal(1 + 1, 2) # To prevent 'empty test' testthat message
  if (!pureseqtmr::is_on_ci()) return()
  epitopes <- get_all_mhc_ligand_epitopes()
  expect_true(length(epitopes) > 7000) # ? at 2021-11-06 12:27
  expect_true(is.character(epitopes))
  expect_false(tibble::is_tibble(epitopes))
})

test_that("use, one haplotype, full", {
  expect_equal(1 + 1, 2) # To prevent 'empty test' testthat message
  if (!pureseqtmr::is_on_ci()) return()
  epitopes <- get_all_mhc_ligand_epitopes(mhc_allele_name = "HLA-A*01:01")
  expect_true(length(epitopes) > 15) # 23 at 2021-11-08 13:30 Stockholm time
  expect_true(is.character(epitopes))
  expect_false(tibble::is_tibble(epitopes))
})


test_that("Use case 1a", {
  expect_equal(1 + 1, 2) # To prevent 'empty test' testthat message
  if (!pureseqtmr::is_on_ci()) return()
  query <- list(
    linear_sequence = "eq.SIINFEKL",
    order = "structure_iri"
  )
  query_iedb_with_offset(
    query = query,
    table = "epitope_search"
  )
})
