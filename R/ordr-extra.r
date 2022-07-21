#' @title **ordr.extra** package
#'
#' @description Additional accessors to represent ordination models as
#'   'tbl_ord's in **[ordr][ordr::ordr]**.
#'   

#' @details
#'
#' **ordr** includes many methods and steps for extended workflows for 'tbl_ord'
#' objects. Accessors are required to wrap ordination models as 'tbl_ord's and
#' make these methods available to them. To conserve size, **ordr** only
#' includes accessors for the most commonly distributed and used ordination
#' models. This package serves as a reservoir of accessors for additional, less
#' common models.

#' @docType package
#' @name ordr.extra
#' @aliases ordr.extra-package
#' @importFrom tibble tibble is_tibble as_tibble
#' @example inst/examples/ex-ordinate.r
NULL

# not exported from *ordr*
#' @importFrom utils getFromNamespace
as_tbl_ord_default <- getFromNamespace("as_tbl_ord_default", "ordr")
tibble_pole <- getFromNamespace("tibble_pole", "ordr")
factor_coord <- getFromNamespace("factor_coord", "ordr")
match_factor <- getFromNamespace("match_factor", "ordr")

#' @importFrom ordr as_tbl_ord
#' @export
ordr::as_tbl_ord

#' @importFrom ordr recover_rows
#' @export
ordr::recover_rows

#' @importFrom ordr recover_cols
#' @export
ordr::recover_cols

#' @importFrom ordr recover_inertia
#' @export
ordr::recover_inertia

#' @importFrom ordr recover_coord
#' @export
ordr::recover_coord

#' @importFrom ordr recover_conference
#' @export
ordr::recover_conference

#' @importFrom ordr augmentation_rows
#' @export
ordr::augmentation_rows

#' @importFrom ordr augmentation_cols
#' @export
ordr::augmentation_cols

#' @importFrom ordr augmentation_coord
#' @export
ordr::augmentation_coord

#' @importFrom ordr supplementation_rows
#' @export
ordr::supplementation_rows

#' @importFrom ordr supplementation_cols
#' @export
ordr::supplementation_cols
