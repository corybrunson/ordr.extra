library(MASS)
library(candisc)
devtools::load_all()

# LDA
diab_lda <- lda(
  subset(Diabetes, select = c(glufast, glutest, instest, sspg)),
  g = Diabetes$group
)

diab_mlm <- lm(cbind(glufast, glutest, instest, sspg) ~ group, data = Diabetes)
diab_can <- candisc(diab_mlm)

diab_lda
diab_can

# singular / eigen values - `recover_inertia()`
diab_lda$svd^2
diab_can$canrsq
diab_can$eigenvalues
diab_lda$svd^2 / diab_can$canrsq
diab_lda$svd^2 / diab_can$eigenvalues[seq(diab_can$rank)]
# agreement
diab_lda$svd^2 /
  ( diab_can$eigenvalues[seq(diab_can$rank)] / (diab_can$dfh / diab_can$dfe) )

# R-squared - `recover_aug_coord()`
diab_can$canrsq
diab_can$pct
diab_can$canrsq / sum(diab_can$canrsq)
( diab_can$canrsq / sum(diab_can$canrsq) ) / diab_can$pct[seq(diab_can$rank)]

# group means - `recover_rows()`
diab_lda$means
scale(
  diab_lda$means,
  center = colSums(diab_lda$prior * diab_lda$means),
  scale = FALSE
) %*% diab_lda$scaling
diab_can$means
# agreement
scale(
  diab_lda$means,
  center = colSums(diab_lda$prior * diab_lda$means),
  scale = FALSE
) %*% diab_lda$scaling /
  diab_can$means

# coefficients - `recover_cols()`
coef(diab_lda)
diab_lda$scaling
diab_can$coeffs.raw
# agreement
diab_lda$scaling / diab_can$coeffs.raw

# structure coefficients - `recover_supp_cols()`
diab_can$structure

# scores - `recover_supp_rows()`
scale(
  subset(Diabetes, select = c(glufast, glutest, instest, sspg)),
  center = colSums(diab_lda$prior * diab_lda$means),
  scale = FALSE
) %*% diab_lda$scaling |> 
  head()
diab_can$scores |> head()
# agreement
( 
  scale(
    subset(Diabetes, select = c(glufast, glutest, instest, sspg)),
    center = colSums(diab_lda$prior * diab_lda$means),
    scale = FALSE
  ) %*% diab_lda$scaling /
    as.matrix(diab_can$scores[, 2:3])
) |> 
  head()
