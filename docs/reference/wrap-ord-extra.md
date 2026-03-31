# Wrappers for lossy ordination methods

These `*_ord` functions wrap functions imported from other packages with
modifications for use with
'[ordr::tbl_ord](https://corybrunson.github.io/ordr/reference/tbl_ord.html)'
methods. They complement those provided by **ordr** for some common
functions. Some parameters are hidden from the user and set to settings
required for these methods, some matrix outputs are given row or column
names to be used by them, and new '\*\_ord' S3 class attributes are
added to enable them.

## Usage

``` r
logisticSVD_ord(
  x,
  k = 2,
  quiet = TRUE,
  max_iters = 1000,
  conv_criteria = 1e-05,
  random_start = FALSE,
  ...,
  partial_decomp = TRUE,
  main_effects = TRUE
)

logisticPCA_ord(
  x,
  k = 2,
  m = 4,
  quiet = TRUE,
  partial_decomp = FALSE,
  max_iters = 1000,
  conv_criteria = 1e-05,
  random_start = FALSE,
  ...,
  main_effects = TRUE
)

convexLogisticPCA_ord(
  x,
  k = 2,
  m = 4,
  quiet = TRUE,
  partial_decomp = FALSE,
  max_iters = 1000,
  conv_criteria = 1e-06,
  random_start = FALSE,
  ...,
  main_effects = TRUE,
  ss_factor = 4
)

nipals_ord(
  x,
  ncomp = min(nrow(x), ncol(x)),
  center = TRUE,
  scale = TRUE,
  maxiter = 500,
  tol = 1e-06,
  startcol = 0,
  fitted = FALSE,
  force.na = FALSE,
  gramschmidt = TRUE,
  verbose = FALSE
)

empca_ord(
  x,
  w,
  ncomp = min(nrow(x), ncol(x)),
  center = TRUE,
  scale = TRUE,
  maxiter = 100,
  tol = 1e-06,
  seed = NULL,
  fitted = FALSE,
  gramschmidt = TRUE,
  verbose = FALSE
)
```

## Arguments

- x:

  matrix with all binary entries

- k:

  number of principal components to return

- quiet:

  logical; whether the calculation should give feedback

- max_iters:

  number of maximum iterations

- conv_criteria:

  convergence criteria. The difference between average deviance in
  successive iterations

- random_start:

  logical; whether to randomly inititalize the parameters. If `FALSE`,
  function will use an eigen-decomposition as starting value

- ...:

  Additional parameters passed to original functions.

- partial_decomp:

  logical; if `TRUE`, the function uses the rARPACK package to more
  quickly calculate the eigen-decomposition. This is usually faster than
  standard eigen-decomponsition when `ncol(x) > 100` and `k` is small

- main_effects:

  logical; whether to include main effects in the model

- m:

  value to approximate the saturated model. If `m = 0`, m is solved for

- ss_factor:

  step size multiplier. Amount by which to multiply the step size.
  Quadratic convergence rate can be proven for `ss_factor = 1`, but I
  have found higher values sometimes work better. The default is
  `ss_factor = 4`. If it is not converging, try `ss_factor = 1`.

- ncomp:

  Maximum number of principal components to extract from x.

- center:

  If TRUE, subtract the mean from each column of x before PCA.

- scale:

  if TRUE, divide the standard deviation from each column of x before
  PCA.

- maxiter:

  Maximum number of NIPALS iterations for each principal component.

- tol:

  Default 1e-6 tolerance for testing convergence of the NIPALS
  iterations for each principal component.

- startcol:

  Determine the starting column of x for the iterations of each
  principal component. If 0, use the column of x that has maximum
  absolute sum. If a number, use that column of x. If a function, apply
  the function to each column of x and choose the column with the
  maximum value of the function.

- fitted:

  Default FALSE. If TRUE, return the fitted (reconstructed) value of x.

- force.na:

  Default FALSE. If TRUE, force the function to use the method for
  missing values, even if there are no missing values in x.

- gramschmidt:

  Default TRUE. If TRUE, perform Gram-Schmidt orthogonalization at each
  iteration.

- verbose:

  Default FALSE. Use TRUE or 1 to show some diagnostics.

- w:

  Numerical matrix of weights.

- seed:

  Random seed to use when initializing the random rotation matrix.

## Value

Objects slightly modified from the outputs of the original functions,
with new '\*-ord' classes.

## Details

The following table summarizes the wrapped functions:

|  |  |  |  |
|----|----|----|----|
| Original function | Hide params | Add names | New class |
| [`logisticPCA::logisticSVD()`](https://rdrr.io/pkg/logisticPCA/man/logisticSVD.html) | No | Yes | No |
| [`logisticPCA::logisticPCA()`](https://rdrr.io/pkg/logisticPCA/man/logisticPCA.html) | No | Yes | No |
| [`logisticPCA::convexLogisticPCA()`](https://rdrr.io/pkg/logisticPCA/man/convexLogisticPCA.html) | No | Yes | No |
| [`nipals::nipals()`](https://kwstat.github.io/nipals/reference/nipals.html) | No | No | Yes |
| [`nipals::empca()`](https://kwstat.github.io/nipals/reference/empca.html) | No | No | Yes |

## See also

[ordr::wrap-ord](https://corybrunson.github.io/ordr/reference/wrap-ord.html)
