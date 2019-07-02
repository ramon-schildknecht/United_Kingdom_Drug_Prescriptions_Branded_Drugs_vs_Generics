library(tidyverse)
d <- read_csv("med_list.csv")
glimpse(d)
drugs_unique <- d %>% 
  select(drug_dressing_appliances_branded) %>% 
  distinct() %>% 
  arrange(drug_dressing_appliances_branded)

generics_unique <- d %>% 
  select(drug_dressing_appliances_generic) %>% 
  distinct() %>% 
  arrange(drug_dressing_appliances_generic)

nic_per_item_branded_input <- d %>% select(nic_per_item_branded) %>% 
  distinct() %>% arrange(nic_per_item_branded)

nic_per_item_generics_input <- d %>% select(nic_per_item_generic) %>% 
  distinct() %>% arrange(nic_per_item_generic) %>% na.omit()
# nic_per_item_generics_input <- (nic_per_item_generics_input$nic_per_item_generic)

variable_names <- names(d)
variable_names_reduced <- variable_names[-c(2, 11, 8, 18)]
  
############ Testing ############
# d %>% filter(between(nic_per_item_branded, 1, 2))
