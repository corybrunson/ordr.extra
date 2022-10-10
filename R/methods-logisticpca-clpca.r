#' @title Functionality for logistic PCA and logistic SVD objects
#'
#' @description These methods extract data from, and attribute new data to,
#'   objects of class `"lpca"` and `"lsvd"` from the
#'   **[logisticPCA][logisticPCA::logisticPCA-package]** package.
#'
#' @template section-logisticpca
#' 
#' @template ref-landgraf2020
#' @template ref-collins2001
#' 
#' @name methods-lpca
#' @include ordr-extra.r
#' @include methods-logisticpca-lpca.r
#' @template param-methods
#' @template return-methods
#' @family methods for singular value decomposition-based techniques
#' @family models from the **logisticPCA** package
#' @example inst/examples/ex-methods-logisticpca-clpca-finches.r
NULL

#' @importFrom stats plogis

#' @rdname methods-lpca
#' @export
as_tbl_ord.clpca <- as_tbl_ord_default

#' @rdname methods-lpca
#' @export
recover_rows.clpca <- function(x) recover_dims_lpca(x, "rows")

#' @rdname methods-lpca
#' @export
recover_cols.clpca <- function(x) recover_dims_lpca(x, "cols")

#' @rdname methods-lpca
#' @export
recover_coord.clpca <- function(x) paste0("LPC", 1:ncol(x$U))

#' @rdname methods-lpca
#' @export
recover_aug_rows.clpca <- function(x) {
  name <- rownames(x$PCs)
  res <- if (is.null(name)) {
    tibble_pole(nrow(x$PCs))
  } else {
    tibble(name = name)
  }
  res
}

#' @rdname methods-lpca
#' @export
recover_aug_cols.clpca <- function(x) {
  name <- rownames(x$U)
  res <- if (is.null(name)) {
    tibble_pole(nrow(x$U))
  } else {
    tibble(name = name)
  }
  res$mu <- x$mu
  res
}

#' @rdname methods-lpca
#' @export
recover_aug_coord.clpca <- function(x) {
  tibble(
    name = factor_coord(recover_coord.clpca(x))
  )
}
