#' @title Functionality for canonical correlation ('cancor') and discriminant
#'   ('candisc') objects
#'
#' @description These methods extract data from, and attribute new data to,
#'   objects of class 'cancor' and 'candisc' from the
#'   **[candisc][candisc::candisc-package]** package.
#'
#' @details
#'
#' ter Braak (1990) recommends two families of biplots for the canonical
#' correspondence analysis of data matrices \eqn{X} and \eqn{Y}. For the first,
#' using structural correlations, either the interset correlations of \eqn{X}
#' (equivalent to principal coordinates) are plotted with the intraset
#' correlations of \eqn{Y} (standard coordinates) or vice-versa, so that their
#' product recovers the inner product matrix \eqn{XY'}. ter Braak's biplots can
#' then be recovered by balancing the inertia across the two factors.
#'
#' For the second, if the variables are distinguished as predictors and
#' criteria, then the superposition of the interset correlations of the criteria
#' with the (inertia-free) canonical coefficients of the predictors yields a
#' biplot that approximates the matrix of coefficients in the multivariate
#' regression model.
#'
#' The methods for [candisc::cancor()] mirror those for [ordr::cancor_ord()] in
#' **ordr**, though the canonical coefficients (hence the canonical scores) are
#' inversely scaled by \eqn{n - 1}.
#' 

#' @template ref-braak1990
#'   

#' @name methods-candisc-cancor
#' @include ordr-extra.r
#' @template param-methods
#' @template return-methods
#' @family methods for singular value decomposition-based techniques
#' @family models from the **candisc** package
#' @seealso [ordr::methods-cancor]
#' @example inst/examples/ex-methods-candisc-savings.r
NULL

#' @rdname methods-candisc-cancor
#' @export
as_tbl_ord.cancor <- as_tbl_ord_default

#' @rdname methods-candisc-cancor
#' @export
recover_rows.cancor <- function(x) {
  res <- x$coef$X
  colnames(res) <- recover_coord(x)
  res
}

#' @rdname methods-candisc-cancor
#' @export
recover_cols.cancor <- function(x) {
  res <- x$coef$Y
  colnames(res) <- recover_coord(x)
  res
}

#' @rdname methods-candisc-cancor
#' @export
recover_inertia.cancor <- function(x) x$cancor^2

#' @rdname methods-candisc-cancor
#' @export
recover_coord.cancor <- function(x) paste0("can", seq_along(x$cancor))

#' @rdname methods-candisc-cancor
#' @export
recover_conference.cancor <- function(x) {
  # `x$coef$*` are (inertia-free) canonical weights
  c(0, 0)
}

#' @rdname methods-candisc-cancor
#' @export
recover_supp_rows.cancor <- function(x) {
  rbind(x$scores$X, x$structure$X.xscores)
}

#' @rdname methods-candisc-cancor
#' @export
recover_supp_cols.cancor <- function(x) {
  rbind(x$scores$Y, x$structure$Y.yscores)
}

#' @rdname methods-candisc-cancor
#' @export
recover_aug_rows.cancor <- function(x) {
  name <- x$names$X
  res <- if (is.null(name)) {
    tibble_pole(nrow(x$coef$X))
  } else {
    tibble(name = name)
  }
  res$.element <- "active"
  
  # case scores and structure correlations as supplementary points
  res_sup <- NULL
  if (! is.null(x$scores$X)) {
    res_sup_elt <- if (is.null(rownames(x$scores$X))) {
      tibble_pole(nrow(x$scores$X))
    } else {
      tibble(name = rownames(x$scores$X))
    }
    res_sup_elt$.element <- "score"
    res_sup <- dplyr::bind_rows(res_sup, res_sup_elt)
  }
  if (! is.null(x$structure$X.xscores)) {
    res_sup_elt <- if (is.null(rownames(x$structure$X.xscores))) {
      tibble_pole(nrow(x$structure$X.xscores))
    } else {
      tibble(name = rownames(x$structure$X.xscores))
    }
    res_sup_elt$.element <- "structure"
    res_sup <- dplyr::bind_rows(res_sup, res_sup_elt)
  }
  
  as_tibble(dplyr::bind_rows(res, res_sup))
}

#' @rdname methods-candisc-cancor
#' @export
recover_aug_cols.cancor <- function(x) {
  name <- x$names$Y
  res <- if (is.null(name)) {
    tibble_pole(nrow(x$coef$Y))
  } else {
    tibble(name = name)
  }
  res$.element <- "active"
  
  # case scores and structure correlations as supplementary points
  res_sup <- NULL
  if (! is.null(x$scores$Y)) {
    res_sup_elt <- if (is.null(rownames(x$scores$Y))) {
      tibble_pole(nrow(x$scores$Y))
    } else {
      tibble(name = rownames(x$scores$Y))
    }
    res_sup_elt$.element <- "score"
    res_sup <- dplyr::bind_rows(res_sup, res_sup_elt)
  }
  if (! is.null(x$structure$Y.yscores)) {
    res_sup_elt <- if (is.null(rownames(x$structure$Y.yscores))) {
      tibble_pole(nrow(x$structure$Y.yscores))
    } else {
      tibble(name = rownames(x$structure$Y.yscores))
    }
    res_sup_elt$.element <- "structure"
    res_sup <- dplyr::bind_rows(res_sup, res_sup_elt)
  }
  
  as_tibble(dplyr::bind_rows(res, res_sup))
}

#' @rdname methods-candisc-cancor
#' @export
recover_aug_coord.cancor <- function(x) {
  tibble(
    name = factor_coord(recover_coord(x)),
    cancor = x$cancor
  )
}
