skip_if_not_installed("candisc")

x <- iris[, 1:2]
y <- iris[, 3:4]

fit_cancor <- candisc::cancor(x, y)

test_that("'cancor' accessors have consistent dimensions", {
  expect_equal(ncol(get_rows(fit_cancor)), ncol(get_cols(fit_cancor)))
  expect_equal(ncol(get_rows(fit_cancor)),
               length(recover_inertia(fit_cancor)))
})

test_that("`as_tbl_ord()` coerces 'cancor' objects", {
  expect_true(valid_tbl_ord(as_tbl_ord(fit_cancor)))
})

test_that("'cancor' augmentations are consistent with '.element' column", {
  expect_equal(".element" %in% names(recover_aug_rows(fit_cancor)),
               ".element" %in% names(recover_aug_cols(fit_cancor)))
})
