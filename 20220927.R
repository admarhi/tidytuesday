library(tidytuesdayR)
library(tidyverse)



tt_data <- tt_load("2022-09-27")

readme(tt_data)
artists <- tt_data$artists
str(artists)

artists
unique(artists$race)
unique(artists$type)

ggplot(artists, aes(race, type, 
                    size = location_quotient, 
                    fill = location_quotient))+
  geom_point()


artists %>% 
  filter(state == "Alabama") %>%
  group_by(type) %>%
  summarize(location_quotient = sum(location_quotient, na.rm = T)) %>%
  ggplot(aes(location_quotient, type)) +
  geom_point()

artists %>%
    ggplot(aes(race, type)) +
      geom_jitter(alpha = 0.3)

length(artists$race)

workers_race_state <- artists %>%
  group_by(state, race) %>%
  summarize(total_workers = sum(all_workers_n))

ggplot(workers_race_state, aes(race, total_workers, color = state)) +
  geom_point()

type_race <- artists %>% 
  group_by(race, type) %>%
  summarize(total = sum(all_workers_n))

ggplot(type_race, aes(race, total)) +
  geom_line(group = "type")

str(artists)

x <- artists %>% 
  group_by(race, type) %>%
  summarize(total = artists_n,
            state = state)
  
ggplot(x, aes(race, total, color = type)) +
  geom_jitter()

artists %>%
  filter(artists_share == min(artists_share,na.rm = T))

artists %>% filter(artists_n == min(artists_n, na.rm = T))
artists %>% filter(artists_n == max(artists_n, na.rm = T))
