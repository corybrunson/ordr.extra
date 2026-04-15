skip_if_not_installed("candisc")

iris_mlm <-lm(
  cbind(Petal.Length, Sepal.Length, Petal.Width, Sepal.Width) ~ Species,
  data = iris
)

fit_candisc <- candisc::candisc(iris_mlm)

test_that("'candisc' accessors have consistent dimensions", {
  expect_equal(ncol(get_rows(fit_candisc)), ncol(get_cols(fit_candisc)))
  expect_equal(ncol(get_rows(fit_candisc)),
               length(recover_inertia(fit_candisc)))
})

test_that("`as_tbl_ord()` coerces 'candisc' objects", {
  expect_true(valid_tbl_ord(as_tbl_ord(fit_candisc)))
})

test_that("'candisc' augmentations are consistent with '.element' column", {
  expect_equal(".element" %in% names(recover_aug_rows(fit_candisc)),
               ".element" %in% names(recover_aug_cols(fit_candisc)))
})
