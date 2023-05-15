class(iris)
head(iris)
iris %>%
  lm(formula = cbind(Petal.Length, Sepal.Length, Petal.Width, Sepal.Width) ~
       Species) %>%
  candisc::candisc() %>%
  print() -> iris_candisc
# iris_candisc_ord <- as_tbl_ord(iris_candisc)
