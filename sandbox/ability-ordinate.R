devtools::load_all()
# check version of {ordr}
print(packageVersion("ordr"))

# load psych
library(psych)

# pca on ability covariance matrix
ability_pca <- ability.cov$cov |>
  ordinate(~ principal(., scores = FALSE)) # produces error

# isolate above warning

# start with 'principal' object with 1 factor
# note: `scores = FALSE` should be unnecessary for a covariance matrix input
ability_pca <- psych::principal(ability.cov$cov, nfactors = 2)
is.null(ability_pca$scores)
# can i create a 'tbl_ord' object without the warning?
ability_pca_ord <- as_tbl_ord(ability_pca)
# can i print the 'tbl_ord' object without the warning? (combines elements accessed separately)
print(ability_pca_ord)
# can i augment the 'tbl_ord' object without the warning? (incorporates additional model info)
augment_ord(ability_pca_ord)
# can i recover supplemental rows without the warning?
recover_supp_rows(ability_pca)
# does the number of columns agree with that of the active rows?
recover_rows(ability_pca)

# walk through problematic function (involving `res_sup$.element`)

x <- ability_pca

# begin copy from `methods-psych-principal.R`
res <- tibble(.rows = 0L)

# scores as supplementary points
if (!is.null(x[["scores"]])) {
  name <- rownames(x[["scores"]])
  res_sup <- if (is.null(name)) {
    tibble(.rows = nrow(x[["scores"]]))
  } else {
    tibble(name = name)
  }
} else res_sup <- matrix(nrow = 0, ncol = ncol(x[["loadings"]]))
# end copy from `methods-psych-principal.R`

# what are `res` and `res_sup`?
res
res_sup

# begin copy from `methods-psych-principal.R`
# supplement flag
res$.element <- "active"
res_sup$.element <- "score"
# end copy from `methods-psych-principal.R`

print(res_sup)

# Probable problem: `res_sup` is a matrix, not a data frame, so it doesn't have
# list-elements as are accessed using `$`, so it is being coerced to a list in
# order to assign such an element the value of `"score"`.

# test solution
res_sup <- head(as_tibble(unclass(x[["loadings"]])), n = 0L)
res_sup$.element <- "score"
print(res_sup)

# implement test solution from above to augmented row recoverer
recover_aug_rows.principal <- function(x) {
  res <- tibble(.rows = 0L)
  
  # scores as supplementary points
  if (!is.null(x[["scores"]])) {
    name <- rownames(x[["scores"]])
    res_sup <- if (is.null(name)) {
      tibble(.rows = nrow(x[["scores"]]))
    } else {
      tibble(name = name)
    }
  } else res_sup <- tibble(.rows = 0L)
  
  # supplement flag
  res$.element <- "active"
  res_sup$.element <- "score"
  as_tibble(dplyr::bind_rows(res, res_sup))
}

# apply recoverer to ability pca
recover_aug_rows.principal(x)

# check that augmented rows have data.frame class
class(recover_aug_rows.principal(x))

ggbiplot(as_tbl_ord(x)) # produces error because x is not a data frame
