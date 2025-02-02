#' @title Functionality for principal components analysis ('principal') objects
#'
#' @description These methods extract data from, and attribute new data to,
#'   objects of class `"principal"` as returned by [psych::principal()].
#'
#'@details
#' 
#' Principal components analysis (PCA), as performed by [psych::principal()],
#' relies on an eigenvalue decomposition (EVD) of the covariance matrix 
#' \eqn{X^TX} of a data set \eqn{X}. [psych::principal()] returns the right
#' singular vectors with full inertia \eqn{VD} from the EVD as the loadings 
#' `$loadings`. The scores `$scores` are obtained as \eqn{XV} and are accessible 
#' as supplementary elements.
#'
#' @name methods-principal
#' @author John Gracey
#' @template param-methods
#' @template return-methods
#' @family methods for eigen-decomposition-based techniques
#' @family models from the psych package
#' @example inst/examples/ex-methods-psych-principal-iris.R
NULL

#' @rdname methods-principal
#' @export
as_tbl_ord.principal <- as_tbl_ord_default

#' @rdname methods-principal
#' @export
recover_rows.principal <- function(x) {
  matrix(nrow = 0, ncol = ncol(x[["scores"]]),
         dimnames = list(NULL, colnames(x[["scores"]])))
}

#' @rdname methods-principal
#' @export
recover_cols.principal <- function(x) {
  unclass(x[["loadings"]])
}

#' @rdname methods-principal
#' @export
recover_inertia.principal <- function(x) {
  x[["values"]] * (nrow(x[["scores"]]) - 1)
}

#' @rdname methods-principal
#' @export
recover_coord.principal <- function(x) {
  colnames(x[["loadings"]])
}

#' @rdname methods-principal
#' @export
recover_conference.principal <- function(x) {
  c(0, 1)
}

#' @rdname methods-principal
#' @export
recover_supp_rows.principal <- function(x) {
  x[["scores"]]
}

#' @rdname methods-principal
#' @export
recover_aug_rows.principal <- function(x) {
  res <- tibble(.rows = 0L)
  
  # scores as supplementary points
  name <- rownames(x[["scores"]])
  res_sup <- if (is.null(name)) {
    tibble(.rows = nrow(x[["scores"]]))
  } else {
    tibble(name = name)
  }
  
  # supplement flag
  res$.element <- "active"
  res_sup$.element <- "score"
  as_tibble(dplyr::bind_rows(res, res_sup))
}

#' @rdname methods-principal
#' @export
recover_aug_cols.principal <- function(x) {
  name <- rownames(x[["loadings"]])
  res <- if (is.null(name)) {
    tibble(.rows = nrow(x[["loadings"]]))
  } else {
    tibble(name = name)
  }
  res$.element <- "active"
  res
}

#' @rdname methods-principal
#' @export
recover_aug_coord.principal <- function(x) {
  data.frame(
    name = recover_coord.principal(x),
    sdev = sqrt(x[["values"]][seq(1, ncol(x[["loadings"]]))])
  )
}
