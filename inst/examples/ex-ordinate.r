# CA of hair & eye color data
haireye <- as.data.frame(rowSums(HairEyeColor, dims = 2L))
ordinate(haireye, cols = everything(), model = ca::ca, augment = everything())
# lSVD of finches data
data(finches, package = "cooccur")
ordinate(finches, everything(), logisticSVD_ord)
