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
#' @template param-methods
#' @template return-methods
#' @family methods for singular value decomposition-based techniques
#' @family models from the **logisticPCA** package
#' @example inst/examples/ex-methods-logisticpca-lsvd-finches.r
NULL

#' @importFrom stats plogis

#' @rdname methods-lpca
#' @export
as_tbl_ord.lsvd <- as_tbl_ord_default

recover_dims_lsvd <- function(x, .matrix) {
  .matrix <- match_factor(.matrix)
  res <- x[[switch(.matrix, rows = "A", cols = "B")]]
  colnames(res) <- recover_coord(x)
  res
}

#' @rdname methods-lpca
#' @export
recover_rows.lsvd <- function(x) recover_dims_lsvd(x, "rows")

#' @rdname methods-lpca
#' @export
recover_cols.lsvd <- function(x) recover_dims_lsvd(x, "cols")

#' @rdname methods-lpca
#' @export
recover_coord.lsvd <- function(x) paste0("LSC", 1:ncol(x$A))

#' @rdname methods-lpca
#' @export
recover_aug_rows.lsvd <- function(x) {
  name <- rownames(x$A)
  res <- if (is.null(name)) {
    tibble_pole(nrow(x$A))
  } else {
    tibble(name = name)
  }
  res
}

#' @rdname methods-lpca
#' @export
recover_aug_cols.lsvd <- function(x) {
  name <- rownames(x$B)
  res <- if (is.null(name)) {
    tibble_pole(nrow(x$B))
  } else {
    tibble(name = name)
  }
  res$mu <- x$mu
  res
}

#' @rdname methods-lpca
#' @export
recover_aug_coord.lsvd <- function(x) {
  tibble(
    name = factor_coord(recover_coord.lsvd(x))
  )
}
