skip_if_not_installed("nipals")

aq_sub <- airquality[airquality$Month == 6L, seq(4L)]
fit_nipals_ord <- ordinate(x = aq_sub, model = nipals_ord, cols = 1:4)

test_that("'nipals' accessors have consistent dimensions", {
  expect_equal(ncol(get_rows(fit_nipals_ord)), ncol(get_cols(fit_nipals_ord)))
  expect_equal(ncol(get_rows(fit_nipals_ord)),
               length(recover_inertia(fit_nipals_ord)))
})

test_that("'nipals' has specified distribution of inertia", {
  expect_type(recover_conference(fit_nipals_ord), "double")
  expect_vector(recover_conference(fit_nipals_ord), size = 2L)
})

test_that("`as_tbl_ord()` coerces 'nipals' objects", {
  expect_true(valid_tbl_ord(as_tbl_ord(fit_nipals_ord)))
})

test_that("'nipals_ord' augmentations are consistent with '.element' column", {
  expect_equal(".element" %in% names(recover_aug_rows(fit_nipals_ord)),
               ".element" %in% names(recover_aug_cols(fit_nipals_ord)))
})
