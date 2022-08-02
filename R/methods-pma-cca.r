#' @title Functionality for penalized multivariate analysis ('CCA') objects
#'
#' @description These methods extract data from, and attribute new data to,
#'   objects of class 'CCA' from the **[PMA][PMA::PMA-package]** package.
#'
#' @template section-pma
#' 
#' @template ref-witten2009
#' 
#' @name methods-pma-cca
#' @include ordr-extra.r
#' @template param-methods
#' @family methods for singular value decomposition-based techniques
#' @family models from the **PMA** package
#' @example inst/examples/ex-methods-pma-cca-savings.r
NULL

#' @rdname methods-pma-cca
#' @export
as_tbl_ord.CCA <- as_tbl_ord_default

#' @rdname methods-pma-cca
#' @export
recover_coord.CCA <- function(x) {
  paste0("sCD", seq(x$K))
}

#' @rdname methods-pma-cca
#' @export
recover_rows.CCA <- function(x) {
  res <- x$u
  if (! is.null(x$xnames)) rownames(res) <- x$xnames
  colnames(res) <- recover_coord(x)
  res
}

#' @rdname methods-pma-cca
#' @export
recover_cols.CCA <- function(x) {
  res <- x$v
  if (! is.null(x$znames)) rownames(res) <- x$znames
  colnames(res) <- recover_coord(x)
  res
}

#' @rdname methods-pma-cca
#' @export
recover_inertia.CCA <- function(x) x$cors^2

#' @rdname methods-pma-cca
#' @export
recover_conference.CCA <- function(x) {
  # `u`, `v`, and `d` comprise the singular value decomposition
  c(0, 0)
}

#' @rdname methods-pma-cca
#' @export
recover_aug_rows.CCA <- function(x) {
  .name <- x$xnames
  if (is.null(.name)) {
    tibble_pole(nrow(x$u))
  } else {
    tibble(.name = .name)
  }
}

#' @rdname methods-pma-cca
#' @export
recover_aug_cols.CCA <- function(x) {
  .name <- x$znames
  if (is.null(.name)) {
    tibble_pole(nrow(x$v))
  } else {
    tibble(.name = .name)
  }
}

#' @rdname methods-pma-cca
#' @export
recover_aug_coord.CCA <- function(x) {
  tibble(
    .name = factor_coord(recover_coord(x)),
    .cancor = x$cors
  )
}
