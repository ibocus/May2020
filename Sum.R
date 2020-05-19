library(tidyverse)
nuclear_accidents <- read_csv("https://query.data.world/s/47s7katrhxxd674ulus425k42l5u4s") 
nuclear_accidents <- nuclear_accidents %>% 
  select(-Description) %>% 
  mutate(Year = Date %>% mdy() %>% year(), In_Europe = if_else(Region %in% c("EE", "WE"), T, F) %>% as.factor()) %>% 
  filter(Year %>% between(1989, 2016))

