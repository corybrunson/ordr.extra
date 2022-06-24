# lSVD of finches data
data(finches, package = "cooccur")
ordinate(finches, everything(), logisticSVD_ord)
