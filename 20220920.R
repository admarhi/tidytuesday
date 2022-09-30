library(tidytuesdayR)
library(ggplot2)
library(dplyr)
library(tidyr)

tt_data <- tt_load("2022-09-20")
readme(tt_data)
HydroWASTE_v10 <- tt_data$HydroWASTE_v10

str(HydroWASTE_v10)

x <- HydroWASTE_v10 %>%
  dplyr::select(c(POP_SERVED, COUNTRY, QUAL_WASTE)) %>%
  arrange(QUAL_WASTE) %>%
  filter(POP_SERVED < 500000 & POP_SERVED > 400000) %>%
  group_by(COUNTRY) %>%
  filter(length(POP_SERVED) > 10)
x
x %>%
  ggplot(aes(POP_SERVED, COUNTRY)) + 
  geom_jitter(alpha = 0.5, aes(color = "QUAL_WASTE")) +
  geom_violin(alpha = 0) +
  theme(axis.text.y = element_text(size = 8))

y <- 
  HydroWASTE_v10 %>%
  
  
