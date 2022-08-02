context("correspondence analysis, class 'ca'")

fit_ca <- ca::ca(HairEyeColor[, , "Male"])

test_that("`as_tbl_ord()` coerces 'ca' objects", {
  expect_true(valid_tbl_ord(as_tbl_ord(fit_ca)))
})

test_that("'ca' augmentations are consistent with '.element' column", {
  expect_equal(".element" %in% names(recover_aug_rows(fit_ca)),
               ".element" %in% names(recover_aug_cols(fit_ca)))
})
