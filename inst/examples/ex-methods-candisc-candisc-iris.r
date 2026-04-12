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
( iris_cda <- as_tbl_ord(candisc::candisc(iris_mlm)) )

# recover centroid coordinates and discriminant coefficients
get_rows(iris_cda, elements = "active")
get_rows(iris_cda, elements = "score")
get_cols(iris_cda, elements = "active")
get_cols(iris_cda, elements = "structure")

# augment ordination
augment_ord(iris_cda)

}# {candisc}
