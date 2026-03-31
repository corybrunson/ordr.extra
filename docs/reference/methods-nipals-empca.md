# Functionality for expectation maximization PCA ('empca_ord') objects

These methods extract data from, and attribute new data to, objects of
class `"empca_ord"`. This is a class introduced in this package to
identify objects returned by [`empca_ord()`](wrap-ord-extra.md), which
wraps
[`nipals::empca()`](https://kwstat.github.io/nipals/reference/empca.html).

## Usage

``` r
# S3 method for class 'empca_ord'
as_tbl_ord(x)

# S3 method for class 'empca_ord'
recover_rows(x)

# S3 method for class 'empca_ord'
recover_cols(x)

# S3 method for class 'empca_ord'
recover_inertia(x)

# S3 method for class 'empca_ord'
recover_coord(x)

# S3 method for class 'empca_ord'
recover_conference(x)

# S3 method for class 'empca_ord'
recover_aug_rows(x)

# S3 method for class 'empca_ord'
recover_aug_cols(x)

# S3 method for class 'empca_ord'
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

## See also

Other methods for singular value decomposition-based techniques:
[`methods-ade4`](methods-ade4.md), [`methods-ca-ca`](methods-ca-ca.md),
[`methods-ca-mjca`](methods-ca-mjca.md),
[`methods-candisc-cancor`](methods-candisc-cancor.md),
[`methods-lpca`](methods-lpca.md),
[`methods-nipals-nipals`](methods-nipals-nipals.md),
[`methods-pma-cca`](methods-pma-cca.md),
[`methods-pma-spc`](methods-pma-spc.md)

Other models from the **nipals** package:
[`methods-nipals-nipals`](methods-nipals-nipals.md)

## Examples

``` r
# incomplete air quality measurements from New York
class(airquality)
#> [1] "data.frame"
head(airquality)
#>   Ozone Solar.R Wind Temp Month Day
#> 1    41     190  7.4   67     5   1
#> 2    36     118  8.0   72     5   2
#> 3    12     149 12.6   74     5   3
#> 4    18     313 11.5   62     5   4
#> 5    NA      NA 14.3   56     5   5
#> 6    28      NA 14.9   66     5   6

if (require(nipals)) {# {nipals}

# single date variable
airquality %>%
  transform(Date = as.Date(paste("1973", Month, Day, sep = "-"))) %>%
  subset(select = -c(Month, Day)) ->
  air_quality
# random weights
rand_wts <- matrix(nrow = nrow(air_quality), ncol = ncol(air_quality) - 1L)
rand_wts[] <- runif(n = prod(dim(rand_wts)))

# EMPCA on weighted air quality measures
air_empca <-
  ordinate(x = air_quality, model = empca_ord, cols = 1:4, w = rand_wts)

# compare original and fitted data
head(air_quality)
{ get_rows(air_empca) %*%
    diag(get_inertia(air_empca)) %*%
    t(get_cols(air_empca)) } %>%
  sweep(2L, air_empca$scale, "*") %>%
  sweep(2L, air_empca$center, "+") %>%
  head()

}# {nipals}
#> Loading required package: nipals
#> Warning: package 'nipals' was built under R version 4.3.3
#> 
#> Attaching package: 'nipals'
#> The following object is masked from 'package:ade4':
#> 
#>     nipals
#>         Ozone   Solar.R      Wind     Temp
#> 1    41.01705  191.3261  7.306978 66.77636
#> 2    36.00189  113.8259  8.108903 72.44318
#> 3    11.96973  156.0437 12.617774 74.34290
#> 4    18.00168  333.6676 11.049193 60.82372
#> 5 -4660.68016 -495.9995 15.564645 59.05570
#> 6    27.94366  140.1660 14.872127 66.56332
```
