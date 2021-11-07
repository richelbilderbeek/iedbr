test_that("use", {
  expect_silent(check_select("linear_sequence"))
  expect_silent(check_select(select = "linear_sequence, structure_id"))
  expect_silent(check_select(select = "linear_sequence,structure_id"))
  expect_silent(
    check_select(
      paste0(
        "structure_id, structure_iri, linear_sequence, tcell_ids, ",
        "tcell_irs, bcell_ids, bcell_iris"
      )
    )
  )
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
})
