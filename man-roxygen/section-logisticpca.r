#' @section {Logistic SVD-based models}:
#' 

#' Landgraf and Lee (2020) provide in their package **logisticPCA** a new
#' implementation and extension of the logistic PCA introduced by Collins et al
#' (2001). These methods use techniques from generalized linear regression to
#' generalize classical principal components analysis (PCA) to the problem of
#' dimension reduction for binary data. The signature functions
#' [logisticPCA::logisticPCA()], [logisticPCA::logisticSVD()], and
#' [logisticPCA::convexLogisticPCA()] have `*_ord()` wrappers that add row and
#' column names from the input matrix to the output matrices.
#' 
