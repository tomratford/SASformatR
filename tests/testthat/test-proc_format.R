# test functionality
test_that("A catalog is created with nothing in", {
  proc_format()

  want <- new.env()

  expect_equal(formats, )
})
