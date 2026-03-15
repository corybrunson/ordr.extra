skip_if_not_installed("psych")

fit_fa <- psych::fa(r = swiss, nfactors = 2L, rotate = "varimax", 
                    scores = "regression", fm = "ml")

fit_factanal <- factanal(swiss, factors = 2L, rotation = "varimax", 
                         scores = "regression")

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

test_that("'fa' accessors agree with 'factanal' accessors", {
  expect_equal(unname(fit_fa$loadings), unname(fit_factanal$loadings), 
               tolerance = 3L)
})
