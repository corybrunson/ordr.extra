skip_if_not_installed("logisticPCA")
skip_if_not_installed("cooccur")

data(finches, package = "cooccur")
fit_lsvd <- logisticSVD_ord(t(finches))
fit_lpca <- logisticPCA_ord(t(finches))
fit_clpca <- convexLogisticPCA_ord(t(finches[-13L, , drop = FALSE]))

test_that("'logisticPCA' accessors have consistent dimensions", {
  expect_equal(nrow(recover_rows(fit_lsvd)), nrow(recover_aug_rows(fit_lsvd)))
  expect_equal(nrow(recover_cols(fit_lsvd)), nrow(recover_aug_cols(fit_lsvd)))
  expect_equal(ncol(get_rows(fit_lsvd)), ncol(get_cols(fit_lsvd)))
  
  expect_equal(nrow(recover_rows(fit_lpca)), nrow(recover_aug_rows(fit_lpca)))
  expect_equal(nrow(recover_cols(fit_lpca)), nrow(recover_aug_cols(fit_lpca)))
  expect_equal(ncol(get_rows(fit_lpca)), ncol(get_cols(fit_lpca)))
  
  expect_equal(nrow(recover_rows(fit_clpca)), nrow(recover_aug_rows(fit_clpca)))
  expect_equal(nrow(recover_cols(fit_clpca)), nrow(recover_aug_cols(fit_clpca)))
  expect_equal(ncol(get_rows(fit_clpca)), ncol(get_cols(fit_clpca)))
})

test_that("'logisticPCA' has specified distribution of inertia", {
  expect_equal(recover_inertia(fit_lsvd), as.double(NA))
  expect_equal(recover_inertia(fit_lpca), as.double(NA))
  expect_equal(recover_inertia(fit_clpca), as.double(NA))
})

test_that("changing conference of inertia for 'logisticPCA' returns error", {
  expect_error(confer_inertia(fit_lsvd, "rows"))
  expect_error(confer_inertia(fit_lpca, "rows"))
  expect_error(confer_inertia(fit_clpca, "rows"))
})

test_that("`as_tbl_ord()` coerces 'lsvd', 'lpca', & 'clpca' objects", {
  expect_true(valid_tbl_ord(as_tbl_ord(fit_lsvd)))
  expect_true(valid_tbl_ord(as_tbl_ord(fit_lpca)))
  expect_true(valid_tbl_ord(as_tbl_ord(fit_clpca)))
})

test_that("'lsvd' augmentations are consistent with '.element' column", {
  expect_equal(".element" %in% names(recover_aug_rows(fit_lsvd)),
               ".element" %in% names(recover_aug_cols(fit_lsvd)))
  expect_equal(".element" %in% names(recover_aug_rows(fit_lpca)),
               ".element" %in% names(recover_aug_cols(fit_lpca)))
  expect_equal(".element" %in% names(recover_aug_rows(fit_clpca)),
               ".element" %in% names(recover_aug_cols(fit_clpca)))
})
