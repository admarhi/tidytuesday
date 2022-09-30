library(tidytuesdayR)
library(ggplot2)
library(dplyr)
library(tidyr)

tt_data <- tt_load("2022-09-13")
readme(tt_data)
bigfoot <- tt_data$bigfoot
str(bigfoot)

bigfoot <- bigfoot %>% 
  mutate(year = format(date, format="%Y"))

bigfoot_sights <- bigfoot %>%
  group_by(state, year) %>%
  summarize(sightings = n()) %>%
  ungroup() %>%
  filter(sightings > 5) 

ggplot(bigfoot_sights, aes(year, sightings)) +
  geom_line(aes(group = "state"))
ggplot(bigfoot, aes(date)) +
  geom_histogram()
