% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/volcanoPlot.R
\name{volcanoPlot}
\alias{volcanoPlot}
\title{Volcano plot.}
\usage{
volcanoPlot(pval, lfc, sig, alpha = 0.05, pointcols = c(rgb(1, 0, 0, 0.5),
  rgb(0, 0, 0, 0.5)), pchs = c(19, 19), cex = c(0.5, 0.5),
  legpos = "topright", leginset = c(-0.25, 0), ylab = "-log10 P-value",
  xlab = "log2 Fold Change", ...)
}
\arguments{
\item{pval}{A vector of p-values}

\item{lfc}{A vector of log-2 fold change (or similar data)}

\item{sig}{Either a 0/1 binary vector of significance, or a
vector of transformed p-values}

\item{alpha}{If providing a vector of transformed p-values,
this specifies the threshold for siginficance. Otherwise, not used.}

\item{pointcols}{Vector of legnth 2. The first element indicates
the color of significant points and the second the non sigificant points}

\item{pchs}{Follows pointcols for point shapes}

\item{cex}{Follows pointcols for point sizes}

\item{legpos}{The position of the legend. Defaults to topright}

\item{leginset}{How much the legend should be inset - defaults to just
outside the plotting window.}

\item{ylab}{The label for the y axis}

\item{xlab}{The label for the x axis}

\item{...}{additional arguments passed on to plot}
}
\value{
a table with the number and direction of significance
}
\description{
\code{volcanoPlot} Make an expression volcano plot
from log2-fold change and p-value data
}
\details{
Using base R graphics, this function tabulates
the number of significant values and plots
}
\examples{
\dontrun{
data(kidney) #from the simseq package
counts<-kidney$counts
counts<-counts[sample(1:nrow(counts),1000),]
info<-data.frame(rep=kidney$replic, treatment=kidney$treatment)
stats<-pipeLIMMA(counts=counts, info=info,
                 formula = " ~ treatment",
                 block=NULL,
                 getTopTable=T,
                 getEbayes=T)
stats<-stats$stats
volcanoPlot(pval=stats$ebayesPvalue_treatmentTumor,
            lfc=stats$treatmentTumor_logFC,
            sig=stats$ebayesQvalue_treatmentTumor,
            alpha=0.0005, pointcols=c("blue","grey"), pchs=c(4,6))
}
}

