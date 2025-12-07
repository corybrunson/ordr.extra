# load psych package
library(psych)
devtools::install_local("C:/Users/jbgra/Desktop/GDA/ordr", force = TRUE)
devtools::install_local("C:/Users/jbgra/Desktop/GDA/ordr.extra", force = TRUE)
library(ordr.extra)

# fa on iris
iris[1:4] |>
  ordinate(~fa(., nfactors = 2)) |>
  print() -> iris_fa

# produce biplot with scores plotted

ggbiplot(iris_fa, scale_cols = 3) +
  xlim(-1, 4) +
  ylim(-1, 4) +
  geom_cols_vector(color = "red") +
  geom_cols_text_radiate(label = names(iris[1:4]), elements = "active", 
                         color = "red") +
  geom_cols_vector(color = "blue", elements = "pinv_weight") +
  geom_cols_text_repel(label = names(iris[1:4]), elements = "pinv_weight", 
                       color = "blue") +
  geom_rows_point(elements = "score")
