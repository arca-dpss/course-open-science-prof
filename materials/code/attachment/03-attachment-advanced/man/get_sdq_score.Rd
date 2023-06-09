% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data-utils.R
\name{get_sdq_score}
\alias{get_sdq_score}
\title{Compute the SDQ Score}
\usage{
get_sdq_score(raw_data, outcome = c("ext", "int"))
}
\arguments{
\item{raw_data}{a tibble object with the \code{"data/data.csv"}.}

\item{outcome}{character value indicating whether to compute externalizing
(\code{"ext"}) or internalizing scores (\code{"int"})}
}
\value{
a numeric vector with the total externalizing or internalizing score
for each children
}
\description{
Given the raw data, compute the externalizing or internalizing scores score
for each children.
}
\details{
\itemize{
\item \strong{Internalizing} = 3, 6, 8, 11, 13, 14, 16, 19, 23, 24
\item \strong{Externalizing} = 2, 5, 7, 10, 12, 15, 18, 21, 22, 25
}

The total score is given by the sum of the scale items. Higher scores
indicate more problems.

To construct the final score it is necessary to invert the scores of items 7,
11, 14, 21, 25. That is: 0-->2; 1-->1; 2-->0
}
\examples{
targets::tar_load(raw_data)
get_sdq_score(raw_data, outcome = "ext")

}
