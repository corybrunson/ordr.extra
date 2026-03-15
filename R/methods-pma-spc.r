#' @title Functionality for penalized multivariate analysis ('SPC') objects
#'
#' @description These methods extract data from, and attribute new data to,
#'   objects of class 'SPC' from the **[PMA][PMA::PMA-package]** package.
#'
#' @template section-pma
#' 
#' @template ref-witten2009
#' 
#' @name methods-pma-spc
#' @include ordr-extra.r
#' @template param-methods
#' @template return-methods
#' @family methods for singular value decomposition-based techniques
#' @family models from the **PMA** package
#' @example inst/examples/ex-methods-pma-spc-iris.r
NULL

#' @rdname methods-pma-spc
#' @export
as_tbl_ord.SPC <- as_tbl_ord_default

#' @rdname methods-pma-spc
#' @export
recover_coord.SPC <- function(x) {
  paste0("sPC", seq(x$K))
}

#' @rdname methods-pma-spc
#' @export
recover_rows.SPC <- function(x) {
  res <- x$u
  if (! is.null(x$rnames)) rownames(res) <- x$rnames
  colnames(res) <- recover_coord(x)
  res
}

#' @rdname methods-pma-spc
#' @export
recover_cols.SPC <- function(x) {
  res <- x$v
  if (! is.null(x$cnames)) rownames(res) <- x$cnames
  colnames(res) <- recover_coord(x)
  res
}

#' @rdname methods-pma-spc
#' @export
recover_inertia.SPC <- function(x) {
  if (is.null(x$prop.var.explained)) {
    rep(NA_real_, x$K)
  } else {
    diff(c(0, x$prop.var.explained))
  }
}

#' @rdname methods-pma-spc
#' @export
recover_conference.SPC <- function(x) {
  # `u`, `v`, and `d` comprise the singular value decomposition
  c(0, 0)
}

#' @rdname methods-pma-spc
#' @export
recover_aug_rows.SPC <- function(x) {
  name <- x$rnames
  res <- if (is.null(name)) {
    tibble(.rows = nrow(x$u))
  } else {
    tibble(name = name)
  }
  if (! is.null(x[["meanx"]])) {
    res <- dplyr::bind_cols(res, meanx = x[["meanx"]])
  }
  res
}

#' @rdname methods-pma-spc
#' @export
recover_aug_cols.SPC <- function(x) {
  name <- x$cnames
  res <- if (is.null(name)) {
    tibble(.rows = nrow(x$v))
  } else {
    tibble(name = name)
  }
  if (! is.null(x[["meanx"]])) {
    res <- dplyr::bind_cols(res, meanx = x[["meanx"]])
  }
  res
}

#' @rdname methods-pma-spc
#' @export
recover_aug_coord.SPC <- function(x) {
  tibble(
    name = factor_coord(recover_coord(x)),
    sdev = sqrt(x$prop.var.explained)
  )
}
