library(tidyverse)
library(readr)
rating_raw_data<- read_csv(file.choose())
rating_raw_data
glimpse(rating_raw_data)
cleaned_rating_data<- rating_raw_data %>% distinct() %>%
  mutate(
    userId = as.integer(userId),
    movieId = as.integer(movieId),
    rating = as.integer(rating)
  ) %>% filter(userId > 0 & movieId > 0 & rating > 0 )
cleaned_rating_data

tags_raw_data <- read_csv(file.choose())
tags_raw_data                        
glimpse(tags_raw_data)
cleaned_tags_data<- tags_raw_data %>% distinct() %>%
  mutate(
    userId = as.integer(userId),
    movieId = as.integer(movieId),
    
  ) %>% filter(userId > 0 & movieId > 0 ) %>%
  group_by(movieId) %>%
  summarise(
    Total_Tags = n(),
    .groups = 'drop'
  )
cleaned_tags_data

join_report<- cleaned_rating_data %>%
  inner_join(cleaned_tags_data,by='movieId')
join_report
final_report<- join_report %>% distinct() %>%
  select(userId,movieId,rating,Total_Tags)
final_report
write.csv(final_report,
          'New_dataset_movielens_32M_data_joining_pieline_data.csv',
          row.names = FALSE)
getwd()
