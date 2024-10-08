% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods-pma-cca.r
\name{methods-pma-cca}
\alias{methods-pma-cca}
\alias{as_tbl_ord.CCA}
\alias{recover_coord.CCA}
\alias{recover_rows.CCA}
\alias{recover_cols.CCA}
\alias{recover_inertia.CCA}
\alias{recover_conference.CCA}
\alias{recover_aug_rows.CCA}
\alias{recover_aug_cols.CCA}
\alias{recover_aug_coord.CCA}
\title{Functionality for penalized multivariate analysis ('CCA') objects}
\usage{
\method{as_tbl_ord}{CCA}(x)

\method{recover_coord}{CCA}(x)

\method{recover_rows}{CCA}(x)

\method{recover_cols}{CCA}(x)

\method{recover_inertia}{CCA}(x)

\method{recover_conference}{CCA}(x)

\method{recover_aug_rows}{CCA}(x)

\method{recover_aug_cols}{CCA}(x)

\method{recover_aug_coord}{CCA}(x)
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
objects of class 'CCA' from the \strong{\link[PMA:PMA-package]{PMA}} package.
}
\note{
The methods for class 'CCA' produce the biplot of Greenacre (1984),
which are advised against by ter Braak (1990).
}
\section{{Penalized matrix decomposition}}{


Witten, Tibshirani, and Hastie (2009) provide a theoretical basis and
computational algorithm for penalized matrix decomposition that specializes
to sparse PCA and to sparse CCA. Their R package \strong{PMA} implements these
specializations as well as one to sparse multiple CCA.
}

\examples{
# data frame of life-cycle savings across countries
class(LifeCycleSavings)
head(LifeCycleSavings)

if (require(PMA)) {# {PMA}

# canonical correlation analysis of age distributions and financial factors
savings_cca <- PMA::CCA(
  LifeCycleSavings[, c(2L, 3L)],
  LifeCycleSavings[, c(1L, 4L, 5L)],
  K = 2L, penaltyx = .7, penaltyz = .7,
  xnames = names(LifeCycleSavings)[c(2L, 3L)],
  znames = names(LifeCycleSavings)[c(1L, 4L, 5L)],
  # prevent errors
  typex = "standard", typez = "standard"
)

# wrap as a 'tbl_ord' object
(savings_cca <- as_tbl_ord(savings_cca))

# recover canonical variates
get_rows(savings_cca)
get_cols(savings_cca)

# augment canonical variates with variable names
(savings_cca <- augment_ord(savings_cca))

# column-standard biplot of non-zero canonical variates
nz_rows <- which(apply(recover_rows(savings_cca) != 0, 1L, any))
nz_cols <- which(apply(recover_cols(savings_cca) != 0, 1L, any))
savings_cca \%>\%
  confer_inertia("rows") \%>\%
  ggbiplot(aes(label = name, color = .matrix)) +
  theme_bw() +
  geom_origin() +
  geom_unit_circle(linetype = "dotted") +
  geom_cols_vector(subset = nz_cols) +
  geom_cols_text_radiate(subset = nz_cols) +
  geom_rows_point(subset = nz_rows) +
  geom_rows_text_repel(subset = nz_rows) +
  expand_limits(x = c(-1, 1), y = c(-1, 1))

}# {PMA}
}
\references{
Witten DM, Tibshirani R, & Hastie T (2009) "A penalized matrix decomposition,
with applications to sparse principal components and canonical correlation
analysis". \emph{Biostatistics} \strong{10}(3): 515--534.
\doi{10.1093/biostatistics/kxp008}

Greenacre MJ (1984) \emph{Theory and applications of correspondence analysis}.
London: Academic Press, ISBN 0-12-299050-1.
\url{http://www.carme-n.org/?sec=books5}

ter Braak CJF (1990) "Interpreting canonical correlation analysis through
biplots of structure correlations and weights". \emph{Psychometrika} 55(3),
519--531. \doi{10.1007/BF02294765}
}
\seealso{
Other methods for singular value decomposition-based techniques: 
\code{\link{methods-ade4}},
\code{\link{methods-ca-ca}},
\code{\link{methods-ca-mjca}},
\code{\link{methods-candisc-cancor}},
\code{\link{methods-lpca}},
\code{\link{methods-nipals-empca}},
\code{\link{methods-nipals-nipals}},
\code{\link{methods-pma-spc}}

Other models from the \strong{PMA} package: 
\code{\link{methods-pma-spc}}
}
\concept{methods for singular value decomposition-based techniques}
\concept{models from the \strong{PMA} package}
