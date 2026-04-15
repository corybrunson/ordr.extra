#' @title Functionality for canonical discriminant ('candisc') objects
#'
#' @description These methods extract data from, and attribute new data to,
#'   objects of class 'candisc' from the **[candisc][candisc::candisc-package]**
#'   package.
#'
#' @details
#'
#' As implemented in **[candisc][candisc::candisc-package]**, canonical
#' discriminant analysis arrives at linear discriminant analysis by way of
#' multivariate linear regression; see documentation in that package for more
#' detail.
#'
#' The methods for [candisc::candisc()] agree with those for [MASS::lda()] and
#' extend them to include canonical structure coefficients as supplementary
#' column points. These are the correlations between the observed and canonical
#' variables and therefore, like the canonical coefficients recovered as active
#' column elements, carry no inertia in the model object.
#'
#' The `plot()` method for `candisc` generates a biplot of markers for the
#' centroid and case scores and vectors for the structure coefficients. This can
#' be reproduced with [ordr::ggbiplot()] by specifying the supplementary
#' elements (see the examples). This plot is distinct from those possible using
#' [ordr::lda_ord()]: The vectors represent the locations of the observed
#' variables in canonical space.
#' 

#' @name methods-candisc-candisc
#' @include ordr-extra.r
#' @template param-methods
#' @template return-methods
#' @family methods for eigen-decomposition-based techniques
#' @family models from the **candisc** package
#' @seealso [`ordr::methods-cancor`]
#' @example inst/examples/ex-methods-candisc-candisc-iris.r
NULL

#' @rdname methods-candisc-candisc
#' @export
as_tbl_ord.candisc <- as_tbl_ord_default

#' @rdname methods-candisc-candisc
#' @export
recover_rows.candisc <- function(x) as.matrix(x$means)

#' @rdname methods-candisc-candisc
#' @export
recover_cols.candisc <- function(x) x$coeffs.raw

#' @rdname methods-candisc-candisc
#' @export
recover_inertia.candisc <- function(x) {
  # un-scale by relative degrees of freedom
  x$eigenvalues[seq(x$rank)] / x$dfe * x$dfh
}

#' @rdname methods-candisc-candisc
#' @export
recover_coord.candisc <- function(x) colnames(x$means)

#' @rdname methods-candisc-candisc
#' @export
recover_conference.candisc <- function(x) {
  # rows and cols agree with `MASS::lda()`
  c(1, 0)
}

#' @rdname methods-candisc-candisc
#' @export
recover_supp_rows.candisc <- function(x) {
  as.matrix(x$scores[, c(2L, 3L)])
}

#' @rdname methods-candisc-candisc
#' @export
recover_supp_cols.candisc <- function(x) {
  rbind(
    # TODO: Show in examples how to obtain `x$coeffs.std` from `recover_cols()`.
    x$structure
  )
}

#' @rdname methods-candisc-candisc
#' @export
recover_aug_rows.candisc <- function(x) {
  # group names are expected to always be present
  res <- tibble(name = rownames(x$means))
  res$.element <- "active"
  
  # case scores as supplementary points
  res_sup <- tibble(
    name = as.character(x$factors[[x$term]]),
    .element = "score"
  )
  
  as_tibble(dplyr::bind_rows(res, res_sup))
}

#' @rdname methods-candisc-candisc
#' @export
recover_aug_cols.candisc <- function(x) {
  res <- if (is.null(rownames(x$coeffs.raw))) {
    tibble(.rows = nrow(x$coeffs.raw))
  } else {
    tibble(name = rownames(x$coeffs.raw))
  }
  res$.element <- "active"
  
  # canonical structure coefficients as supplementary points
  res_sup <- if (is.null(rownames(x$structure))) {
    tibble(.rows = nrow(x$structure))
  } else {
    tibble(name = rownames(x$structure))
  }
  res_sup$.element <- "structure"
  
  as_tibble(dplyr::bind_rows(res, res_sup))
}

#' @rdname methods-candisc-candisc
#' @export
recover_aug_coord.candisc <- function(x) {
  tibble(
    name = factor_coord(recover_coord(x)),
    hyp_err_ev = x$eigenvalues,
    can_rsq = x$canrsq
  )
}
