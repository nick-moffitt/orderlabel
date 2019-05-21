#### Executive Function ####
#' Auto change those pesky "Other please specify"s into "Other"
#'
#' Takes a dataframe (frequencies) and replaces the usual variations of "Other please specify" into Other. Converts all "None of the above" variations into "None of the above". Also removes all extra text in parantheses. Does this for both the 'label' and 'variable' vars.
#' @param dataset The name of the data frame that the mscharts pulls from, automatically included if function is piped in after running freqs. You almost never need any arguments in this function.
#' @param orders DEFAULT = ordered_df; First create an ordered dataframe called ordered_df using order_label. Your new dataframe crated by using order_same will have variables and groups in the same order as ordered_df
#' @keywords other none extra
#' @export
#' @examples
#' frequencies %>% order_same()
#

order_same <- function(
  dataset,
  orders = ordered_df
  ) {
  label_flag <- as_vector(orders$label) %>% levels()

  #run ordering functions
 if(any(names(orders) == 'group_var') == T) {
   dataset <- group_names(dataset)
   group_flag <- as_vector(orders$group_var) %>% levels()
   dataset <- grouped_vector(dataset, label_flag1 = label_flag, group_flag1 = group_flag)
 } else{ #NOT grouped
   dataset <- ungrouped_vector(dataset, label_flag1 = label_flag)
 }
}


#### ***** Hidden Functions ***** ####
#### group_names ####
group_names <- function(dataset){
  grouping_vars <- as.symbol(group_vars(dataset))
  grouping_vars_flag <- dplyr::enquo(grouping_vars)

  dataset <- dataset %>%
    mutate(
      group_var = !!grouping_vars_flag
    )
}

#### Grouped ####
grouped_vector <- function(
  dataset,
  label_flag1 = label_flag,
  group_flag1 = group_flag

){
  dataset %>%
    ungroup() %>%
    arrange(
      #first arrange by groups
      group_var = fct_relevel(
        group_var,
        group_flag1,
      ),
      #then arrange by labels, now in order of both
      label = fct_relevel(
        label,
        label_flag1
      )
    ) %>%
    mutate(
      label = fct_inorder(label)
    ) %>%
    mutate(
      group_var = fct_inorder(group_var)
    ) %>%
    mutate(
      percent_label =  str_c(result * 100)
    )
}

#### ungrouped ####
ungrouped_vector <- function(
  dataset,
  label_flag1 = label_flag
) {
  dataset %>%
    arrange(
      label = fct_relevel(
        label,
        label_flag1
      )
    ) %>%
    mutate(
      label = fct_inorder(label)
    ) %>% mutate(
      percent_label = str_c(result * 100)
    )
}

