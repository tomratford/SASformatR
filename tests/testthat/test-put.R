test_that("we can put a vector of records", {
  proc_format(
    AGEGR1 = value(
      "< 21" = "<21",
      "21 - 39" = "21 - 39",
      "40 <=" = ">=40"
    )
  )
  age <- c(10,20,30,40,50)
  got <- put(age, "AGEGR1")

  want <- c("<21","<21","21 - 39",">=40",">=40")

  expect_equal(got, want)
  proc_format(delete = T)
})
