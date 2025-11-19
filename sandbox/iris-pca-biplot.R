# load psych package
library(psych)

# pca on iris
iris[1:4] |>
  ordinate(~principal(., nfactors = 2)) |>
  print() -> iris_pca

# produce biplot with scores plotted

ggbiplot(iris_pca, scale_cols = 3) +
  geom_cols_vector(color = "red") +
  geom_rows_point(elements = "score")
