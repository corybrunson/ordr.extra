# site-species data frame of Sanderson Galapagos finches data
data(finches, package = "cooccur")
class(finches)
finches[seq(6L), seq(6L)]

# convex logistic PCA, omitting ubiquitous finches
finches %>%
  dplyr::filter(dplyr::if_any(where(is.integer), ~ . == 0)) %>%
  t() %>%
  convexLogisticPCA_ord() %>%
  as_tbl_ord() %>%
  print() -> finches_clpca

# biplot (inertia is not defined and cannot be conferred)
finches_clpca %>%
  augment_ord() %>%
  ggbiplot(aes(label = .name), sec.axes = "cols", scale.factor = 50) +
  theme_biplot() +
  geom_rows_vector(alpha = .5, color = "darkred") +
  geom_rows_text_radiate(size = 3, color = "darkred") +
  geom_cols_label(size = 3, alpha = .5, color = "royalblue3",
                  subset = grep("Geospiza", rownames(finches))) +
  geom_cols_point(alpha = .5, color = "royalblue3",
                  subset = -grep("Geospiza", rownames(finches))) +
  ggtitle(
    "Convex logistic PCA of the Galapagos island finches",
    "Islands (finches) scaled to the primary (secondary) axes"
  ) +
  expand_limits(x = c(-25, 35))
