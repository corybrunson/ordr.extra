#' @title Wrappers for lossy ordination methods
#'
#' @description These `*_ord` functions wrap functions imported from other
#'   packages with modifications for use with '[tbl_ord]' methods. They
#'   complement those provided by **ordr** for some common functions. Some
#'   parameters are hidden from the user and set to settings required for these
#'   methods, some matrix outputs are given row or column names to be used by
#'   them, and new '*_ord' S3 class attributes are added to enable them.
#'   

#' @details
#' 
#' The following table summarizes the wrapped functions:
#' 
#' | Original function                  | Hide params | Add names | New class |
#' | :--------------------------------- | :---------- | :-------- | :-------- |
#' | [logisticPCA::logisticSVD()]       | No          | Yes       | No        |
#' | [logisticPCA::logisticPCA()]       | No          | Yes       | No        |
#' | [logisticPCA::convexLogisticPCA()] | No          | Yes       | No        |
#' | [nipals::nipals()]                 | No          | No        | Yes       |
#' | [nipals::empca()]                  | No          | No        | Yes       |

#' @name wrap-ord-extra
#' @inheritParams logisticPCA::logisticPCA
#' @inheritParams logisticPCA::logisticSVD
#' @inheritParams logisticPCA::convexLogisticPCA
#' @inheritParams nipals::nipals
#' @inheritParams nipals::empca
#' @param ... Additional parameters passed to original functions.
#' @return Objects slightly modified from the outputs of the original functions,
#'   with new '*-ord' classes.
#' @seealso [ordr::wrap-ord]
NULL

#' @rdname wrap-ord-extra
#' @export
logisticSVD_ord <- function(
    x, k = 2,
    quiet = TRUE, max_iters = 1000,
    conv_criteria = 1e-05, random_start = FALSE,
    ...,
    partial_decomp = TRUE, main_effects = TRUE
) {
  lsvd <- logisticPCA::logisticSVD(
    x = x, k = k,
    quiet = quiet, max_iters = max_iters,
    conv_criteria = conv_criteria, random_start = random_start,
    ...,
    partial_decomp = partial_decomp, main_effects = main_effects
  )
  rownames(lsvd$A) <- rownames(x)
  rownames(lsvd$B) <- colnames(x)
  lsvd
}

#' @rdname wrap-ord-extra
#' @export
logisticPCA_ord <- function(
    x, k = 2, m = 4,
    quiet = TRUE, partial_decomp = FALSE,
    max_iters = 1000, conv_criteria = 1e-05,
    random_start = FALSE,
    ...,
    main_effects = TRUE
) {
  lpca <- logisticPCA::logisticPCA(
    x, k = k,
    m = m, quiet = quiet, partial_decomp = partial_decomp,
    max_iters = max_iters, conv_criteria = conv_criteria,
    random_start = random_start,
    ...,
    main_effects = main_effects
  )
  rownames(lpca$U) <- colnames(x)
  #rownames(lpca$PCs) <- rownames(x)
  lpca
}

#' @rdname wrap-ord-extra
#' @export
convexLogisticPCA_ord <- function(
    x, k = 2, m = 4,
    quiet = TRUE, partial_decomp = FALSE,
    max_iters = 1000, conv_criteria = 1e-06,
    random_start = FALSE,
    ...,
    main_effects = TRUE, ss_factor = 4
) {
  lpca <- logisticPCA::convexLogisticPCA(
    x, k = k,
    m = m, quiet = quiet, partial_decomp = partial_decomp,
    max_iters = max_iters, conv_criteria = conv_criteria,
    random_start = random_start,
    ...,
    main_effects = main_effects, ss_factor = 4
  )
  rownames(lpca$U) <- colnames(x)
  #rownames(lpca$PCs) <- rownames(x)
  lpca
}

#' @rdname wrap-ord-extra
#' @export
nipals_ord <- function(
    x, ncomp = min(nrow(x), ncol(x)), center = TRUE, scale = TRUE, 
    maxiter = 500, tol = 1e-06, startcol = 0, fitted = FALSE, 
    force.na = FALSE, gramschmidt = TRUE, verbose = FALSE
) {
  res <- nipals::nipals(
    x, ncomp = ncomp, center = center, scale = scale,
    maxiter = maxiter, tol = tol, startcol = startcol, fitted = fitted,
    force.na = force.na, gramschmidt = gramschmidt, verbose = verbose
  )
  class(res) <- "nipals_ord"
  res
}

#' @rdname wrap-ord-extra
#' @export
empca_ord <- function (
    x, w, ncomp = min(nrow(x), ncol(x)), center = TRUE, scale = TRUE,
    maxiter = 100, tol = 1e-06, seed = NULL, fitted = FALSE, 
    gramschmidt = TRUE, verbose = FALSE
) {
  res <- nipals::empca(
    x, w, ncomp = ncomp, center = center, scale = scale,
    maxiter = maxiter, tol = tol, seed = seed, fitted = fitted,
    gramschmidt = gramschmidt, verbose = verbose
  )
  class(res) <- "empca_ord"
  res
}
