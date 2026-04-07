# Functionality for canonical correlation ('cancor') objects

These methods extract data from, and attribute new data to, objects of
class 'cancor' from the **candisc** package.

## Usage

``` r
# S3 method for class 'cancor'
as_tbl_ord(x)

# S3 method for class 'cancor'
recover_rows(x)

# S3 method for class 'cancor'
recover_cols(x)

# S3 method for class 'cancor'
recover_inertia(x)

# S3 method for class 'cancor'
recover_coord(x)

# S3 method for class 'cancor'
recover_conference(x)

# S3 method for class 'cancor'
recover_supp_rows(x)

# S3 method for class 'cancor'
recover_supp_cols(x)

# S3 method for class 'cancor'
recover_aug_rows(x)

# S3 method for class 'cancor'
recover_aug_cols(x)

# S3 method for class 'cancor'
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

## Details

ter Braak (1990) recommends two families of biplots for the canonical
correspondence analysis of data matrices \\(X\\) and \\(Y\\).

For the first, using structural correlations, either the interset
correlations of \\(X\\) (equivalent to principal coordinates) are
plotted with the intraset correlations of \\(Y\\) (standard coordinates)
or vice-versa, so that their product recovers the inner product matrix
\\(XY'\\). ter Braak's biplots can then be recovered by balancing the
inertia across the two factors.

For the second, if the variables are distinguished as predictors and
criteria, then the superposition of the interset correlations of the
criteria with the (inertia-free) canonical coefficients of the
predictors yields a biplot that approximates the matrix of coefficients
in the multivariate regression model.

The methods for `candisc::cancor()` mirror those for
[`ordr::cancor_ord()`](https://corybrunson.github.io/ordr/reference/wrap-ord.html)
in **ordr**, though the canonical coefficients (hence the canonical
scores) are inversely scaled by \\(n - 1\\).

## References

ter Braak CJF (1990) "Interpreting canonical correlation analysis
through biplots of structure correlations and weights". *Psychometrika*
55(3), 519–531.
[doi:10.1007/BF02294765](https://doi.org/10.1007/BF02294765)

## See also

[ordr::methods-cancor](https://corybrunson.github.io/ordr/reference/methods-cancor.html)

Other methods for singular value decomposition-based techniques:
[`methods-ade4`](methods-ade4.md), [`methods-ca-ca`](methods-ca-ca.md),
[`methods-ca-mjca`](methods-ca-mjca.md),
[`methods-lpca`](methods-lpca.md),
[`methods-nipals-empca`](methods-nipals-empca.md),
[`methods-nipals-nipals`](methods-nipals-nipals.md),
[`methods-pma-cca`](methods-pma-cca.md),
[`methods-pma-spc`](methods-pma-spc.md)

Other models from the **candisc** package:
[`methods-candisc-candisc`](methods-candisc-candisc.md)

## Examples

``` r
if (require(candisc)) {# {candisc}

# data frame of life-cycle savings across countries
class(LifeCycleSavings)
head(LifeCycleSavings)

# canonical correlation analysis of age distributions and financial factors
savings_cancor <- candisc::cancor(
  LifeCycleSavings[, c("pop15", "pop75")],
  LifeCycleSavings[, c("sr", "dpi", "ddpi")]
)

# wrap as a 'tbl_ord' object
(savings_cancor <- as_tbl_ord(savings_cancor))
# recover canonical weights
get_rows(savings_cancor, elements = "active")
get_cols(savings_cancor, elements = "active")
head(get_rows(savings_cancor, elements = "supplementary"))
head(get_cols(savings_cancor, elements = "supplementary"))
# augment canonical weights with row names and centers
(savings_cancor <- augment_ord(savings_cancor))

# column-standard biplot of structure correlations
# (intraset correlations of first set, interset correlations with second set)
savings_cancor %>%
  confer_inertia("columns") %>%
  ggbiplot(aes(label = name)) +
  geom_unit_circle() +
  geom_rows_vector(elements = "structure") +
  geom_rows_text_radiate(elements = "structure") +
  geom_cols_point(elements = "structure", color = "forestgreen") +
  geom_cols_text_repel(elements = "structure", color = "forestgreen") +
  expand_limits(x = c(-1, 1), y = c(-1, 1))

}# {candisc}
#> Loading required package: candisc
#> Warning: there is no package called ‘candisc’
```
