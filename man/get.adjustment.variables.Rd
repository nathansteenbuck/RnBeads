% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/differentialMethylation.R
\name{get.adjustment.variables}
\alias{get.adjustment.variables}
\title{get.adjustment.variables}
\usage{
get.adjustment.variables(
  rnbSet,
  inds.g1,
  inds.g2 = -inds.g1,
  colnames.adj = c(),
  colname.target = "",
  adjust.sva = FALSE,
  adjust.celltype = FALSE
)
}
\arguments{
\item{rnbSet}{RnBSet object}

\item{inds.g1}{sample indices in \code{rnbSet} of group 1 members}

\item{inds.g2}{sample indices in \code{rnbSet} of group 2 members}

\item{colnames.adj}{column names in \code{pheno(rnbSet)} to retrieve}

\item{colname.target}{column names in \code{pheno(rnbSet)} of the target variable. Only important if \code{adjust.sva==TRUE}}

\item{adjust.sva}{flag indicating whether the resulting table should also contain surrogate variables (SVs) for the given target variable.}

\item{adjust.celltype}{flag indicating whether the resulting table should also contain estimated celltype contributions.
See \code{\link{rnb.execute.ct.estimation}} for details.}
}
\value{
a \code{data.frame} containing one column for each selected variable from the phenotypic data
        each row corresponds to a sample in the union of samples of the wto groups with the first
        \code{length(inds.g1)} rows corresponding to group 1 and the remaining rows corresponding to group 2
}
\description{
Given indices for two groups of samples for comparison, this function
retrieves \code{data.frame} containing the variables to be adjusted for
}
\examples{
\donttest{
library(RnBeads.hg19)
data(small.example.object)
logger.start(fname=NA)
sample.groups <- rnb.sample.groups(rnb.set.example)[[1]]
get.adjustment.variables(rnb.set.example,sample.groups[[1]],sample.groups[[2]],"Cell_Line")
}
}
\author{
Fabian Mueller
}
