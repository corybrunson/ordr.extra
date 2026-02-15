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
#> # A tbl_ord of class 'nipals': (153 x 2) x (4 x 2)'
#> # 2 coordinates: Fac1 and Fac2
#> # 
#> # Rows (principal): [ 153 x 2 | 3 ]
#>     Fac1    Fac2 |   name  Month   Day
#>                  |   <chr> <int> <int>
#> 1 -0.305  0.334  | 1 1         5     1
#> 2 -0.426  0.930  | 2 2         5     2
#> 3 -1.27  -0.0592 | 3 3         5     3
#> 4 -1.16  -1.46   | 4 4         5     4
#> 5 -3.41   0.906  | 5 5         5     5
#> # ℹ 148 more rows
#> # 
#> # Columns (standard): [ 4 x 2 | 1 ]
#>     Fac1    Fac2 |   name   
#>                  |   <chr>  
#> 1  0.582  0.0175 | 1 Ozone  
#> 2  0.312 -0.867  | 2 Solar.R
#> 3 -0.491 -0.497  | 3 Wind   
#> 4  0.569 -0.0173 | 4 Temp   

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
#> 12
#> 123
#> # A tbl_ord of class 'CCA': (2 x 2) x (3 x 2)'
#> # 2 coordinates: sCD1 and sCD2
#> # 
#> # Rows (standard): [ 2 x 2 | 1 ]
#>    sCD1  sCD2 |   name 
#>               |   <chr>
#> 1     0     1 | 1 pop15
#> 2     1     0 | 2 pop75
#> # 
#> # Columns (standard): [ 3 x 2 | 1 ]
#>    sCD1  sCD2 |   name 
#>               |   <chr>
#> 1     0     0 | 1 sr   
#> 2     1    -1 | 2 dpi  
#> 3     0     0 | 3 ddpi 

if (require(logisticPCA) && require(cooccur)) {# {logisticPCA}
# lSVD of finches data
data(finches, package = "cooccur")
ordinate(finches, logisticSVD_ord)
}# {logisticPCA}
#> rARPACK must be installed to use partial_decomp
#> # A tbl_ord of class 'lsvd': (13 x 2) x (17 x 2)'
#> # 2 coordinates: LSC1 and LSC2
#> # 
#> # Rows: [ 13 x 2 | 1 ]
#>    LSC1  LSC2 |   name                 
#>               |   <chr>                
#> 1 27.4   31.3 | 1 Geospiza magnirostris
#> 2 47.5  -20.3 | 2 Geospiza fortis      
#> 3 49.2   15.9 | 3 Geospiza fuliginosa  
#> 4 -6.31  32.6 | 4 Geospiza difficilis  
#> 5 57.6  -67.7 | 5 Geospiza scandens    
#> # ℹ 8 more rows
#> # 
#> # Columns: [ 17 x 2 | 2 ]
#>    LSC1    LSC2 |   name          mu
#>                 |   <chr>      <dbl>
#> 1 0.290 -0.0501 | 1 Seymour    -9.73
#> 2 0.290 -0.0501 | 2 Baltra     -9.73
#> 3 0.149  0.177  | 3 Isabella   11.4 
#> 4 0.188  0.398  | 4 Fernandina 13.4 
#> 5 0.216  0.0734 | 5 Santiago    7.22
#> # ℹ 12 more rows
```
