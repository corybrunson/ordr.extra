# data frame of life-cycle savings across countries
class(LifeCycleSavings)
head(LifeCycleSavings)
# canonical correlation analysis of age distributions and financial factors
savings_cancor <- candisc::cancor(
  LifeCycleSavings[, c("pop15", "pop75")],
  LifeCycleSavings[, c("sr", "dpi", "ddpi")]
)

# wrap as a 'tbl_ord' object
(savings_cancor <- as_tbl_ord(savings_cancor))
# recover canonical weights
get_rows(savings_cancor, elements = "active")
get_cols(savings_cancor, elements = "active")
head(get_rows(savings_cancor, elements = "supplementary"))
head(get_cols(savings_cancor, elements = "supplementary"))
# augment canonical weights with row names and centers
(savings_cancor <- augment_ord(savings_cancor))

# column-standard biplot of structure correlations
# (intraset correlations of first set, interset correlations with second set)
savings_cancor %>%
  confer_inertia("columns") %>%
  ggbiplot(aes(label = name)) +
  geom_unit_circle() +
  geom_rows_vector(elements = "structure") +
  geom_rows_text_radiate(elements = "structure") +
  geom_cols_point(elements = "structure", color = "forestgreen") +
  geom_cols_text_repel(elements = "structure", color = "forestgreen") +
  expand_limits(x = c(-1, 1), y = c(-1, 1))
