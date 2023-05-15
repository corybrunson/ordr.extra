#' @title Functionality for canonical discriminant ('candisc') objects
#'
#' @description These methods extract data from, and attribute new data to,
#'   objects of class 'candisc' from the **[candisc][candisc::candisc-package]**
#'   package.
#' 

#' @name methods-candisc-candisc
#' @include ordr-extra.r
#' @template param-methods
#' @template return-methods
#' @family methods for eigen-decomposition-based techniques
#' @family models from the **candisc** package
#' @seealso [ordr::methods-cancor]
NULL

#' @rdname methods-candisc-candisc
#' @export
as_tbl_ord.candisc <- as_tbl_ord_default

#' @rdname methods-candisc-candisc
#' @export
recover_rows.candisc <- function(x) x$means

#' @rdname methods-candisc-candisc
#' @export
recover_cols.candisc <- function(x) {
  res <- x$coef$Y
  colnames(res) <- recover_coord(x)
  res
}

#' @rdname methods-candisc-candisc
#' @export
recover_inertia.candisc <- function(x) x$eigenvalues

#' @rdname methods-candisc-candisc
#' @export
recover_coord.candisc <- function(x) paste0("can", seq_along(x$cancor))

#' @rdname methods-candisc-candisc
#' @export
recover_conference.candisc <- function(x) {
  # `x$coef$*` are (inertia-free) canonical weights
  c(0, 0)
}

#' @rdname methods-candisc-candisc
#' @export
recover_supp_rows.candisc <- function(x) {
  rbind(x$scores$X, x$structure$X.xscores)
}

#' @rdname methods-candisc-candisc
#' @export
recover_supp_cols.candisc <- function(x) {
  rbind(x$scores$Y, x$structure$Y.yscores)
}

#' @rdname methods-candisc-candisc
#' @export
recover_aug_rows.candisc <- function(x) {
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

#' @rdname methods-candisc-candisc
#' @export
recover_aug_cols.candisc <- function(x) {
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

#' @rdname methods-candisc-candisc
#' @export
recover_aug_coord.candisc <- function(x) {
  tibble(
    name = factor_coord(recover_coord(x)),
    cancor = x$cancor
  )
}
