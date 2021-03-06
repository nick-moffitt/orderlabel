% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add_regions.R
\name{add_regions}
\alias{add_regions}
\title{Add a "census_region" variable based on states}
\usage{
add_regions(dataset, state_var, new_name = census_region)
}
\arguments{
\item{dataset}{The name of the data frame for the function to modify, usually piped into your main data frame.}

\item{state_var}{NO DEFAULT; The state variable on which census regions will be based. Can be state name or state abbreviations}

\item{new_name}{DEFAULT = census_region; the name for your new census region variable, as an object not a "string"}
}
\description{
Takes a data frame with a state variable and uses those states to categorize US census regions
}
\examples{
responses <- tibble::tibble(
  state = c(
  'Virginia',
  'UTAH',
  'New York',
  'alaska',
  'Washington DC'
  )
)

add_regions(responses, state_var = state)
}
