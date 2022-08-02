#' @title Functionality for logistic PCA and logistic SVD objects
#'
#' @description These methods extract data from, and attribute new data to,
#'   objects of class `"lpca"` and `"lsvd"` from the
#'   **[logisticPCA][logisticPCA::logisticPCA-package]** package.
#'
#' @template section-logisticpca
#' 
#' @template ref-landgraf2020
#' 
#' @name methods-lpca
#' @include ordr-extra.r
#' @include methods-logisticpca-lsvd.r
#' @template param-methods
#' @family methods for singular value decomposition-based techniques
#' @family models from the **logisticPCA** package
#' @example inst/examples/ex-methods-lpca-finches.r
NULL

#' @importFrom stats plogis

#' @rdname methods-lpca
#' @export
as_tbl_ord.lpca <- as_tbl_ord_default

recover_dims_lpca <- function(x, .matrix) {
  .matrix <- match_factor(.matrix)
  res <- x[[switch(.matrix, rows = "PCs", cols = "U")]]
  colnames(res) <- recover_coord(x)
  res
}

#' @rdname methods-lpca
#' @export
recover_rows.lpca <- function(x) recover_dims_lpca(x, "rows")

#' @rdname methods-lpca
#' @export
recover_cols.lpca <- function(x) recover_dims_lpca(x, "cols")

#' @rdname methods-lpca
#' @export
recover_coord.lpca <- function(x) paste0("LPC", 1:ncol(x$U))

#' @rdname methods-lpca
#' @export
recover_aug_rows.lpca <- function(x) {
  .name <- rownames(x$PCs)
  res <- if (is.null(.name)) {
    tibble_pole(nrow(x$PCs))
  } else {
    tibble(.name = .name)
  }
  res
}

#' @rdname methods-lpca
#' @export
recover_aug_cols.lpca <- function(x) {
  .name <- rownames(x$U)
  res <- if (is.null(.name)) {
    tibble_pole(nrow(x$U))
  } else {
    tibble(.name = .name)
  }
  res$.mu <- x$mu
  res
}

#' @rdname methods-lpca
#' @export
recover_aug_coord.lpca <- function(x) {
  tibble(
    .name = factor_coord(recover_coord.lpca(x))
  )
}
