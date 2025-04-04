#' @title Functionality for correspondence analysis ('ca') objects
#'
#' @description These methods extract data from, and attribute new data to,
#'   objects of class `"ca"` from the **[ca][ca::ca]** package.
#'
#' @template section-ca
#' 
#' @template ref-greenacre2007
#' 
#' @name methods-ca-ca
#' @include ordr-extra.r
#' @template param-methods
#' @template return-methods
#' @family methods for singular value decomposition-based techniques
#' @family models from the **ca** package
#' @seealso [ordr::methods-correspondence]
#' @example inst/examples/ex-methods-ca-ca-haireye.r
NULL

#' @rdname methods-ca-ca
#' @export
as_tbl_ord.ca <- as_tbl_ord_default

#' @rdname methods-ca-ca
#' @export
recover_rows.ca <- function(x) x$rowcoord

#' @rdname methods-ca-ca
#' @export
recover_cols.ca <- function(x) x$colcoord

#' @rdname methods-ca-ca
#' @export
recover_inertia.ca <- function(x) x$sv ^ 2

#' @rdname methods-ca-ca
#' @export
recover_conference.ca <- function(x) {
  # `ca::ca()` always returns row and column standard coordinates
  c(0, 0)
}

#' @rdname methods-ca-ca
#' @export
recover_coord.ca <- function(x) {
  colnames(x$rowcoord)
}

#' @rdname methods-ca-ca
#' @export
recover_aug_rows.ca <- function(x) {
  name <- rownames(x$rowcoord)
  res <- if (is.null(name)) {
    tibble(.rows = nrow(x$rowcoord))
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

#' @rdname methods-ca-ca
#' @export
recover_aug_cols.ca <- function(x) {
  name <- rownames(x$colcoord)
  res <- if (is.null(name)) {
    tibble(.rows = nrow(x$colcoord))
  } else {
    tibble(name = name)
  }
  dplyr::bind_cols(
    res,
    mass = x$colmass,
    dist = x$coldist,
    inertia = x$colinertia
  )
}

#' @rdname methods-ca-ca
#' @export
recover_aug_coord.ca <- function(x){
  tibble(
    name = factor_coord(recover_coord(x)),
    sv = x$sv
  )
}
