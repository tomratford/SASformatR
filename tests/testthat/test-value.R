# test functionality
test_that("character to character format function", {
  got_fn <- value(
    "SYSBP" = "Systolic Blood Pressure",
    "HR" = "Heart Rate"
  )

  got <- got_fn(c("SYSBP", "HR"))
  want <- c("Systolic Blood Pressure",
            "Heart Rate")

  expect_equal(got, want)
})

test_that("character to numeric format function", {
  got_fn <- invalue(
    "SYSBP" = 1,
    "HR" = 2
  )

  got <- got_fn(c("SYSBP", "HR"))
  want <- c(1,2)

  expect_equal(got, want)
})

test_that("numeric to character format function", {
  got_fn <- value(
    `1` = "Systolic Blood Pressure",
    `2` = "Heart Rate"
  )

  got <- got_fn(c(1,2))
  want <- c("Systolic Blood Pressure",
            "Heart Rate")

  expect_equal(got, want)
})

test_that("numeric range to character format function", {
  got_fn <- value(
    "< 5" = "<5",
    "5 - 9" = "5 - 10",
    "10 <=" = ">=10"
  )

  got <- got_fn(c(4,5,9,10))
  want <- c("<5","5 - 10", "5 - 10", ">=10")

  expect_equal(got, want)
})
