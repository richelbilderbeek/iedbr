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

test_that("use, MHC ligand with haplotype", {
  query <- iedbr::create_healthy_human_query()
  query <- within(query, rm(host_organism_iris))
  query <- within(query, rm(source_organism_iris))
  query$select <- "linear_sequence, mhc_allele_name"
  # query$mhc_allele_name <- "cs.{HLA-A*01:01}"
  check_query(query)
  t <- query_iedb_with_offset(query = query, table = "mhc_search")
  expect_true(tibble::is_tibble(t))
  expect_true(nrow(t) > 30) # 40 on 2021-11-08 10:29 Stockholm time
})

test_that("use, reference_search for mhc_allele_names", {
  # Try to get a list of all valid MHC alleles
  skip("Unsure")
  query <- list()
  query$mhc_allele_names <- "not.is.null"
  query$order <- "structure_iri"
  query$select <- "mhc_allele_names"
  t <- query_iedb_with_offset(query = query, table = "reference_search")
  t$details
  expect_true(tibble::is_tibble(t))
  expect_true(nrow(t) > 30) # 40 on 2021-11-08 10:29 Stockholm time
})
