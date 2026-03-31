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
#> Warning: package 'logisticPCA' was built under R version 4.3.3
#> Loading required package: cooccur
#> Warning: package 'cooccur' was built under R version 4.3.3
#> rARPACK must be installed to use partial_decomp
#> # A tbl_ord of class 'lsvd': (17 x 2) x (13 x 2)'
#> # 2 coordinates: LSC1 and LSC2
#> # 
#> # Rows: [ 17 x 2 | 0 ]
#>    LSC1   LSC2 | 
#>                | 
#> 1 -29.6 -27.3  | 
#> 2 -29.6 -27.3  | 
#> 3  39.4  22.9  | 
#> 4  39.9  40.6  | 
#> 5  20.2   3.50 | 
#> 
#> # 
#> # Columns: [ 13 x 2 | 0 ]
#>     LSC1   LSC2 | 
#>                 | 
#> 1 0.233   0.231 | 
#> 2 0.223  -0.216 | 
#> 3 0.164  -0.318 | 
#> 4 0.0787  0.548 | 
#> 5 0.240  -0.451 | 
#> 
#> `subset` will be applied after data are restricted to active elements.
#> `subset` will be applied after data are restricted to active elements.
#> Warning: `GeomTextRadiate` is deprecated; use `GeomVector` instead.

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
#> # A tbl_ord of class 'lpca': (17 x 2) x (12 x 2)'
#> # 2 coordinates: LPC1 and LPC2
#> # 
#> # Rows: [ 17 x 2 | 0 ]
#>     LPC1   LPC2 | 
#>                 | 
#> 1   1.99 -10.5  | 
#> 2   1.99 -10.5  | 
#> 3 -11.5    4.60 | 
#> 4  -8.62   7.51 | 
#> 5 -10.6    1.65 | 
#> 
#> # 
#> # Columns: [ 12 x 2 | 0 ]
#>      LPC1   LPC2 | 
#>                  | 
#> 1 -0.190   0.373 | 
#> 2 -0.367  -0.161 | 
#> 3 -0.279  -0.279 | 
#> 4  0.0412  0.569 | 
#> 5 -0.358  -0.364 | 
#> 
#> `subset` will be applied after data are restricted to active elements.
#> `subset` will be applied after data are restricted to active elements.
#> Warning: `GeomTextRadiate` is deprecated; use `GeomVector` instead.

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
#> # A tbl_ord of class 'clpca': (17 x 2) x (12 x 2)'
#> # 2 coordinates: LPC1 and LPC2
#> # 
#> # Rows: [ 17 x 2 | 0 ]
#>     LPC1   LPC2 | 
#>                 | 
#> 1   5.81 -9.59  | 
#> 2   5.81 -9.59  | 
#> 3 -10.0   3.39  | 
#> 4  -7.81  6.94  | 
#> 5  -9.14  0.958 | 
#> 
#> # 
#> # Columns: [ 12 x 2 | 0 ]
#>     LPC1   LPC2 | 
#>                 | 
#> 1 -0.232  0.275 | 
#> 2 -0.355 -0.293 | 
#> 3 -0.210 -0.315 | 
#> 4 -0.110  0.568 | 
#> 5 -0.275 -0.444 | 
#> 
#> `subset` will be applied after data are restricted to active elements.
#> `subset` will be applied after data are restricted to active elements.
#> Warning: `GeomTextRadiate` is deprecated; use `GeomVector` instead.
```
