# **ordr.extra** package

Additional accessors to represent ordination models as 'tbl_ord's in
**[ordr](https://corybrunson.github.io/ordr/reference/ordr.html)**.

## Details

**ordr** includes many methods and steps for extended workflows for
'tbl_ord' objects. Accessors are required to wrap ordination models as
'tbl_ord's and make these methods available to them. To conserve size,
**ordr** only includes accessors for the most commonly distributed and
used ordination models. This package serves as a reservoir of accessors
for additional, less common models.

## Author

**Maintainer**: Jason Cory Brunson <cornelioid@gmail.com>
([ORCID](https://orcid.org/0000-0003-3126-9494))

Authors:

- John Gracey <jbgracey6@gmail.com>

## Examples

``` r
if (require()) {# {ca}
# CA of hair & eye color data
ordinate(apply(HairEyeColor, seq(2L), sum), ca::ca)
}# {ca}
#> Loading required package: 

if (require()) {# {ca}
# MCA of hair & eye color data, stratified by sex
ordinate(HairEyeColor, ca::mjca)
}# {ca}
#> Loading required package: 

if (require(ade4)) {# {ade4}
# NIPALS of air quality data
ordinate(airquality, ~ ade4::nipals(.), cols = seq(4L))
ordinate(airquality, cols = c("Ozone", "Solar.R", "Wind", "Temp"), ade4::nipals)
}# {ade4}
#> Loading required package: ade4
#> Warning: there is no package called ‘ade4’

if (require(PMA)) {# {PMA}
# sparse CCA of savings data
ordinate(
  x = LifeCycleSavings[, c(2L, 3L)],
  z = LifeCycleSavings[, c(1L, 4L, 5L)],
  model = PMA::CCA, K = 2L, penaltyx = .5, penaltyz = .5,
  # prevent errors
  typex = "standard", typez = "standard"
)
}# {PMA}
#> Loading required package: PMA
#> Warning: there is no package called ‘PMA’

if (require(logisticPCA) && require(cooccur)) {# {logisticPCA}
# lSVD of finches data
data(finches, package = "cooccur")
ordinate(finches, logisticSVD_ord)
}# {logisticPCA}
#> Loading required package: logisticPCA
#> Warning: there is no package called ‘logisticPCA’
```
