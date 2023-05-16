# table of admissions and rejections from UC Berkeley
class(UCBAdmissions)
head(as.data.frame(UCBAdmissions))

# perform multiple correspondence analysis
UCBAdmissions %>%
  ca::mjca() %>%
  as_tbl_ord() %>%
  # augment profiles with names, masses, distances, and inertias
  augment_ord() %>%
  print() -> admissions_mca

# recover row and column profiles
head(get_rows(admissions_mca))
get_cols(admissions_mca)

# column-standard biplot of factor levels
admissions_mca %>%
  ggbiplot() +
  theme_bw() + theme_biplot() +
  geom_origin() +
  # geom_rows_count() +
  geom_cols_point(aes(shape = factor, size = mass)) +
  geom_cols_text_repel(aes(label = level), show.legend = FALSE) +
  scale_size_area(guide = "none") +
  labs(shape = "Factor level")

# column-principal biplot of factor levels
admissions_mca %>%
  confer_inertia("colprincipal") %>%
  ggbiplot() +
  theme_bw() + theme_biplot() +
  geom_origin() +
  # geom_rows_point(stat = "sum") +
  geom_cols_point(aes(shape = factor, size = mass)) +
  geom_cols_text_repel(aes(label = level), show.legend = FALSE) +
  scale_size_area(guide = "none") +
  labs(shape = "Factor level")
