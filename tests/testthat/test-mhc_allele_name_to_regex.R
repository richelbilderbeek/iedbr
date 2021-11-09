test_that("use", {
  mhc_allele_name <- "HLA-DRB*01:01"
  mhc_allele_name_regex <- mhc_allele_name_to_regex(mhc_allele_name)

  expect_equal(
    mhc_allele_name_regex,
    "HLA-DRB\\*01:01"
  )

  expect_true(
    stringr::str_detect(
      string = mhc_allele_name,
      pattern = mhc_allele_name_regex
    )
  )
  expect_true(
    stringr::str_detect(
      string = "stuff|HLA-DRB*01:01",
      pattern = mhc_allele_name_regex
    )
  )
  expect_true(
    stringr::str_detect(
      string = "HLA-DRB*01:01,things",
      pattern = mhc_allele_name_regex
    )
  )
  expect_false(
    stringr::str_detect(
      string = "HLA-DRBx01:01,things",
      pattern = mhc_allele_name_regex
    )
  )
})
