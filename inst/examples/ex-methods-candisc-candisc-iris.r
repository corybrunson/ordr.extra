if (require(candisc)) {# {candisc}

# data frame of Anderson iris species measurements
class(iris)
head(iris)

# multivariate linear model (MANOVA)
iris_mlm <-lm(
  cbind(Petal.Length, Sepal.Length, Petal.Width, Sepal.Width) ~ Species,
  data = iris
)
aov(iris_mlm)

# canonical discriminant analysis
( iris_cda <- augment_ord(as_tbl_ord(candisc::candisc(iris_mlm))) )
# biplot of canonical score markers, canonical mean markers, and canonical
# structure coefficient vectors
# `candisc:::plot.candisc()`
plot(
  iris_cda,
  conf = .99, ellipse = TRUE, ellipse.prob = 2/3,
  main = "Canonical discriminant analysis of Anderson's iris data"
)

# recover centroid coordinates and discriminant coefficients
get_rows(iris_cda, elements = "active")
head(get_rows(iris_cda, elements = "score"))
get_cols(iris_cda, elements = "active")
get_cols(iris_cda, elements = "structure")

# monoplot of canonical score markers and canonical mean markers
# (note that ellipses are inequivalent)
iris_monoplot <- ggbiplot(iris_cda, sec.axes = "cols") +
  theme_scaffold() +
  coord_scaffold() +
  stat_rows_ellipse(elements = "score", aes(color = name), level = 2/3) +
  geom_rows_point(aes(color = name, shape = name), size = 5, alpha = .75) +
  geom_rows_point(
    elements = "score",
    aes(color = name, shape = name), alpha = .5
  )
# biplot with raw canonical coefficient vectors
iris_monoplot + geom_cols_vector(aes(label = name))
# biplot with canonical structure coefficient vectors
iris_monoplot + geom_cols_vector(elements = "structure", aes(label = name))

}# {candisc}
