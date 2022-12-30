# test functionality
test_that("a catalog is created with nothing in", {
  proc_format()

  want <- new.env(parent = emptyenv())
  want$formats <- list()

  expect_identical(SASformatR::ctls, want)
})

test_that("a catalog can be deleted", {
  proc_format(catalog="formats", delete=TRUE)

  want <- new.env(parent = emptyenv())

  expect_identical(SASformatR::ctls, want)
})

test_that("a format is created in a catalog and can be indexed", {
  proc_format(
    PARAMCD = value(
      "SYSBP" = "Systolic Blood Pressure",
      "DIABP" = "Diastolic Blood Pressure",
      "HR" = "Heart Rate"
    )
  )

  want <- value(
    "SYSBP" = "Systolic Blood Pressure",
    "DIABP" = "Diastolic Blood Pressure",
    "HR" = "Heart Rate"
  )

  expect_equal(SASformatR::ctls$formats$PARAMCD, want)
})

test_that("the same catalog can be added to multiple times", {
  proc_format(
    PARAMCD = value(
      "SYSBP" = "Systolic Blood Pressure",
      "DIABP" = "Diastolic Blood Pressure",
      "HR" = "Heart Rate"
    )
  )

  proc_format(
    AGEGR1 = value(
      "< 21" = "<21",
      "21 - 39" = "21 - 39",
      "40 <=" = ">=40"
    )
  )

  want <- list(
    AGEGR1 = value(
      "< 21" = "<21",
      "21 - 39" = "21 - 39",
      "40 <=" = ">=40"
    ),
    PARAMCD = value(
      "SYSBP" = "Systolic Blood Pressure",
      "DIABP" = "Diastolic Blood Pressure",
      "HR" = "Heart Rate"
    )
  )

  expect_identical(SASformatR::ctls$formats, want)
  proc_format(catalog="formats", delete=TRUE)
})

test_that("catalogs can be named", {
  proc_format(catalog = "myFormats")

  want <- new.env(parent = emptyenv())
  want$myFormats <- list()

  expect_equal(SASformatR::ctls, want)
  proc_format(catalog = "myFormats", delete = T)
})
