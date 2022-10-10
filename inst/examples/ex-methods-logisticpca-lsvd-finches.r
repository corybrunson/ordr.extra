# site-species data frame of Sanderson Galapagos finches data
data(finches, package = "cooccur")
class(finches)
finches[seq(6L), seq(6L)]

# logistic singular value decomposition
finches %>%
  t() %>%
  logisticSVD_ord() %>%
  as_tbl_ord() %>%
  print() -> finches_lsvd

# recover row and column singular vectors
get_rows(finches_lsvd)
get_cols(finches_lsvd)
# augment ordination with point names and main effect estimates
augment_ord(finches_lsvd)
# summarize artifical coordinates (inertia is undefined)
tidy(finches_lsvd)
\dontrun{
  confer_inertia(finches_lsvd, .5)
}

# biplot (inertia is not defined and cannot be conferred)
finches_lsvd %>%
  augment_ord() %>%
  ggbiplot(aes(label = name), sec.axes = "cols", scale.factor = 100) +
  theme_biplot() +
  geom_rows_vector(alpha = .5, color = "darkred") +
  geom_rows_text_radiate(size = 3, color = "darkred") +
  geom_cols_label(size = 3, alpha = .5, color = "royalblue3",
                  subset = grep("Geospiza", rownames(finches))) +
  geom_cols_point(alpha = .5, color = "royalblue3",
                  subset = -grep("Geospiza", rownames(finches))) +
  ggtitle(
    "Logistic SVD of the Galapagos island finches",
    "Islands (finches) scaled to the primary (secondary) axes"
  ) +
  expand_limits(x = c(-80, 60))
