test_that("use", {
  expect_silent(check_select("linear_sequence"))
  expect_error(check_select("nonsense"))
  expect_error(check_select(NA))
  expect_error(check_select(NULL))
  expect_error(check_select(Inf))
  expect_error(check_select(""))
  expect_error(check_select(42))
  expect_error(check_select(3.14))
  expect_error(check_select(c()))
  expect_error(check_select(list()))
  expect_error(check_select(rep("linear_sequence", 2)))

  skip("Not yet")
  # From https://github.com/IEDB/IQ-API-use-cases/blob/master/python/use_case_1a.ipynb # nolint indeed a long line
  expect_silent(
    check_select(
      "structure_id, structure_iri, linear_sequence, tcell_ids, tcell_irs, bcell_ids, bcell_iris" # nolint indeed a long line
    )
  )
})
