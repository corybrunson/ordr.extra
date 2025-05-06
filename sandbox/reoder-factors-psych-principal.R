library(ordr)
library(ordr.extra)
library(psych)
library(tibble)

hcw_pca <- ordinate(hcw[36:49], ~principal(., nfactors = 14, rotate = "none"))

tidy(hcw_pca) |>
  ggplot(aes(x = name,y = inertia))

recover_coord(hcw_pca)
