set.seed(1)
rdata <- data.frame(
  a = rnorm(n = 5L, mean = 5),
  b = rpois(n = 5L, lambda = 3),
  c = runif(n = 5L)
)

test_that("`ordinate()` can handle {ca} models", {
  skip_if_not_installed("ca")
  expect_error(ordinate(rdata, ca::ca), regexp = NA)
})

test_that("`ordinate()` can handle {ade4} models", {
  skip_if_not_installed("ade4")
  expect_error(ordinate(rdata, ade4::nipals), regexp = NA)
})

test_that("`ordinate()` can handle {nipals} models", {
  skip_if_not_installed("nipals")
  expect_error(ordinate(rdata, nipals_ord), regexp = NA)
})
