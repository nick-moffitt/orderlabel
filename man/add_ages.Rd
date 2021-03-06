% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add_ages.R
\name{add_ages}
\alias{add_ages}
\title{Add age and census age groups to a data frame}
\usage{
add_ages(dataset, year_born_var, age_var)
}
\arguments{
\item{dataset}{The name of the data frame for the function to modify, usually piped into your main data frame.}

\item{year_born_var}{NO DFAULT; You may either provide a year_born_var or an age_var, not both}

\item{age_var}{NO DFAULT}
}
\description{
Takes a data frame with a year born variable or age variable and creates four new variables:
}
\details{
1. year_born_numeric
2. age_numeric
3. census_age_groups
4. census_age_groups_6 (same as census_age_groups, but with split 18-34 into 18-24 & 25-34)
}
\examples{
responses <- tibble::tibble(
  year_born = c(
  2000,
  2001
  ),
  age = c(
  20,
  19
  )
)

add_ages(responses, year_born_var = year_born)
add_ages(responses, age_var = age)
}
