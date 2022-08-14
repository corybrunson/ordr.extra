#' @title Functionality for multiple and joint correspondence analysis ('mjca')
#'   objects
#'
#' @description These methods extract data from, and attribute new data to,
#'   objects of class `"mjca"` from the **[ca][ca::mjca]** package.
#'
#' @name methods-ca-mjca
#' @include ordr-extra.r
#' @template param-methods
#' @family methods for singular value decomposition-based techniques
#' @family models from the **ca** package
#' @example inst/examples/ex-methods-mjca-admissions.r
NULL

#' @rdname methods-ca-mjca
#' @export
as_tbl_ord.mjca <- as_tbl_ord_default

#' @rdname methods-ca-mjca
#' @export
recover_rows.mjca <- function(x) {
  res <- x$rowcoord
  rownames(res) <- x$rownames
  colnames(res) <- recover_coord(x)
  res
}

#' @rdname methods-ca-mjca
#' @export
recover_cols.mjca <- function(x) {
  res <- x$colcoord
  rownames(res) <- x$levelnames
  colnames(res) <- recover_coord(x)
  res
}

#' @rdname methods-ca-mjca
#' @export
recover_inertia.mjca <- function(x) x$sv[seq(ncol(x$rowcoord))] ^ 2

#' @rdname methods-ca-mjca
#' @export
recover_conference.mjca <- function(x) {
  # `ca::mjca()` methods draw from row and column standard coordinates
  c(0, 0)
}

#' @rdname methods-ca-mjca
#' @export
recover_coord.mjca <- function(x) paste0("Dim", seq(ncol(x$rowcoord)))

#' @rdname methods-ca-mjca
#' @export
recover_aug_rows.mjca <- function(x) {
  name <- x$rownames
  res <- if (is.null(name)) {
    tibble_pole(nrow(x$rowcoord))
  } else {
    tibble(name = name)
  }
  dplyr::bind_cols(
    res,
    mass = x$rowmass,
    dist = x$rowdist,
    inertia = x$rowinertia
  )
}

#' @rdname methods-ca-mjca
#' @export
recover_aug_cols.mjca <- function(x){
  name <- x$levelnames
  res <- if (is.null(name)) {
    tibble_pole(nrow(x$colcoord))
  } else {
    tibble(name = name)
  }
  dplyr::bind_cols(
    res,
    `colnames<-`(x$factors, colnames(x$factors)),
    mass = x$colmass,
    dist = x$coldist,
    inertia = x$colinertia
  )
}

#' @rdname methods-ca-mjca
#' @export
recover_aug_coord.mjca <- function(x){
  tibble(
    name = factor_coord(recover_coord(x)),
    sv = x$sv[seq(ncol(x$rowcoord))]
  )
}
