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
air_empca <-
  ordinate(x = air_quality, model = empca_ord, cols = 1:4, w = rand_wts)

# compare original and fitted data
head(air_quality)
{ get_rows(air_empca) %*%
    diag(get_inertia(air_empca)) %*%
    t(get_cols(air_empca)) } %>%
  sweep(2L, air_empca$scale, "*") %>%
  sweep(2L, air_empca$center, "+") %>%
  head()
