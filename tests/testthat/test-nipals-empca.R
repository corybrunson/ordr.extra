skip_if_not_installed("nipals")

aq_sub <- airquality[airquality$Month == 6L, seq(4L)]
fit_empca <- ordinate(x = aq_sub, model = empca_ord, cols = 1:4)

test_that("`as_tbl_ord()` coerces 'nipals' objects", {
  expect_true(valid_tbl_ord(as_tbl_ord(fit_empca)))
})

test_that("'nipals_ord' augmentations are consistent with '.element' column", {
  expect_equal(".element" %in% names(recover_aug_rows(fit_empca)),
               ".element" %in% names(recover_aug_cols(fit_empca)))
})
