% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/enrichment.R
\name{performLolaEnrichment.diffMeth}
\alias{performLolaEnrichment.diffMeth}
\title{performLolaEnrichment.diffMeth}
\usage{
performLolaEnrichment.diffMeth(
  rnbSet,
  diffmeth,
  lolaDbPaths,
  rank.cuts.region = c(100, 500, 1000),
  add.auto.rank.cut = TRUE,
  rerank = TRUE,
  verbose = TRUE
)
}
\arguments{
\item{rnbSet}{RnBSet object for which dirrential methylation was computed}

\item{diffmeth}{RnBDiffMeth object. See \code{\link{RnBDiffMeth-class}} for details.}

\item{lolaDbPaths}{LOLA database paths}

\item{rank.cuts.region}{Cutoffs for combined ranking that are used to determine differentially methylated regions}

\item{add.auto.rank.cut}{flag indicating whether an automatically computed cut-off should also be considered.}

\item{rerank}{For deterimining differential methylation: should the ranks be ranked again or should the absolute ranks be used.}

\item{verbose}{Enable for detailed status report}
}
\value{
a DiffMeth.lola.enrich object (S3) containing the following attributes
\item{region}{Enrichment information for differential methylation on the region level. A \code{data.table} object
as returned by the \code{runLOLA} function from the \code{LOLA} package for furthert details. Each element will contain different
user sets for different rank cutoffs and hyper/hypomethylation events(\code{userSet} column)}
\item{lolaDb}{The loaded \code{lolaDb} object containing the merged databases as returned by \code{\link{loadLolaDbs}}}
}
\description{
performs LOLA enrichment analysis for a given differential methylation table.
}
\examples{
\donttest{
library(RnBeads.hg19)
data(small.example.object)
logger.start(fname=NA)
# compute differential methylation
dm <- rnb.execute.computeDiffMeth(rnb.set.example,pheno.cols=c("Sample_Group","Treatment"))
# download LOLA DB
lolaDest <- tempfile()
dir.create(lolaDest)
lolaDirs <- downloadLolaDbs(lolaDest, dbs="LOLACore")
# perform enrichment analysis
res <- performLolaEnrichment.diffMeth(rnb.set.example,dm,lolaDirs[["hg19"]])
}
}
\author{
Fabian Mueller
}
