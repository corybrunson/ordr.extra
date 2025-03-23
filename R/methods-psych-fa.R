#' @title Functionality for factor analysis ('fa') objects
#'
#' @description These methods extract data from, and attribute new data to,
#'   objects of class `"fa"` as returned by [psych::fa()].
#'
#' @details
#'
#' Factor analysis of a data matrix relies on an an eigendecomposition of its
#' correlation matrix, whose eigenvectors (up to weighting) comprise the
#' variable loadings. For this reason, both column and supplementary row 
#' recoverers retrieve the loadings and inertia is evenly distributed between 
#' them. When computed and returned by [psych::fa()], the case scores are 
#' accessible as supplementary elements. Redistribution of inertia commutes 
#' through both score calculations.
#' 

#' @name methods-fa
#' @author John Gracey
#' @template param-methods
#' @template return-methods
#' @family methods for eigen-decomposition-based techniques
#' @family models from the psych package
#' @example inst/examples/ex-methods-psych-fa-swiss.R
NULL

#' @rdname methods-fa
#' @export
as_tbl_ord.fa <- as_tbl_ord_default

#' @rdname methods-fa
#' @export
recover_rows.fa <- function(x) {
  matrix(nrow = 0, ncol = ncol(x[["scores"]]),
         dimnames = list(NULL, colnames(x[["scores"]])))
}

#' @rdname methods-fa
#' @export
recover_cols.fa <- function(x) recover_dims_fa(x, "cols")

#' @rdname methods-fa
#' @export
recover_inertia.fa <- function(x) {
  colSums(x[["loadings"]] ^ 2)
}

#' @rdname methods-fa
#' @export
recover_coord.fa <- function(x) {
  colnames(x[["loadings"]])
}

#' @rdname methods-fa
#' @export
recover_conference.fa <- function(x) {
  # loadings are assigned half the diagonal from the eigendecomposition
  c(1, 1)
}

#' @rdname methods-fa
#' @export
recover_supp_rows.fa <- function(x) {
  x[["scores"]]
}

#' @rdname methods-fa
#' @export
recover_supp_cols.fa <- function(x) {
  solve(t(x[["weights"]]) %*% x[["weights"]]) %*% t(x[["weights"]]) |>
    t()
}

#' @rdname methods-fa
#' @export
recover_aug_rows.fa <- function(x) {
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

#' @rdname methods-fa
#' @export
recover_aug_cols.fa <- function(x) {
  name <- rownames(x[["loadings"]])
  res <- if (is.null(name)) {
    tibble(.rows = nrow(x[["loadings"]]))
  } else {
    tibble(name = name)
  }
  res$uniqueness <- x$uniquenesses
  res$communality <- x$communality
  res$complexity <- x$complexity
  
  # supplement flag
  res$.element <- "active"
  res <- res[c(".element", setdiff(names(res), ".element"))]  # reorder columns
  
  # transposed pseudoinverse of weights as supplementary points
  name <- rownames(x[["weights"]])
  res_sup <- if (is.null(name)) {
    tibble(.rows = nrow(x[["weights"]]))
  } else {
    tibble(name = name)
  }
  
  # supplement flag
  res_sup$.element <- "inv_weight"
  res_sup <- res_sup[c(".element", setdiff(names(res_sup), ".element"))]  # reorder columns
  as_tibble(dplyr::bind_rows(res, res_sup))
}

#' @rdname methods-fa
#' @export
recover_aug_coord.fa <- function(x) {
  tibble(
    name = factor_coord(recover_coord(x))
  )
}

