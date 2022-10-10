#' @title Functionality for non-linear iterative PLS ('nipals_ord') objects
#'
#' @description These methods extract data from, and attribute new data to,
#'   objects of class `"nipals_ord"`. This is a class introduced in this package
#'   to identify objects returned by [nipals_ord()], which wraps
#'   [nipals::nipals()].
#'
#' @name methods-nipals-nipals
#' @include ordr-extra.r
#' @template param-methods
#' @template return-methods
#' @family methods for singular value decomposition-based techniques
#' @family models from the **nipals** package
#' @example inst/examples/ex-methods-nipals-nipals-airquality.r
NULL

#' @rdname methods-nipals-nipals
#' @export
as_tbl_ord.nipals_ord <- as_tbl_ord_default

#' @rdname methods-nipals-nipals
#' @export
recover_rows.nipals_ord <- function(x) x[["scores"]]

#' @rdname methods-nipals-nipals
#' @export
recover_cols.nipals_ord <- function(x) x[["loadings"]]

#' @rdname methods-nipals-nipals
#' @export
recover_inertia.nipals_ord <- function(x) x[["eig"]]

#' @rdname methods-nipals-nipals
#' @export
recover_coord.nipals_ord <- function(x) colnames(x[["scores"]])

#' @rdname methods-nipals-nipals
#' @export
recover_conference.nipals_ord <- function(x) {
  # `nipals::nipals()` normalizes both row and column coordinates
  c(0, 0)
}

#' @rdname methods-nipals-nipals
#' @export
recover_aug_rows.nipals_ord <- function(x) {
  name <- rownames(x[["scores"]])
  if (is.null(name)) {
    tibble_pole(nrow(x[["scores"]]))
  } else {
    tibble(name = name)
  }
}

#' @rdname methods-nipals-nipals
#' @export
recover_aug_cols.nipals_ord <- function(x) {
  name <- rownames(x[["loadings"]])
  res <- if (is.null(name)) {
    tibble_pole(nrow(x[["loadings"]]))
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

#' @rdname methods-nipals-nipals
#' @export
recover_aug_coord.nipals_ord <- function(x) {
  tibble(
    name = factor_coord(recover_coord(x)),
    eig = x[["eig"]],
    R2 = x[["R2"]],
    iter = x[["iter"]]
  )
}
