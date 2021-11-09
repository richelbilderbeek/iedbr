test_that("basic use", {
  expect_silent(check_mhc_allele_names("cs.{HLA-A*01:01}"))
  expect_error(check_mhc_allele_names("nonsense"))
  expect_error(check_mhc_allele_names(NA))
  expect_error(check_mhc_allele_names(NULL))
  expect_error(check_mhc_allele_names(Inf))
  expect_error(check_mhc_allele_names(""))
  expect_error(check_mhc_allele_names(42))
  expect_error(check_mhc_allele_names(-42))
  expect_error(check_mhc_allele_names(3.14))
  expect_error(check_mhc_allele_names(c()))
  expect_error(check_mhc_allele_names(list()))
  expect_error(check_mhc_allele_names(rep(0, 2)))
})

test_that("haplotypes", {
  # Taken from the bbbq package at https://github.com/richelbilderbeek/bbbq,
  # From the (incorrectly named) function 'bbbq::get_mhc_haplotypes'
  # (it should be called 'bbbq::get_mhc_alle_names')
  many_mhc_allele_names <- c(
    "HLA-A*01:01",
    "HLA-A*02:01",
    "HLA-A*03:01",
    "HLA-A*24:02",
    "HLA-A*26:01",
    "HLA-B*07:02",
    "HLA-B*08:01",
    "HLA-B*18:01",
    "HLA-B*27:05",
    "HLA-B*39:01",
    "HLA-B*40:02",
    "HLA-B*58:01",
    "HLA-B*15:01",
    "HLA-DRB1*01:01",
    "HLA-DRB1*03:01",
    "HLA-DRB1*04:01",
    "HLA-DRB1*04:05",
    "HLA-DRB1*07:01",
    "HLA-DRB1*08:02",
    "HLA-DRB1*09:01",
    "HLA-DRB1*11:01",
    "HLA-DRB1*12:01",
    "HLA-DRB1*13:02",
    "HLA-DRB1*15:01",
    "HLA-DRB3*01:01",
    "HLA-DRB3*02:02",
    "HLA-DRB4*01:01",
    "HLA-DRB5*01:01",
    "HLA-DQA1*05:01/DQB1*02:01",
    "HLA-DQA1*05:01/DQB1*03:01",
    "HLA-DQA1*03:01/DQB1*03:02",
    "HLA-DQA1*04:01/DQB1*04:02",
    "HLA-DQA1*01:01/DQB1*05:01",
    "HLA-DQA1*01:02/DQB1*06:02"
  )
  for (mhc_allele_name in many_mhc_allele_names) {
    mhc_allele_names <- paste0("cs.{", mhc_allele_name, "}")
    expect_silent(check_mhc_allele_names(mhc_allele_names))
  }
})
