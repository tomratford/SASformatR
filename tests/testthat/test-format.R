test_that("a format works as expected", {
  proc_format(
    AGEGR1 = value(
      "< 21" = "<21",
      "21 - 39" = "21 - 39",
      "40 <=" = ">=40"
    )
  )
  age <- SASformat(c(10,20,30,40,50),
                   "AGEGR1")

  got <- format.SASformat(age)

  want <- c("<21","<21","21 - 39",">=40",">=40")

  expect_equal(got, want)
  proc_format(delete = T)
})

test_that("if a catalog is deleted then the format breaks", {
  proc_format(
    AGEGR1 = value(
      "< 21" = "<21",
      "21 - 39" = "21 - 39",
      "40 <=" = ">=40"
    )
  )
  age <- SASformat(c(10,20,30,40,50),
                   "AGEGR1")
  proc_format(delete = T)

  expect_error(format.SASformat(age))
})
