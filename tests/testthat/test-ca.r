skip_if_not_installed("ca")

fit_ca <- ca::ca(HairEyeColor[, , "Male"])

test_that("'ca' accessors have consistent dimensions", {
  expect_equal(ncol(get_rows(fit_ca)), ncol(get_cols(fit_ca)))
  expect_equal(ncol(get_rows(fit_ca)),
               length(recover_inertia(fit_ca)))
})

test_that("'CCA' has specified distribution of inertia", {
  expect_type(recover_conference(fit_ca), "double")
  expect_vector(recover_conference(fit_ca), size = 2L)
})

test_that("`as_tbl_ord()` coerces 'ca' objects", {
  expect_true(valid_tbl_ord(as_tbl_ord(fit_ca)))
})

test_that("'ca' augmentations are consistent with '.element' column", {
  expect_equal(".element" %in% names(recover_aug_rows(fit_ca)),
               ".element" %in% names(recover_aug_cols(fit_ca)))
})
