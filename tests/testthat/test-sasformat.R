test_that("the underlying values of a SASformat vector are the same", {
  proc_format(
    AGEGR1 = value(
      "< 21" = "<21",
      "21 - 39" = "21 - 39",
      "40 <=" = ">=40"
    )
  )

  age <- c(10,20,30,40,50)
  want <- age
  attributes(want) <- list(class = "SASformat",
                           format = "AGEGR1",
                           catalog = "formats")

  got <- SASformat(age, "AGEGR1")

  expect_equal(want, got)
  proc_format(delete = T)
})

test_that("error if there is no catalog", {
  expect_error(SASformat("", "agegr1", "formats"),
               "Format catalog `formats` does not exist")
})

test_that("error if no format that matches name", {
  proc_format()
  expect_error(SASformat("","mycoolformat"))
})


