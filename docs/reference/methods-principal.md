# Functionality for principal components analysis ('principal') objects

These methods extract data from, and attribute new data to, objects of
class `"principal"` as returned by
[`psych::principal()`](https://rdrr.io/pkg/psych/man/principal.html).

## Usage

``` r
# S3 method for class 'principal'
as_tbl_ord(x)

# S3 method for class 'principal'
recover_rows(x)

# S3 method for class 'principal'
recover_cols(x)

# S3 method for class 'principal'
recover_inertia(x)

# S3 method for class 'principal'
recover_coord(x)

# S3 method for class 'principal'
recover_conference(x)

# S3 method for class 'principal'
recover_supp_rows(x)

# S3 method for class 'principal'
recover_aug_rows(x)

# S3 method for class 'principal'
recover_aug_cols(x)

# S3 method for class 'principal'
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

Principal components analysis (PCA), as performed by
[`psych::principal()`](https://rdrr.io/pkg/psych/man/principal.html),
relies on an eigenvalue decomposition (EVD) of the covariance matrix
\\X^TX\\ of a data set \\X\\.
[`psych::principal()`](https://rdrr.io/pkg/psych/man/principal.html)
returns the right singular vectors with full inertia \\VD\\ from the EVD
as the loadings `$loadings`. The scores `$scores` are obtained as \\XV\\
and are accessible as supplementary elements.

## See also

Other methods for eigen-decomposition-based techniques:
[`methods-fa`](methods-fa.md)

Other models from the psych package: [`methods-fa`](methods-fa.md)

## Author

John Gracey

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

if (require(psych)) {# {psych}

# compute unscaled row-principal components of scaled measurements
iris[, -5] |>
  psych::principal(nfactors = 4, rotate = "none") |>
  as_tbl_ord() |>
  print() -> iris_pca

# recover observation principal coordinates and measurement standard coordinates
head(get_rows(iris_pca))
get_cols(iris_pca)

# augment measurement coordinates with names and scaling parameters
(iris_pca <- augment_ord(iris_pca))

}# {psych}
#> Loading required package: psych
#> 
#> Attaching package: 'psych'
#> The following objects are masked from 'package:ggplot2':
#> 
#>     %+%, alpha
#> # A tbl_ord of class 'psych': (150 x 4) x (4 x 4)'
#> # 4 coordinates: PC1, PC2, ..., PC4
#> # 
#> # Rows (standard): [ 150 x 4 | 0 ]
#>     PC1    PC2     PC3 ... | 
#>                            | 
#> 1 -1.32  0.500 -0.332      | 
#> 2 -1.21 -0.703 -0.610  ... | 
#> 3 -1.38 -0.356  0.115      | 
#> 4 -1.34 -0.623  0.238      | 
#> 5 -1.39  0.674  0.0409     | 
#> 
#> # 
#> # Columns (principal): [ 4 x 4 | 0 ]
#>      PC1    PC2     PC3 ... | 
#>                             | 
#> 1  0.890 0.361  -0.276      | 
#> 2 -0.460 0.883   0.0936 ... | 
#> 3  0.992 0.0234  0.0544     | 
#> 4  0.965 0.0640  0.243      | 
#> # A tbl_ord of class 'psych': (150 x 4) x (4 x 4)'
#> # 4 coordinates: PC1, PC2, ..., PC4
#> # 
#> # Rows (standard): [ 150 x 4 | 1 ]
#>     PC1    PC2     PC3 ... |   .element
#>                            |   <chr>   
#> 1 -1.32  0.500 -0.332      | 1 score   
#> 2 -1.21 -0.703 -0.610  ... | 2 score   
#> 3 -1.38 -0.356  0.115      | 3 score   
#> 4 -1.34 -0.623  0.238      | 4 score   
#> 5 -1.39  0.674  0.0409     | 5 score   
#> # ℹ 145 more rows
#> # 
#> # Columns (principal): [ 4 x 4 | 2 ]
#>      PC1    PC2     PC3 ... |   name         .element
#>                             |   <chr>        <chr>   
#> 1  0.890 0.361  -0.276      | 1 Sepal.Length active  
#> 2 -0.460 0.883   0.0936 ... | 2 Sepal.Width  active  
#> 3  0.992 0.0234  0.0544     | 3 Petal.Length active  
#> 4  0.965 0.0640  0.243      | 4 Petal.Width  active  
```
