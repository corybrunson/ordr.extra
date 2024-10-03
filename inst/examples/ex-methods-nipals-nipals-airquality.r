# incomplete air quality measurements from New York
class(airquality)
head(airquality)

if (require(nipals)) {# {nipals}

# single date variable
airquality %>%
  transform(Date = as.Date(paste("1973", Month, Day, sep = "-"))) %>%
  subset(select = -c(Month, Day)) ->
  air_quality

# NIPALS on air quality measures
air_quality[, seq(4L)] %>%
  nipals_ord() %>%
  as_tbl_ord() %>%
  print() -> air_nipals
# bind dates to observation coordinates
air_nipals %>%
  cbind_rows(air_quality[, 5L, drop = FALSE]) %>%
  mutate_rows(missingness = apply(is.na(air_quality[, 1:4]), 1L, any)) ->
  air_nipals

# by default, no inertia is conferred
get_conference(air_nipals)
# recover observation and measurement standard coordinates
head(get_rows(air_nipals))
get_cols(air_nipals)

# augment measurements with names and scaling parameters
augment_ord(air_nipals)
# row-principal biplot with monthly ellipses
air_nipals %>%
  augment_ord() %>%
  confer_inertia("rows") %>%
  ggbiplot() +
  theme_bw() +
  geom_cols_vector(color = "#444444") +
  geom_cols_text_radiate(aes(label = name), color = "#444444") +
  stat_rows_ellipse(aes(color = format(Date, "%b"))) +
  geom_rows_point(aes(color = format(Date, "%b")), size = 1, alpha = .5) +
  geom_rows_point(aes(shape = missingness), size = 3) +
  scale_shape_manual(values = c(`TRUE` = 1L, `FALSE` = NA)) +
  ggtitle("Row-principal PCA biplot of 1973 air quality measurements") +
  labs(color = "Month")

}# {nipals}
