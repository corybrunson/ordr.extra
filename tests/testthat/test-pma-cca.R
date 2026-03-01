skip_if_not_installed("PMA")

fit_cca <- PMA::CCA(LifeCycleSavings[, c(2L, 3L)],
  LifeCycleSavings[, c(1L, 4L, 5L)], typex = "standard", typez = "standard")

test_that("'CCA' accessors have consistent dimensions", {
  expect_equal(ncol(get_rows(fit_cca)), ncol(get_cols(fit_cca)))
  expect_equal(ncol(get_rows(fit_cca)), length(recover_inertia(fit_cca)))
})

test_that("'CCA' has specified distribution of inertia", {
  expect_type(recover_conference(fit_cca), "double")
  expect_vector(recover_conference(fit_cca), size = 2L)
})

test_that("'CCA' augmentations are consistent with '.element' column", {
  expect_equal(".element" %in% names(recover_aug_rows(fit_cca)),
               ".element" %in% names(recover_aug_cols(fit_cca)))
})

test_that("`as_tbl_ord()` coerces 'CCA' objects", {
  expect_true(valid_tbl_ord(as_tbl_ord(fit_cca)))
})
