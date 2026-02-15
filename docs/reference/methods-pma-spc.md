# Functionality for penalized multivariate analysis ('SPC') objects

These methods extract data from, and attribute new data to, objects of
class 'SPC' from the
**[PMA](https://rdrr.io/pkg/PMA/man/PMA-package.html)** package.

## Usage

``` r
# S3 method for class 'SPC'
as_tbl_ord(x)

# S3 method for class 'SPC'
recover_coord(x)

# S3 method for class 'SPC'
recover_rows(x)

# S3 method for class 'SPC'
recover_cols(x)

# S3 method for class 'SPC'
recover_inertia(x)

# S3 method for class 'SPC'
recover_conference(x)

# S3 method for class 'SPC'
recover_aug_rows(x)

# S3 method for class 'SPC'
recover_aug_cols(x)

# S3 method for class 'SPC'
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

## Penalized matrix decomposition

Witten, Tibshirani, and Hastie (2009) provide a theoretical basis and
computational algorithm for penalized matrix decomposition that
specializes to sparse PCA and to sparse CCA. Their R package **PMA**
implements these specializations as well as one to sparse multiple CCA.

## References

Witten DM, Tibshirani R, & Hastie T (2009) "A penalized matrix
decomposition, with applications to sparse principal components and
canonical correlation analysis". *Biostatistics* **10**(3): 515–534.
[doi:10.1093/biostatistics/kxp008](https://doi.org/10.1093/biostatistics/kxp008)

## See also

Other methods for singular value decomposition-based techniques:
[`methods-ade4`](methods-ade4.md), [`methods-ca-ca`](methods-ca-ca.md),
[`methods-ca-mjca`](methods-ca-mjca.md),
[`methods-candisc-cancor`](methods-candisc-cancor.md),
[`methods-lpca`](methods-lpca.md),
[`methods-nipals-empca`](methods-nipals-empca.md),
[`methods-nipals-nipals`](methods-nipals-nipals.md),
[`methods-pma-cca`](methods-pma-cca.md)

Other models from the **PMA** package:
[`methods-pma-cca`](methods-pma-cca.md)

## Examples

``` r
# data frame of Anderson iris species measurements
class(iris)
#> [1] "data.frame"
head(iris)
#>   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
#> 1          5.1         3.5          1.4         0.2  setosa
#> 2          4.9         3.0          1.4         0.2  setosa
#> 3          4.7         3.2          1.3         0.2  setosa
#> 4          4.6         3.1          1.5         0.2  setosa
#> 5          5.0         3.6          1.4         0.2  setosa
#> 6          5.4         3.9          1.7         0.4  setosa

if (require(PMA)) {# {PMA}

# compute principal components of scaled measurements
iris_spca <- PMA::SPC(
  as.matrix(iris[, -5L]),
  sumabsv = sqrt(2),
  K = 2L,
  cnames = names(iris)[seq(4L)]
)

# wrap as a 'tbl_ord' object
(iris_spca <- as_tbl_ord(iris_spca))
# bind species classification to observation coordinates
(iris_spca <- mutate_rows(iris_spca, species = iris$Species))

# recover observation principal coordinates and measurement standard coordinates
head(get_rows(iris_spca))
get_cols(iris_spca)
# recover inertia in each dimension
get_inertia(iris_spca)

# augment measurements with names and scaling parameters
(iris_spca <- augment_ord(iris_spca))
# row-principal biplot
iris_spca %>%
  augment_ord() %>%
  ggbiplot(axis.type = "predictive") +
  theme_bw() + theme_biplot() +
  scale_color_brewer(type = "qual", palette = 2) +
  # -+- text elements are extremely far removed -+-
  geom_cols_axis(aes(label = name, center = meanx)) +
  geom_rows_point(aes(color = species), alpha = .5) +
  ggtitle("Row-principal sparse PCA biplot of Anderson iris measurements") +
  expand_limits(x = c(-.12, .2))

}# {PMA}
#> 123456789
#> 123
#> Warning: Predictive biplots are only implemented for linear methods (ED, SVD, PCA).
```
