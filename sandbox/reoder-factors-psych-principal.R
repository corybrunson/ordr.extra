library(ordr)
library(ordr.extra)
library(psych)
library(tibble)

# create PCA object with healthcare worker data
hcw_pca <- ordinate(hcw[36:49], ~principal(., nfactors = 14, rotate = "none"))

# generate blank scree plot to see order of PCs on x-axis
tidy(hcw_pca) |>
  ggplot(aes(x = name,y = inertia))

# inspect output of recover_aug_coord
recover_aug_coord(hcw_pca)

# The ordering of the "name" column in `recover_aug_coord(hcw_pca)` is what we
# want -- ordered by the number following "PC". However, this was the case when
# printing the output before my changes, too. The scree plot axis is still wrong, 
# though. I tried reading the documentation and some source code for ggplot, but
# couldn't come up with anything there.

# compare these results to the analogous results for `psych::fa()`, for which we
# used `factor_coord()` in the augmented coordinate recoverer.

# create FA object with healthcare worker data (use 12, not 14 factors b/c of 
# nfactor constraint from the function)
hcw_fa <- ordinate(hcw[36:49], ~fa(., nfactors = 12, rotate = "none"))

# generate blank scree plot to see order of PCs on x-axis
tidy(hcw_fa) |>
  ggplot(aes(x = name,y = inertia))

# the factors on the scree plot are ordered as desired, indicating 
# `factor_coord()` resolves the issue from `recover_aug_coord()`.

# now, implement the fix into the `psych::principal()` methods and test.

recover_aug_coord.principal <- function(x) {
  tibble(
    name = factor_coord(recover_coord(x))
  )
}

hcw_pca <- ordinate(hcw[36:49], ~principal(., nfactors = 14, rotate = "none"))

# generate blank scree plot to see order of PCs on x-axis
tidy(hcw_pca) |>
  ggplot(aes(x = name,y = inertia))

# the scree plot axis still has the wrong order of PCs
