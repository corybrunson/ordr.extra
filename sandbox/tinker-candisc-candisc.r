grass.mod <-
  lm(cbind(N1,N9,N27,N81,N243) ~ Block + Species, data=candisc::Grass)
car::Anova(grass.mod, test="Wilks")

grass.can1 <-candisc::candisc(grass.mod, term="Species")
plot(grass.can1)

# library(heplots)
heplots::heplot(grass.can1, scale=6, fill=TRUE)

# iris data
iris.mod <-
  lm(cbind(Petal.Length, Sepal.Length, Petal.Width, Sepal.Width) ~ Species,
     data=iris)
iris.can <- candisc::candisc(iris.mod, data=iris)
plot(iris.can)

heplots::heplot(iris.can)

# 1-dim plot
iris.can1 <- candisc::candisc(iris.mod, data=iris, ndim=1)
plot(iris.can1)

mod <- iris.mod
data <- iris
ndim <- 1L
type <- "2"

# `candisc::candisc.mlm()`
manova <- car::Anova(mod, type = as.character(type))
terms <- manova$terms
term <- terms[1]
E <- manova$SSPE
H <- manova$SSP[[term]]
dfe <- manova$error.df
dfh <- manova$df[[term]]
Sp <- E/dfe
tdecomp <- function(m) {
  wm <- eigen(m, symmetric = TRUE)
  p <- ncol(m)
  wmd <- wm$values
  out <- t(wm$vectors %*% diag(sqrt(wmd)))
  out
}
Tm <- tdecomp(E)
eInv <- solve(Tm)
eHe <- t(eInv) %*% H %*% eInv
# core decomposition
dc <- eigen(eHe, symmetric = TRUE)
rank <- min(dfh, sum(dc$values > 0))
pct <- 100 * dc$values/sum(dc$values)
coeffs.raw <- eInv %*% dc$vectors * sqrt(dfe)
coeffs.raw <- as.matrix(coeffs.raw[, 1:ndim])
rownames(coeffs.raw) <- rownames(H)
colnames(coeffs.raw) <- cn <- paste("Can", 1:ndim, sep = "")
coeffs.std <- diag(sqrt(diag(Sp))) %*% coeffs.raw
rownames(coeffs.std) <- rownames(H)
colnames(coeffs.std) <- cn
data <- model.frame(mod)
Y <- model.response(data)
Y <- scale(Y, center = TRUE, scale = FALSE)
scores <- Y %*% coeffs.raw
scores <- as.matrix(scores[, 1:ndim])
colnames(scores) <- cn
all.factors <- data[, sapply(data, is.factor), drop = FALSE]
factor.names <- unlist(strsplit(term, ":"))
factors <- data[factor.names]
means <- aggregate(scores, factors, mean)
rownames(means) <- do.call(paste, c(means[factor.names], sep = ":"))
means <- means[, -(1:length(factor.names))]
structure <- cor(Y, scores)
canrsq <- dc$values[1:ndim]/(1 + dc$values[1:ndim])
scores <- cbind(model.frame(mod)[candisc:::predictor.names.default(mod)],
                as.data.frame(scores))
result <- list(
  dfh = dfh, dfe = dfe,
  # inertia
  eigenvalues = dc$values, canrsq = canrsq,
  pct = pct,
  # number of dimensions
  rank = rank, ndim = ndim,
  # group means
  means = means,
  # group assignments
  factors = factors, term = term, terms = terms,
  # eigen (left & right singular) vectors, orthonormalized
  coeffs.raw = coeffs.raw, coeffs.std = coeffs.std,
  # structure correlations
  structure = structure,
  # supplementary elements
  scores = scores
)
class(result) <- "candisc"
