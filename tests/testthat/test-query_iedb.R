test_that("use", {
  skip("Not now")
  expect_silent(query_iedb())
  expect_silent(query_iedb(assays = "T Cell"))
  expect_silent(query_iedb(assays = "B Cell"))
  expect_silent(query_iedb(assays = "MHC Ligand"))
})
