# load psych package
library(psych)

# fa on iris
iris[1:4] |>
  ordinate(~fa(., nfactors = 2)) |>
  print() -> iris_fa

# produce biplot with scores plotted

ggbiplot(iris_fa, scale_cols = 3) +
  geom_cols_vector(color = "red") +
  geom_rows_point(elements = "score")
