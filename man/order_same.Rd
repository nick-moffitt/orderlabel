% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/order_same.R
\name{order_same}
\alias{order_same}
\title{Auto order a freqs table to match another freqs table}
\usage{
order_same(dataset, orders = ordered_df, group_var = "NULL")
}
\arguments{
\item{dataset}{The name of the data frame for the function to modify, usually piped in after running freqs}

\item{orders}{DEFAULT = ordered_df; First create an ordered dataframe called ordered_df using order_label. Your new dataframe created using order_same will have variables and groups in the same order as ordered_df}

\item{group_var}{DEFAULT = 'NULL'. Leave as default if there is no grouping variable or if the grouping variable is valled "group_var". Otherwise, specify the group_var here in quotes}
}
\description{
Takes a dataframe (frequencies) and orders it in the same order as another frequencies table in your R environment called "ordered_df".
}
\examples{
# The original frequencies, put in descending order of the result
frequencies <- tibble::tibble(
  label = c('Brand 1', 'Brand 2', 'Brand 3', 'Brand 4', 'Brand 5'),
  result = c(.25, .15, .20, .10, .30),
  value = c(1, 2, 3, 4, 5),
  group_var = rep('Group A', 5)
) \%>\% order_label()
ordered_df <- frequencies

# The second frequencies that you want to be ordered the same as the original
frequencies <- tibble::tibble(
  label = c('Brand 1', 'Brand 2', 'Brand 3', 'Brand 4', 'Brand 5'),
  result = c(.30, .10, .15, .20, .25),
  value = c(1, 2, 3, 4, 5),
  group_var = rep('Group B', 5)
) \%>\% order_same()
}
\keyword{equal}
\keyword{label}
\keyword{order}
\keyword{same}
