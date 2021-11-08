test_that("use, T cells", {
  query <- iedbr::create_healthy_human_query()
  query$tcell_ids <- "not.is.null"
  query$select <- "linear_sequence"
  t <- query_iedb_with_offset(query = query, table = "epitope_search")
  names(t)
  expect_true(tibble::is_tibble(t))
  expect_true(nrow(t) > 3000) # 3569 on 2021-11-08 10:28 Stockholm time
})

test_that("use, T cells with haplotype", {
  query <- iedbr::create_healthy_human_query()
  query$tcell_ids <- "not.is.null"
  query$mhc_allele_names <- "cs.{HLA-A*01:01}"
  query$select <- "linear_sequence"
  check_query(query)
  t <- query_iedb_with_offset(query = query, table = "epitope_search")
  expect_true(tibble::is_tibble(t))
  expect_true(nrow(t) > 30) # 40 on 2021-11-08 10:29 Stockholm time
})
