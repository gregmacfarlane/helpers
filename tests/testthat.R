library(testthat)
library(helpers)

test_that("exponential growth rate is correct", {
  expect_equal(calc_exprate(10, 12, 2010, 2012), 0.09116078, tolerance = 1e-5)
  expect_equal(interpolate_exponential(10, 12, 2010, 2012, 2011),
               10.95445, tolerance = 1e-5)
})
