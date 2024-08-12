# as.data.frame.environment -----------------------------------------------

test_that("as.data.frame converts environment to data.frame", {
  mtcars_env <- as.environment(mtcars)
  mtcars_df <- as.data.frame(mtcars_env)

  expect_true(class(mtcars_df) == "data.frame")

  iris_env <- as.environment(iris)
  iris_df <- as.data.frame(iris)

  expect_true(class(iris_df) == "data.frame")

  even_env <- new.env()
  even_env[["character"]] <- letters[1:3]
  even_env[["numeric"]] <- 1:3

  even_df <- as.data.frame(even_env)
  expect_true(class(even_df) == "data.frame")

  # empty env
  expect_true(class(as.data.frame(new.env())) == "data.frame")
})

test_that("as.data.frame errors on non tabular enviroments", {
  uneven_env <- new.env()
  uneven_env[["character"]] <- letters[1:3]
  uneven_env[["numeric"]] <- 1:4

  expect_error(as.data.frame(uneven_env))
})

# as_tibble.environment ---------------------------------------------------

test_that("as.data.frame converts environment to data.frame", {
  target_class <- c("tbl_df", "tbl", "data.frame")

  mtcars_env <- as.environment(mtcars)
  mtcars_tbl <- as_tibble(mtcars_env)

  expect_true(all(class(mtcars_tbl) == target_class))

  iris_env <- as.environment(iris)
  iris_tbl <- as_tibble(iris)

  expect_true(all(class(iris_tbl) == target_class))

  even_env <- new.env()
  even_env[["character"]] <- letters[1:3]
  even_env[["numeric"]] <- 1:3

  even_tbl <- as_tibble(even_env)
  expect_true(all(class(even_tbl) == target_class))

  # empty env
  expect_true(all(class(as_tibble(new.env())) == target_class))
})


