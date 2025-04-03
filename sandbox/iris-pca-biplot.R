# load psych package
library(psych)

# pca on iris
iris[1:4] |>
  ordinate(~principal(., nfactors = 2)) |>
  print() -> iris_pca

# produce biplot with scores plotted
iris_pca |>
  ggbiplot() +
  geom_cols_vector() +
  geom_rows_point() # should produce layer of points for scores
