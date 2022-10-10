# incomplete air quality measurements from New York
class(airquality)
head(airquality)
# single date variable
airquality %>%
  transform(Date = as.Date(paste("1973", Month, Day, sep = "-"))) %>%
  subset(select = -c(Month, Day)) ->
  air_quality
# random weights
rand_wts <- matrix(nrow = nrow(air_quality), ncol = ncol(air_quality) - 1L)
rand_wts[] <- runif(n = prod(dim(rand_wts)))

# EMPCA on weighted air quality measures
air_empca <- empca_ord(x = air_quality[, seq(4L)], w = rand_wts)
# augmented tbl_ord
augment_ord(as_tbl_ord(air_empca))
