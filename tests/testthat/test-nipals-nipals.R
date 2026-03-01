skip_if_not_installed("nipals")

aq_sub <- airquality[airquality$Month == 6L, seq(4L)]
fit_nipals_ord <- nipals::nipals(aq_sub)

test_that("`as_tbl_ord()` coerces 'nipals' objects", {
  expect_equal(class(fit_nipals_ord), "nipals_ord")
  expect_true(valid_tbl_ord(as_tbl_ord(fit_nipals_ord)))
})

test_that("'nipals_ord' augmentations are consistent with '.element' column", {
  expect_equal(".element" %in% names(recover_aug_rows(fit_nipals_ord)),
               ".element" %in% names(recover_aug_cols(fit_nipals_ord)))
})
