if (require()) {# {ca}
# CA of hair & eye color data
ordinate(apply(HairEyeColor, seq(2L), sum), ca::ca)
}# {ca}

if (require()) {# {ca}
# MCA of hair & eye color data, stratified by sex
ordinate(HairEyeColor, ca::mjca)
}# {ca}

if (require(ade4)) {# {ade4}
# NIPALS of air quality data
ordinate(airquality, ~ ade4::nipals(.), cols = seq(4L))
ordinate(airquality, cols = c("Ozone", "Solar.R", "Wind", "Temp"), ade4::nipals)
}# {ade4}

if (require(PMA)) {# {PMA}
# sparse CCA of savings data
ordinate(
  x = LifeCycleSavings[, c(2L, 3L)],
  z = LifeCycleSavings[, c(1L, 4L, 5L)],
  model = PMA::CCA, K = 2L, penaltyx = .5, penaltyz = .5,
  # prevent errors
  typex = "standard", typez = "standard"
)
}# {PMA}

if (require(logisticPCA) && require(cooccur)) {# {logisticPCA}
# lSVD of finches data
data(finches, package = "cooccur")
ordinate(finches, logisticSVD_ord)
}# {logisticPCA}
