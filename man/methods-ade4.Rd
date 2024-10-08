% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods-ade4-nipals.r
\name{methods-ade4}
\alias{methods-ade4}
\alias{as_tbl_ord.nipals}
\alias{recover_rows.nipals}
\alias{recover_cols.nipals}
\alias{recover_inertia.nipals}
\alias{recover_coord.nipals}
\alias{recover_conference.nipals}
\alias{recover_aug_rows.nipals}
\alias{recover_aug_cols.nipals}
\alias{recover_aug_coord.nipals}
\title{Functionality for non-linear iterative PLS ('nipals') objects}
\usage{
\method{as_tbl_ord}{nipals}(x)

\method{recover_rows}{nipals}(x)

\method{recover_cols}{nipals}(x)

\method{recover_inertia}{nipals}(x)

\method{recover_coord}{nipals}(x)

\method{recover_conference}{nipals}(x)

\method{recover_aug_rows}{nipals}(x)

\method{recover_aug_cols}{nipals}(x)

\method{recover_aug_coord}{nipals}(x)
}
\arguments{
\item{x}{An ordination object.}
}
\value{
The recovery generics \verb{recover_*()} return \link[=recoverers]{core model components}, \link[=conference]{distribution of inertia},
\link[=supplementation]{supplementary elements}, and \link[=augmentation]{intrinsic metadata}; but they require methods for each model class to
tell them what these components are.

The generic \code{\link[=as_tbl_ord]{as_tbl_ord()}} returns its input wrapped in the 'tbl_ord'
class. Its methods determine what model classes it is allowed to wrap. It
then provides 'tbl_ord' methods with access to the recoverers and hence to
the model components.
}
\description{
These methods extract data from, and attribute new data to,
objects of class \code{"nipals"} as returned by \code{\link[ade4:nipals]{ade4::nipals()}}.
}
\examples{
# incomplete air quality measurements from New York
class(airquality)
head(airquality)

if (require(ade4)) {# {ade4}

# NIPALS on air quality measures
airquality[, seq(4L)] \%>\%
  ade4::nipals(nf = 3L) \%>\%
  as_tbl_ord() \%>\%
  print() -> air_nipals
# bind dates and missingness flags to observation coordinates
air_nipals \%>\%
  cbind_rows(airquality[, 5L, drop = FALSE]) \%>\%
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
air_nipals \%>\%
  augment_ord() \%>\%
  ggbiplot() +
  theme_bw() +
  geom_cols_vector(color = "#444444") +
  geom_cols_text_radiate(aes(label = name), color = "#444444") +
  stat_rows_ellipse(aes(color = Month)) +
  geom_rows_point(aes(color = Month), size = 1, alpha = .5) +
  geom_rows_point(aes(shape = Missingness), size = 3) +
  scale_shape_manual(values = c(`TRUE` = 1L, `FALSE` = NA)) +
  ggtitle("Row-principal PCA biplot of 1973 air quality measurements")

}# {ade4}
}
\seealso{
Other methods for singular value decomposition-based techniques: 
\code{\link{methods-ca-ca}},
\code{\link{methods-ca-mjca}},
\code{\link{methods-candisc-cancor}},
\code{\link{methods-lpca}},
\code{\link{methods-nipals-empca}},
\code{\link{methods-nipals-nipals}},
\code{\link{methods-pma-cca}},
\code{\link{methods-pma-spc}}
}
\concept{methods for singular value decomposition-based techniques}
