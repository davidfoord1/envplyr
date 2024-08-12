# as.data.frame.environment -----------------------------------------------

test_that("as.data.frame converts environment to data.frame", {
  mtcars_env <- as.environment(mtcars)
  mtcars_df <- as.data.frame(mtcars_env)

  expect_true(class(mtcars_df) == "data.frame")

  iris_env <- as.environment(iris)
  iris_df <- as.data.frame(iris)

  expect_true(class(iris_df) == "data.frame")

  env_to_test <- new.env()
  env_to_test[["character"]] <- letters[1:3]
  env_to_test[["numeric"]] <- 1:3

  df_to_test <- as.data.frame(env_to_test)
  expect_true(class(df_to_test) == "data.frame")
})
