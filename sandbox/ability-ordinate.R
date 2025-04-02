# load psych
library(psych)

# pca on ability covariance matrix
ability_pca <- ability.cov$cov |>
  ordinate(~ principal(., scores = FALSE)) # produces error
