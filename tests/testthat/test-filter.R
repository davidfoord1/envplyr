test_that("filter.environment subsets by expression", {
  mtcars_env <- as.environment(mtcars)

  mtcars_env <- mtcars_env |>
    filter(mpg > 25)

  vec_lengths <- eapply(mtcars_env, length)

  # doesn't effect cols
  expect_true(length(vec_lengths) == length(mtcars))
  # does subset rows
  expect_true(all(vec_lengths == 6))
})

test_that("filter.environment subsets by multiple expressions", {
  mtcars_env <- as.environment(mtcars)

  mtcars_env <- mtcars_env |>
    filter(mpg > 25, hp < 100)

  vec_lengths <- eapply(mtcars_env, length)

  # doesn't effect cols
  expect_true(length(vec_lengths) == length(mtcars))
  # does subset rows
  expect_true(all(vec_lengths == 5))
})
