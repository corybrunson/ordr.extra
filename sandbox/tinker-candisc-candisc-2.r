# candisc:::cancor.default()
function (mod, term, type = "2", manova, ndim = rank, ...) 
{
  if (!inherits(mod, "mlm")) 
    stop("Not an mlm object")
  if (missing(manova)) 
    manova <- Anova(mod, type = as.character(type))
  terms <- manova$terms
  if (missing(term)) 
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
  dc <- eigen(eHe, symmetric = TRUE)
  rank <- min(dfh, sum(dc$values > 0))
  pct <- 100 * dc$values/sum(dc$values)
  if (ndim > rank) {
    warning(paste("You asked for", ndim, "dimensions, but rank is", 
                  rank, ". ndim has been reset to", rank))
    ndim <- rank
  }
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
  rownames(means) <- do.call(paste, c(means[factor.names], 
                                      sep = ":"))
  means <- means[, -(1:length(factor.names))]
  structure <- cor(Y, scores)
  canrsq <- dc$values[1:ndim]/(1 + dc$values[1:ndim])
  scores <- cbind(model.frame(mod)[predictor.names(mod)], as.data.frame(scores))
  result <- list(
    dfh = dfh, dfe = dfe, eigenvalues = dc$values, 
    canrsq = canrsq, pct = pct, rank = rank, ndim = ndim, 
    means = means, factors = factors, term = term, terms = terms, 
    coeffs.raw = coeffs.raw, coeffs.std = coeffs.std, structure = structure, 
    scores = scores
  )
  class(result) <- "candisc"
  result
}


# candisc:::heplot.candisc()
function (
    mod, which = 1:2, scale, asp = 1, var.col = "blue", 
    var.lwd = par("lwd"), var.cex = par("cex"), var.pos,
    rev.axes = c(FALSE, FALSE), prefix = "Can", suffix = TRUE, terms = mod$term, 
    ...
) {
  if (!inherits(mod, "candisc")) 
    stop("Not a candisc object")
  if (mod$ndim < 2 || length(which) == 1) {
    message("Can't do a 1 dimensional canonical HE plot; using plot.candisc instead")
    plot(mod, which = which, var.col = var.col, var.lwd = var.lwd, 
         prefix = prefix, suffix = suffix, ...)
    return()
  }
  factors <- mod$factors
  nf <- ncol(factors)
  term <- mod$term
  lm.terms <- mod$terms
  scores <- mod$scores
  structure <- mod$structure
  structure <- mod$structure[, which]
  rev.axes <- rep(rev.axes, length.out = 2)
  if (isTRUE(rev.axes[1])) {
    scores[, nf + which[1]] <- -scores[, nf + which[1]]
    structure[, 1] <- -structure[, 1]
  }
  if (isTRUE(rev.axes[2])) {
    scores[, nf + which[2]] <- -scores[, nf + which[2]]
    structure[, 2] <- -structure[, 2]
  }
  txt <- paste(
    "lm( cbind(",
    paste("Can", 1:mod$rank, sep = "", collapse = ","),
    ") ~ ",
    paste(lm.terms, collapse = "+"), 
    ", data=scores)"
  )
  can.mod <- eval(parse(text = txt))
  canvar <- paste("Can", which, sep = "")
  if (is.logical(suffix) & suffix) 
    suffix <- paste(" (", round(mod$pct[which], 1), "%)", 
                    sep = "")
  else suffix <- NULL
  canlab <- paste(prefix, which, suffix, sep = "")
  if ((is.logical(terms) && terms)) {
    terms <- lm.terms
  }
  ellipses <- heplot(can.mod, terms = terms, factor.means = term, 
                     xlab = canlab[1], ylab = canlab[2], asp = asp, ...)
  abline(h = 0, v = 0, col = "gray")
  if (missing(scale)) {
    scale <- vecscale(structure)
    cat("Vector scale factor set to ", scale, "\n")
  }
  cs <- scale * structure
  vectors(cs, col = var.col, cex = var.cex, lwd = var.lwd, 
          pos = var.pos, xpd = TRUE)
  invisible(ellipses)
}
