skip_if_not_installed("nipals")

aq_sub <- airquality[airquality$Month == 6L, seq(4L)]
fit_empca <- ordinate(x = aq_sub, model = empca_ord, cols = 1:4)

test_that("'empca' accessors have consistent dimensions", {
  expect_equal(ncol(get_rows(fit_empca)), ncol(get_cols(fit_empca)))
  expect_equal(ncol(get_rows(fit_empca)),
               length(recover_inertia(fit_empca)))
})

test_that("'empca' has specified distribution of inertia", {
  expect_type(recover_conference(fit_empca), "double")
  expect_vector(recover_conference(fit_empca), size = 2L)
})

test_that("`as_tbl_ord()` coerces 'nipals' objects", {
  expect_true(valid_tbl_ord(as_tbl_ord(fit_empca)))
})

test_that("'nipals_ord' augmentations are consistent with '.element' column", {
  expect_equal(".element" %in% names(recover_aug_rows(fit_empca)),
               ".element" %in% names(recover_aug_cols(fit_empca)))
})
