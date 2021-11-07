test_that("use", {
  query <- iedbr::create_healthy_human_query()
  query$tcell_ids <- "not.is.null"
  query$select <- "linear_sequence"
  t <- query_iedb(query = query, table = "epitope_search")
  expect_true(tibble::is_tibble(t))
})

test_that("use", {
  query <- iedbr::create_healthy_human_query()
  query$tcell_ids <- "not.is.null"
  query$select <- "linear_sequence, structure_id"
  t <- query_iedb(query = query, table = "epitope_search")
  expect_true(tibble::is_tibble(t))
})
