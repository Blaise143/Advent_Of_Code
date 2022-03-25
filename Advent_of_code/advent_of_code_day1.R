library(tidyverse)

# PART 1
#A function that takes in a vector of inputs and outputs logistic vector
# of whether or not the depth mesurement increased
get_next <- function(some_list){
  some_list > lag(some_list)
}

data <- Advent_day_1

## Getting the Number of depth increases
data %>% 
  mutate(is_greater = get_next(data) %>% as.data.frame()) %>%
  filter(is_greater==TRUE | is_greater== FALSE) %>% 
  pull(is_greater) %>% as_tibble() %>% sum()

##For today's challenge, the output was 1681
# PART 2
data %>% 
  select(V1) %>% 
  summarize(diff=diff(V1,lag=3)>0) %>% 
  filter(diff) %>% nrow()
