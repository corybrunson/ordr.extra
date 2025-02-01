skip_if_not_installed("psych")

fit_principal <- psych::principal(iris[, -5], nfactors = 4, rotate = "none")

test_that("'principal' accessors have consistent dimensions", {
  expect_equal(ncol(get_rows(fit_principal)), ncol(get_cols(fit_principal)))
  expect_equal(ncol(get_rows(fit_principal)),
               length(recover_inertia(fit_principal)))
})

test_that("'principal' has specified distribution of inertia", {
  expect_type(recover_conference(fit_principal), "double")
  expect_vector(recover_conference(fit_principal), size = 2L)
})

test_that("'principal' augmentations are consistent with '.element' column", {
  expect_equal(".element" %in% names(recover_aug_rows(fit_principal)),
               ".element" %in% names(recover_aug_cols(fit_principal)))
})

test_that("`as_tbl_ord()` coerces 'principal' objects", {
  expect_true(valid_tbl_ord(as_tbl_ord(fit_principal)))
})

fit_fa <- psych::fa(r = swiss, nfactors = 2L, rotate = "varimax", scores = "regression", 
                    fm = "ml")

test_that("'fa' accessors have consistent dimensions", {
  expect_equal(ncol(get_rows(fit_fa)), ncol(get_cols(fit_fa)))
  expect_equal(ncol(get_rows(fit_fa)),
               length(recover_inertia(fit_fa)))
})

test_that("'fa' has specified distribution of inertia", {
  expect_type(recover_conference(fit_fa), "double")
  expect_vector(recover_conference(fit_fa), size = 2L)
})

test_that("'fa' augmentations are consistent with '.element' column", {
  expect_equal(".element" %in% names(recover_aug_rows(fit_fa)),
               ".element" %in% names(recover_aug_cols(fit_fa)))
})

test_that("`as_tbl_ord()` coerces 'fa' objects", {
  expect_true(valid_tbl_ord(as_tbl_ord(fit_fa)))
})
