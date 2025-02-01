# data frame of Swiss fertility and socioeconomic indicators
class(swiss)
head(swiss)
# perform factor analysis
swiss_fa <- psych::fa(r = swiss, nfactors = 2L, rotate = "varimax", scores = "regression", 
               fm = "ml")

# wrap as a 'tbl_ord' object
(swiss_fa <- as_tbl_ord(swiss_fa))

# recover loadings
get_cols(swiss_fa, elements = "active")
# recover scores
head(get_rows(swiss_fa, elements = "score"))

# augment column loadings with uniquenesses
(swiss_fa <- augment_ord(swiss_fa))
