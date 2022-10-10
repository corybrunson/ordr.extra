# CA of hair & eye color data
ordinate(apply(HairEyeColor, seq(2L), sum), ca::ca)

# MCA of hair & eye color data, stratified by sex
ordinate(HairEyeColor, ca::mjca)

# NIPALS of air quality data
ordinate(airquality, ~ ade4::nipals(.), cols = seq(4L))
ordinate(airquality, cols = c("Ozone", "Solar.R", "Wind", "Temp"), ade4::nipals)

# sparse CCA of savings data
ordinate(
  x = LifeCycleSavings[, c(2L, 3L)],
  z = LifeCycleSavings[, c(1L, 4L, 5L)],
  model = PMA::CCA, K = 2L, penaltyx = .5, penaltyz = .5
)

# lSVD of finches data
data(finches, package = "cooccur")
ordinate(finches, logisticSVD_ord)
