# incomplete air quality measurements from New York
class(airquality)
head(airquality)

# NIPALS on air quality measures
airquality[, seq(4L)] %>%
  ade4::nipals(nf = 3L) %>%
  as_tbl_ord() %>%
  print() -> air_nipals
# bind dates and missingness flags to observation coordinates
air_nipals %>%
  cbind_rows(airquality[, 5L, drop = FALSE]) %>%
  mutate_rows(
    Month = factor(month.abb[Month], levels = month.abb),
    Missingness = apply(is.na(airquality[, 1:4]), 1L, any)
  ) ->
  air_nipals

# by default, inertia is conferred to rows
get_conference(air_nipals)
# recover observation principal coordinates and measurement standard coordinates
head(get_rows(air_nipals))
get_cols(air_nipals)
# recover inertia in each dimension
get_inertia(air_nipals)

# augment measurements with names and scaling parameters
augment_ord(air_nipals)
# row-principal biplot with monthly ellipses
air_nipals %>%
  augment_ord() %>%
  ggbiplot() +
  theme_bw() +
  geom_cols_vector(color = "#444444") +
  geom_cols_text_radiate(aes(label = name), color = "#444444") +
  stat_rows_ellipse(aes(color = Month)) +
  geom_rows_point(aes(color = Month), size = 1, alpha = .5) +
  geom_rows_point(aes(shape = Missingness), size = 3) +
  scale_shape_manual(values = c(`TRUE` = 1L, `FALSE` = NA)) +
  ggtitle("Row-principal PCA biplot of 1973 air quality measurements")
