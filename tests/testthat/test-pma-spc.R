skip_if_not_installed("PMA")

fit_spc <- PMA::SPC(
  as.matrix(iris[, -5L]),
  sumabsv = sqrt(2),
  K = 2L,
  cnames = names(iris)[seq(4L)]
)

test_that("'SPC' accessors have consistent dimensions", {
  expect_equal(ncol(get_rows(fit_spc)), ncol(get_cols(fit_spc)))
  expect_equal(ncol(get_rows(fit_spc)), length(recover_inertia(fit_spc)))
})

test_that("'SPC' has specified distribution of inertia", {
  expect_type(recover_conference(fit_spc), "double")
  expect_vector(recover_conference(fit_spc), size = 2L)
})

test_that("'SPC' augmentations are consistent with '.element' column", {
  expect_equal(".element" %in% names(recover_aug_rows(fit_spc)),
               ".element" %in% names(recover_aug_cols(fit_spc)))
})

test_that("`as_tbl_ord()` coerces 'SPC' objects", {
  expect_true(valid_tbl_ord(as_tbl_ord(fit_spc)))
})
