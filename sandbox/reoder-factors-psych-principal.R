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
# printing the output before my changes, too. The biplot axis is still wrong, 
# though. I tried reading the documentation and some source code for ggplot, but
# couldn't come up with anything there.
