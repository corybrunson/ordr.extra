skip_if_not_installed("ca")

fit_mjca <- ca::mjca(HairEyeColor[, , "Male"])

test_that("'mjca' accessors have consistent dimensions", {
  expect_equal(ncol(get_rows(fit_mjca)), ncol(get_cols(fit_mjca)))
  expect_equal(ncol(get_rows(fit_mjca)),
               length(recover_inertia(fit_mjca)))
})

test_that("`as_tbl_ord()` coerces 'ca' objects", {
  expect_true(valid_tbl_ord(as_tbl_ord(fit_mjca)))
})

test_that("'ca' augmentations are consistent with '.element' column", {
  expect_equal(".element" %in% names(recover_aug_rows(fit_mjca)),
               ".element" %in% names(recover_aug_cols(fit_mjca)))
})
