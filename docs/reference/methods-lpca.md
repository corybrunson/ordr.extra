# Functionality for logistic PCA and logistic SVD objects

These methods extract data from, and attribute new data to, objects of
class `"lpca"` and `"lsvd"` from the
**[logisticPCA](https://rdrr.io/pkg/logisticPCA/man/logisticPCA-package.html)**
package.

These methods extract data from, and attribute new data to, objects of
class `"lpca"` and `"lsvd"` from the
**[logisticPCA](https://rdrr.io/pkg/logisticPCA/man/logisticPCA-package.html)**
package.

These methods extract data from, and attribute new data to, objects of
class `"lpca"` and `"lsvd"` from the
**[logisticPCA](https://rdrr.io/pkg/logisticPCA/man/logisticPCA-package.html)**
package.

## Usage

``` r
# S3 method for class 'lsvd'
as_tbl_ord(x)

# S3 method for class 'lsvd'
recover_rows(x)

# S3 method for class 'lsvd'
recover_cols(x)

# S3 method for class 'lsvd'
recover_coord(x)

# S3 method for class 'lsvd'
recover_aug_rows(x)

# S3 method for class 'lsvd'
recover_aug_cols(x)

# S3 method for class 'lsvd'
recover_aug_coord(x)

# S3 method for class 'lpca'
as_tbl_ord(x)

# S3 method for class 'lpca'
recover_rows(x)

# S3 method for class 'lpca'
recover_cols(x)

# S3 method for class 'lpca'
recover_coord(x)

# S3 method for class 'lpca'
recover_aug_rows(x)

# S3 method for class 'lpca'
recover_aug_cols(x)

# S3 method for class 'lpca'
recover_aug_coord(x)

# S3 method for class 'clpca'
as_tbl_ord(x)

# S3 method for class 'clpca'
recover_rows(x)

# S3 method for class 'clpca'
recover_cols(x)

# S3 method for class 'clpca'
recover_coord(x)

# S3 method for class 'clpca'
recover_aug_rows(x)

# S3 method for class 'clpca'
recover_aug_cols(x)

# S3 method for class 'clpca'
recover_aug_coord(x)
```

## Arguments

- x:

  An ordination object.

## Value

The recovery generics `recover_*()` return [core model
components](https://corybrunson.github.io/ordr/reference/recoverers.html),
[distribution of
inertia](https://corybrunson.github.io/ordr/reference/conference.html),
[supplementary
elements](https://corybrunson.github.io/ordr/reference/supplementation.html),
and [intrinsic
metadata](https://corybrunson.github.io/ordr/reference/augmentation.html);
but they require methods for each model class to tell them what these
components are.

The generic
[`as_tbl_ord()`](https://corybrunson.github.io/ordr/reference/tbl_ord.html)
returns its input wrapped in the 'tbl_ord' class. Its methods determine
what model classes it is allowed to wrap. It then provides 'tbl_ord'
methods with access to the recoverers and hence to the model components.

The recovery generics `recover_*()` return [core model
components](https://corybrunson.github.io/ordr/reference/recoverers.html),
[distribution of
inertia](https://corybrunson.github.io/ordr/reference/conference.html),
[supplementary
elements](https://corybrunson.github.io/ordr/reference/supplementation.html),
and [intrinsic
metadata](https://corybrunson.github.io/ordr/reference/augmentation.html);
but they require methods for each model class to tell them what these
components are.

The generic
[`as_tbl_ord()`](https://corybrunson.github.io/ordr/reference/tbl_ord.html)
returns its input wrapped in the 'tbl_ord' class. Its methods determine
what model classes it is allowed to wrap. It then provides 'tbl_ord'
methods with access to the recoverers and hence to the model components.

The recovery generics `recover_*()` return [core model
components](https://corybrunson.github.io/ordr/reference/recoverers.html),
[distribution of
inertia](https://corybrunson.github.io/ordr/reference/conference.html),
[supplementary
elements](https://corybrunson.github.io/ordr/reference/supplementation.html),
and [intrinsic
metadata](https://corybrunson.github.io/ordr/reference/augmentation.html);
but they require methods for each model class to tell them what these
components are.

The generic
[`as_tbl_ord()`](https://corybrunson.github.io/ordr/reference/tbl_ord.html)
returns its input wrapped in the 'tbl_ord' class. Its methods determine
what model classes it is allowed to wrap. It then provides 'tbl_ord'
methods with access to the recoverers and hence to the model components.

## Logistic SVD-based models

Landgraf and Lee (2020) provide in their package **logisticPCA** a new
implementation and extension of the logistic PCA introduced by Collins
et al (2001). These methods use techniques from generalized linear
regression to generalize classical principal components analysis (PCA)
to the problem of dimension reduction for binary data. The signature
functions
[`logisticPCA::logisticPCA()`](https://rdrr.io/pkg/logisticPCA/man/logisticPCA.html),
[`logisticPCA::logisticSVD()`](https://rdrr.io/pkg/logisticPCA/man/logisticSVD.html),
and
[`logisticPCA::convexLogisticPCA()`](https://rdrr.io/pkg/logisticPCA/man/convexLogisticPCA.html)
have `*_ord()` wrappers that add row and column names from the input
matrix to the output matrices.

Landgraf and Lee (2020) provide in their package **logisticPCA** a new
implementation and extension of the logistic PCA introduced by Collins
et al (2001). These methods use techniques from generalized linear
regression to generalize classical principal components analysis (PCA)
to the problem of dimension reduction for binary data. The signature
functions
[`logisticPCA::logisticPCA()`](https://rdrr.io/pkg/logisticPCA/man/logisticPCA.html),
[`logisticPCA::logisticSVD()`](https://rdrr.io/pkg/logisticPCA/man/logisticSVD.html),
and
[`logisticPCA::convexLogisticPCA()`](https://rdrr.io/pkg/logisticPCA/man/convexLogisticPCA.html)
have `*_ord()` wrappers that add row and column names from the input
matrix to the output matrices.

Landgraf and Lee (2020) provide in their package **logisticPCA** a new
implementation and extension of the logistic PCA introduced by Collins
et al (2001). These methods use techniques from generalized linear
regression to generalize classical principal components analysis (PCA)
to the problem of dimension reduction for binary data. The signature
functions
[`logisticPCA::logisticPCA()`](https://rdrr.io/pkg/logisticPCA/man/logisticPCA.html),
[`logisticPCA::logisticSVD()`](https://rdrr.io/pkg/logisticPCA/man/logisticSVD.html),
and
[`logisticPCA::convexLogisticPCA()`](https://rdrr.io/pkg/logisticPCA/man/convexLogisticPCA.html)
have `*_ord()` wrappers that add row and column names from the input
matrix to the output matrices.

## References

Landgraf AJ & Lee Y (2020) "Dimensionality reduction for binary data
through the projection of natural parameters". *Journal of Multivariate
Analysis* **180**: 104668.
[doi:10.1016/j.jmva.2020.104668](https://doi.org/10.1016/j.jmva.2020.104668)

Collins M, Dasgupta S, & Schapire RE (2001) "A Generalization of
Principal Components Analysis to the Exponential Family". *Advances in
Neural Information Processing Systems 14 (NIPS 2001)*, Ed. Dietterich T,
Becker S, and Ghahramani Z, 617–624. A Bradford Book, ISBN
9780262042086.

Landgraf AJ & Lee Y (2020) "Dimensionality reduction for binary data
through the projection of natural parameters". *Journal of Multivariate
Analysis* **180**: 104668.
[doi:10.1016/j.jmva.2020.104668](https://doi.org/10.1016/j.jmva.2020.104668)

Collins M, Dasgupta S, & Schapire RE (2001) "A Generalization of
Principal Components Analysis to the Exponential Family". *Advances in
Neural Information Processing Systems 14 (NIPS 2001)*, Ed. Dietterich T,
Becker S, and Ghahramani Z, 617–624. A Bradford Book, ISBN
9780262042086.

Landgraf AJ & Lee Y (2020) "Dimensionality reduction for binary data
through the projection of natural parameters". *Journal of Multivariate
Analysis* **180**: 104668.
[doi:10.1016/j.jmva.2020.104668](https://doi.org/10.1016/j.jmva.2020.104668)

Collins M, Dasgupta S, & Schapire RE (2001) "A Generalization of
Principal Components Analysis to the Exponential Family". *Advances in
Neural Information Processing Systems 14 (NIPS 2001)*, Ed. Dietterich T,
Becker S, and Ghahramani Z, 617–624. A Bradford Book, ISBN
9780262042086.

## See also

Other methods for singular value decomposition-based techniques:
[`methods-ade4`](methods-ade4.md), [`methods-ca-ca`](methods-ca-ca.md),
[`methods-ca-mjca`](methods-ca-mjca.md),
[`methods-candisc-cancor`](methods-candisc-cancor.md),
[`methods-nipals-empca`](methods-nipals-empca.md),
[`methods-nipals-nipals`](methods-nipals-nipals.md),
[`methods-pma-cca`](methods-pma-cca.md),
[`methods-pma-spc`](methods-pma-spc.md)

Other methods for singular value decomposition-based techniques:
[`methods-ade4`](methods-ade4.md), [`methods-ca-ca`](methods-ca-ca.md),
[`methods-ca-mjca`](methods-ca-mjca.md),
[`methods-candisc-cancor`](methods-candisc-cancor.md),
[`methods-nipals-empca`](methods-nipals-empca.md),
[`methods-nipals-nipals`](methods-nipals-nipals.md),
[`methods-pma-cca`](methods-pma-cca.md),
[`methods-pma-spc`](methods-pma-spc.md)

Other methods for singular value decomposition-based techniques:
[`methods-ade4`](methods-ade4.md), [`methods-ca-ca`](methods-ca-ca.md),
[`methods-ca-mjca`](methods-ca-mjca.md),
[`methods-candisc-cancor`](methods-candisc-cancor.md),
[`methods-nipals-empca`](methods-nipals-empca.md),
[`methods-nipals-nipals`](methods-nipals-nipals.md),
[`methods-pma-cca`](methods-pma-cca.md),
[`methods-pma-spc`](methods-pma-spc.md)

## Examples

``` r
if (require(logisticPCA) && require(cooccur)) {# {logisticPCA}

# site-species data frame of Sanderson Galapagos finches data
data(finches, package = "cooccur")
class(finches)
finches[seq(6L), seq(6L)]

# logistic singular value decomposition
finches %>%
  t() %>%
  logisticSVD_ord() %>%
  as_tbl_ord() %>%
  print() -> finches_lsvd

# recover row and column singular vectors
get_rows(finches_lsvd)
get_cols(finches_lsvd)
# augment ordination with point names and main effect estimates
augment_ord(finches_lsvd)
# summarize artifical coordinates (inertia is undefined)
tidy(finches_lsvd)
if (FALSE) { # \dontrun{
  confer_inertia(finches_lsvd, .5)
} # }

# biplot (inertia is not defined and cannot be conferred)
finches_lsvd %>%
  augment_ord() %>%
  ggbiplot(aes(label = name), sec.axes = "cols", scale.factor = 100) +
  theme_biplot() +
  geom_rows_vector(alpha = .5, color = "darkred") +
  geom_rows_text_radiate(size = 3, color = "darkred") +
  geom_cols_label(size = 3, alpha = .5, color = "royalblue3",
                  subset = grep("Geospiza", rownames(finches))) +
  geom_cols_point(alpha = .5, color = "royalblue3",
                  subset = -grep("Geospiza", rownames(finches))) +
  ggtitle(
    "Logistic SVD of the Galapagos island finches",
    "Islands (finches) scaled to the primary (secondary) axes"
  ) +
  expand_limits(x = c(-80, 60))

}# {logisticPCA}
#> Loading required package: logisticPCA
#> Loading required package: cooccur
#> Warning: there is no package called ‘cooccur’
if (require(logisticPCA) && require(cooccur)) {# {logisticPCA}

# site-species data frame of Sanderson Galapagos finches data
data(finches, package = "cooccur")
class(finches)
finches[seq(6L), seq(6L)]

# logistic PCA, omitting ubiquitous finches
finches %>%
  dplyr::filter(dplyr::if_any(where(is.integer), ~ . == 0)) %>%
  t() %>%
  logisticPCA_ord() %>%
  as_tbl_ord() %>%
  print() -> finches_lpca

# biplot (inertia is not defined and cannot be conferred)
finches_lpca %>%
  augment_ord() %>%
  ggbiplot(aes(label = name), sec.axes = "cols", scale.factor = 50) +
  theme_biplot() +
  geom_rows_vector(alpha = .5, color = "darkred") +
  geom_rows_text_radiate(size = 3, color = "darkred") +
  geom_cols_label(size = 3, alpha = .5, color = "royalblue3",
                  subset = grep("Geospiza", rownames(finches))) +
  geom_cols_point(alpha = .5, color = "royalblue3",
                  subset = -grep("Geospiza", rownames(finches))) +
  ggtitle(
    "Logistic PCA of the Galapagos island finches",
    "Islands (finches) scaled to the primary (secondary) axes"
  ) +
  expand_limits(x = c(-25, 35))

}# {logisticPCA}
#> Loading required package: cooccur
#> Warning: there is no package called ‘cooccur’
if (require(logisticPCA) && require(cooccur)) {# {logisticPCA}

# site-species data frame of Sanderson Galapagos finches data
data(finches, package = "cooccur")
class(finches)
finches[seq(6L), seq(6L)]

# convex logistic PCA, omitting ubiquitous finches
finches %>%
  dplyr::filter(dplyr::if_any(where(is.integer), ~ . == 0)) %>%
  t() %>%
  convexLogisticPCA_ord() %>%
  as_tbl_ord() %>%
  print() -> finches_clpca

# biplot (inertia is not defined and cannot be conferred)
finches_clpca %>%
  augment_ord() %>%
  ggbiplot(aes(label = name), sec.axes = "cols", scale.factor = 50) +
  theme_biplot() +
  geom_rows_vector(alpha = .5, color = "darkred") +
  geom_rows_text_radiate(size = 3, color = "darkred") +
  geom_cols_label(size = 3, alpha = .5, color = "royalblue3",
                  subset = grep("Geospiza", rownames(finches))) +
  geom_cols_point(alpha = .5, color = "royalblue3",
                  subset = -grep("Geospiza", rownames(finches))) +
  ggtitle(
    "Convex logistic PCA of the Galapagos island finches",
    "Islands (finches) scaled to the primary (secondary) axes"
  ) +
  expand_limits(x = c(-25, 35))

}# {logisticPCA}
#> Loading required package: cooccur
#> Warning: there is no package called ‘cooccur’
```
