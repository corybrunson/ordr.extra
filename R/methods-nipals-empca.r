#' @title Functionality for expectation maximization PCA ('empca_ord') objects
#'
#' @description These methods extract data from, and attribute new data to,
#'   objects of class `"empca_ord"`. This is a class introduced in this package
#'   to identify objects returned by [empca_ord()], which wraps
#'   [nipals::empca()].
#'
#' @name methods-nipals-empca
#' @include ordr-extra.r
#' @template param-methods
#' @template return-methods
#' @family methods for singular value decomposition-based techniques
#' @family models from the **nipals** package
#' @example inst/examples/ex-methods-nipals-empca-airquality.r
NULL

#' @rdname methods-nipals-empca
#' @export
as_tbl_ord.empca_ord <- as_tbl_ord_default

#' @rdname methods-nipals-empca
#' @export
recover_rows.empca_ord <- function(x) x[["scores"]]

#' @rdname methods-nipals-empca
#' @export
recover_cols.empca_ord <- function(x) x[["loadings"]]

#' @rdname methods-nipals-empca
#' @export
recover_inertia.empca_ord <- function(x) x[["eig"]]

#' @rdname methods-nipals-empca
#' @export
recover_coord.empca_ord <- function(x) colnames(x[["scores"]])

#' @rdname methods-nipals-empca
#' @export
recover_conference.empca_ord <- function(x) {
  # `nipals::empca()` normalizes both row and column coordinates
  c(0, 0)
}

#' @rdname methods-nipals-empca
#' @export
recover_aug_rows.empca_ord <- function(x) {
  name <- rownames(x[["scores"]])
  if (is.null(name)) {
    tibble(.rows = nrow(x[["scores"]]))
  } else {
    tibble(name = name)
  }
}

#' @rdname methods-nipals-empca
#' @export
recover_aug_cols.empca_ord <- function(x) {
  name <- rownames(x[["loadings"]])
  res <- if (is.null(name)) {
    tibble(.rows = nrow(x[["loadings"]]))
  } else {
    tibble(name = name)
  }
  if (! identical(x[["center"]], NA)) {
    res <- dplyr::bind_cols(res, center = x[["center"]])
  }
  if (! identical(x[["scale"]], NA)) {
    res <- dplyr::bind_cols(res, scale = x[["scale"]])
  }
  res
}

#' @rdname methods-nipals-empca
#' @export
recover_aug_coord.empca_ord <- function(x) {
  tibble(
    name = factor_coord(recover_coord(x)),
    eig = x[["eig"]],
    R2 = x[["R2"]],
    iter = x[["iter"]]
  )
}
