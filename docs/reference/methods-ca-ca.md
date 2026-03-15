# Functionality for correspondence analysis ('ca') objects

These methods extract data from, and attribute new data to, objects of
class `"ca"` from the **[ca](https://rdrr.io/pkg/ca/man/ca.html)**
package.

## Usage

``` r
# S3 method for class 'ca'
as_tbl_ord(x)

# S3 method for class 'ca'
recover_rows(x)

# S3 method for class 'ca'
recover_cols(x)

# S3 method for class 'ca'
recover_inertia(x)

# S3 method for class 'ca'
recover_conference(x)

# S3 method for class 'ca'
recover_coord(x)

# S3 method for class 'ca'
recover_aug_rows(x)

# S3 method for class 'ca'
recover_aug_cols(x)

# S3 method for class 'ca'
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

[ordr::methods-correspondence](https://corybrunson.github.io/ordr/reference/methods-correspondence.html)

Other methods for singular value decomposition-based techniques:
[`methods-ade4`](methods-ade4.md),
[`methods-ca-mjca`](methods-ca-mjca.md),
[`methods-candisc-cancor`](methods-candisc-cancor.md),
[`methods-lpca`](methods-lpca.md),
[`methods-nipals-empca`](methods-nipals-empca.md),
[`methods-nipals-nipals`](methods-nipals-nipals.md),
[`methods-pma-cca`](methods-pma-cca.md),
[`methods-pma-spc`](methods-pma-spc.md)

Other models from the **ca** package:
[`methods-ca-mjca`](methods-ca-mjca.md)

## Examples

``` r
# table of hair and eye color data collapsed by sex
class(HairEyeColor)
#> [1] "table"
haireye <- as.data.frame(rowSums(HairEyeColor, dims = 2L))
print(haireye)
#>       Brown Blue Hazel Green
#> Black    68   20    15     5
#> Brown   119   84    54    29
#> Red      26   17    14    14
#> Blond     7   94    10    16

if (require(ca)) {# {ca}

# use correspondence analysis to construct row and column profiles
haireye %>%
  ca::ca() %>%
  as_tbl_ord() %>%
  print() -> haireye_ca

# recover row and column profiles
get_rows(haireye_ca)
get_cols(haireye_ca)
# augment profiles with names, masses, distances, and inertias
(haireye_ca <- augment_ord(haireye_ca))

}# {ca}
#> Loading required package: ca
#> Warning: package 'ca' was built under R version 4.3.3
#> # A tbl_ord of class 'ca': (4 x 3) x (4 x 3)'
#> # 3 coordinates: Dim1, Dim2, Dim3
#> # 
#> # Rows (standard): [ 4 x 3 | 0 ]
#>     Dim1   Dim2   Dim3 | 
#>                        | 
#> 1 -1.10   1.44  -1.09  | 
#> 2 -0.324 -0.219  0.957 | 
#> 3 -0.283 -2.14  -1.63  | 
#> 4  1.83   0.467 -0.318 | 
#> # 
#> # Columns (standard): [ 4 x 3 | 0 ]
#>     Dim1   Dim2    Dim3 | 
#>                         | 
#> 1 -1.08   0.592 -0.424  | 
#> 2  1.20   0.556  0.0924 | 
#> 3 -0.465 -1.12   1.97   | 
#> 4  0.354 -2.27  -1.72   | 
#> # A tbl_ord of class 'ca': (4 x 3) x (4 x 3)'
#> # 3 coordinates: Dim1, Dim2, Dim3
#> # 
#> # Rows (standard): [ 4 x 3 | 4 ]
#>     Dim1   Dim2   Dim3 |   name   mass  dist inertia
#>                        |   <chr> <dbl> <dbl>   <dbl>
#> 1 -1.10   1.44  -1.09  | 1 Black 0.182 0.551  0.0554
#> 2 -0.324 -0.219  0.957 | 2 Brown 0.483 0.159  0.0123
#> 3 -0.283 -2.14  -1.63  | 3 Red   0.120 0.355  0.0151
#> 4  1.83   0.467 -0.318 | 4 Blond 0.215 0.838  0.151 
#> # 
#> # Columns (standard): [ 4 x 3 | 4 ]
#>     Dim1   Dim2    Dim3 |   name   mass  dist inertia
#>                         |   <chr> <dbl> <dbl>   <dbl>
#> 1 -1.08   0.592 -0.424  | 1 Brown 0.372 0.500  0.0931
#> 2  1.20   0.556  0.0924 | 2 Blue  0.363 0.554  0.111 
#> 3 -0.465 -1.12   1.97   | 3 Hazel 0.157 0.289  0.0131
#> 4  0.354 -2.27  -1.72   | 4 Green 0.108 0.386  0.0161
```
