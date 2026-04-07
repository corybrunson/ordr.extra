# Functionality for non-linear iterative PLS ('nipals_ord') objects

These methods extract data from, and attribute new data to, objects of
class `"nipals_ord"`. This is a class introduced in this package to
identify objects returned by [`nipals_ord()`](wrap-ord-extra.md), which
wraps `nipals::nipals()`.

## Usage

``` r
# S3 method for class 'nipals_ord'
as_tbl_ord(x)

# S3 method for class 'nipals_ord'
recover_rows(x)

# S3 method for class 'nipals_ord'
recover_cols(x)

# S3 method for class 'nipals_ord'
recover_inertia(x)

# S3 method for class 'nipals_ord'
recover_coord(x)

# S3 method for class 'nipals_ord'
recover_conference(x)

# S3 method for class 'nipals_ord'
recover_aug_rows(x)

# S3 method for class 'nipals_ord'
recover_aug_cols(x)

# S3 method for class 'nipals_ord'
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
[`methods-nipals-empca`](methods-nipals-empca.md),
[`methods-pma-cca`](methods-pma-cca.md),
[`methods-pma-spc`](methods-pma-spc.md)

Other models from the **nipals** package:
[`methods-nipals-empca`](methods-nipals-empca.md)

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

# NIPALS on air quality measures
air_quality[, seq(4L)] %>%
  nipals_ord() %>%
  as_tbl_ord() %>%
  print() -> air_nipals
# bind dates to observation coordinates
air_nipals %>%
  cbind_rows(air_quality[, 5L, drop = FALSE]) %>%
  mutate_rows(missingness = apply(is.na(air_quality[, 1:4]), 1L, any)) ->
  air_nipals

# by default, no inertia is conferred
get_conference(air_nipals)
# recover observation and measurement standard coordinates
head(get_rows(air_nipals))
get_cols(air_nipals)

# augment measurements with names and scaling parameters
augment_ord(air_nipals)
# row-principal biplot with monthly ellipses
air_nipals %>%
  augment_ord() %>%
  confer_inertia("rows") %>%
  ggbiplot() +
  theme_bw() +
  geom_cols_vector(color = "#444444") +
  geom_cols_text_radiate(aes(label = name), color = "#444444") +
  stat_rows_ellipse(aes(color = format(Date, "%b"))) +
  geom_rows_point(aes(color = format(Date, "%b")), size = 1, alpha = .5) +
  geom_rows_point(aes(shape = missingness), size = 3) +
  scale_shape_manual(values = c(`TRUE` = 1L, `FALSE` = NA)) +
  ggtitle("Row-principal PCA biplot of 1973 air quality measurements") +
  labs(color = "Month")

}# {nipals}
#> Loading required package: nipals
#> Warning: there is no package called ‘nipals’
```
