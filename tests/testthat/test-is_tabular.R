test_that("is_tabular returns the correct value", {
  expect_true(is_tabular(mtcars))
  expect_true(is_tabular(iris))

  expect_true(is_tabular(as.environment(mtcars)))
  expect_true(is_tabular(as.environment(iris)))

  uneven_list <- list(
    numeric = c(1, 2, 3),
    character = letters
  )

  expect_false(is_tabular(uneven_list))

  uneven_env <- as.environment(uneven_list)

  expect_false(is_tabular(uneven_env))
})

test_that("is_tabular checks argument data type", {
  expect_error(is_tabular(letters))
  expect_error(is_tabular(NA))
  expect_error(is_tabular(c(1, 2, 3)))
})
