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

# biplot with both loadings and pseudoinverse weights
ggbiplot(iris_fa, scale_cols = 3) +
  geom_rows_point(elements = "score", aes(color = Species)) +
  geom_cols_vector(linetype = "solid") +
  geom_cols_text_radiate(label = names(iris[1:4]), elements = "active", 
                         linetype = "solid") +
  geom_cols_vector(linetype = "dotted", elements = "pinv_weight") +
  geom_cols_text_repel(label = names(iris[1:4]), elements = "pinv_weight", 
                       linetype = "dotted", size = 3.5) +
  # include vector labels in plot window (specific to graphics device)
  scale_x_continuous(limits = ~ range(.x, c(-2, 5))) +
  scale_y_continuous(limits = ~ range(.x, c(-4, 3)))
