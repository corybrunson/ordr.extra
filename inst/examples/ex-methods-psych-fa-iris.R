# data frame of Anderson iris species measurements
class(iris)
head(iris)

# fa on iris
iris |>
  ordinate(~psych::fa(., nfactors = 2L, rotate = "varimax", scores = 
                        "regression", fm = "ml"),
           cols = 1:4, augment = c(Sepal.Width, Species)) |>
  print() -> iris_fa

# recover loadings
get_cols(iris_fa, elements = "active")
# recover pseudoinverse of weights
get_cols(iris_fa, elements = "pinv_weight")
# recover scores
head(get_rows(iris_fa, elements = "score"))

# augment column loadings with uniquenesses
(iris_fa <- augment_ord(iris_fa))

# biplot
ggbiplot(iris_fa, scale_cols = 3) +
  xlim(-1, 4) +
  ylim(-1, 4) +
  geom_rows_point(color = Species) +
  geom_cols_vector(color = "red") +
  geom_cols_text_radiate(label = names(iris[1:4]), elements = "active", 
                         color = "red") +
  geom_cols_vector(color = "blue", elements = "pinv_weight") +
  geom_cols_text_repel(label = names(iris[1:4]), elements = "pinv_weight", 
                       color = "blue") +
  geom_rows_point(elements = "score")
