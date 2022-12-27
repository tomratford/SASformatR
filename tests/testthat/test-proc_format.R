# test functionality
test_that("a catalog is created with nothing in", {
  proc_format()

  want <- list()

  expect_equal(formats, want)
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

  expect_equal(formats$PARAMCD, want)
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

  expect_identical(formats, want)
})

test_that("catalogs can be named", {
  proc_format(catalog = "myFormats")

  want <- list()

  expect_equal(myFormats, want)
})
