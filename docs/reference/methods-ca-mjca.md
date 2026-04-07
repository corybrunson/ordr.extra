# Functionality for multiple and joint correspondence analysis ('mjca') objects

These methods extract data from, and attribute new data to, objects of
class `"mjca"` from the **ca** package.

## Usage

``` r
# S3 method for class 'mjca'
as_tbl_ord(x)

# S3 method for class 'mjca'
recover_rows(x)

# S3 method for class 'mjca'
recover_cols(x)

# S3 method for class 'mjca'
recover_inertia(x)

# S3 method for class 'mjca'
recover_conference(x)

# S3 method for class 'mjca'
recover_coord(x)

# S3 method for class 'mjca'
recover_aug_rows(x)

# S3 method for class 'mjca'
recover_aug_cols(x)

# S3 method for class 'mjca'
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

## Single, multiple, and joint CA

Greenacre (2007) proposes joint correspondence analysis (JCA) as a
counterpart to classical multiple correspondence analysis (MCA). These,
together with classical correspondence analysis (CA), are implemented in
the **ca** package.

## References

Greenacre MJ (2007) *Correspondence Analysis in Practice*, Second
Edition. Boca Raton: Chapman & Hall/CRC, ISBN 978-1-58488-616-7.
<http://www.carme-n.org/?sec=books2>

## See also

Other methods for singular value decomposition-based techniques:
[`methods-ade4`](methods-ade4.md), [`methods-ca-ca`](methods-ca-ca.md),
[`methods-candisc-cancor`](methods-candisc-cancor.md),
[`methods-lpca`](methods-lpca.md),
[`methods-nipals-empca`](methods-nipals-empca.md),
[`methods-nipals-nipals`](methods-nipals-nipals.md),
[`methods-pma-cca`](methods-pma-cca.md),
[`methods-pma-spc`](methods-pma-spc.md)

Other models from the **ca** package:
[`methods-ca-ca`](methods-ca-ca.md)

## Examples

``` r
# table of admissions and rejections from UC Berkeley
class(UCBAdmissions)
#> [1] "table"
head(as.data.frame(UCBAdmissions))
#>      Admit Gender Dept Freq
#> 1 Admitted   Male    A  512
#> 2 Rejected   Male    A  313
#> 3 Admitted Female    A   89
#> 4 Rejected Female    A   19
#> 5 Admitted   Male    B  353
#> 6 Rejected   Male    B  207

if (require(ca)) {# {ca}

# perform multiple correspondence analysis
UCBAdmissions %>%
  ca::mjca() %>%
  as_tbl_ord() %>%
  # augment profiles with names, masses, distances, and inertias
  augment_ord() %>%
  print() -> admissions_mca

# recover row and column profiles
head(get_rows(admissions_mca))
get_cols(admissions_mca)

# column-standard biplot of factor levels
admissions_mca %>%
  ggbiplot() +
  theme_bw() + theme_biplot() +
  geom_origin() +
  # geom_rows_count() +
  geom_cols_point(aes(shape = factor, size = mass)) +
  geom_cols_text_repel(aes(label = level), show.legend = FALSE) +
  scale_size_area(guide = "none") +
  labs(shape = "Factor level")

# column-principal biplot of factor levels
admissions_mca %>%
  confer_inertia("colprincipal") %>%
  ggbiplot() +
  theme_bw() + theme_biplot() +
  geom_origin() +
  # geom_rows_point(stat = "sum") +
  geom_cols_point(aes(shape = factor, size = mass)) +
  geom_cols_text_repel(aes(label = level), show.legend = FALSE) +
  scale_size_area(guide = "none") +
  labs(shape = "Factor level")

}# {ca}
#> Loading required package: ca
#> Warning: there is no package called ‘ca’
```
