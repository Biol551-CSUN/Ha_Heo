#### Week 3 Homework Script 2 - Working with Palmer Penguins Data for data visualization practice ####
#### Created by: Sally Heo ####
#### Created on: 02-11-2022 ####
#################################################################################################################

#### Load Libraries needed for code to run ####
library(tidyverse) # Loading tidyverse (Do this before we start any data visualization)
library(palmerpenguins) # Loading the Palmer Penguins data set
library(here) # Loading here
library(beyonce) # Loading Beyonce color palettes 

### Load data ####
# The data is part of the Palmer Penguins package 

#### Data Analysis ####
penguins %>%
  drop_na(sex, body_mass_g) %>% # Dropping NA values from sex and body mass columns
ggplot(mapping = aes(x = sex, # x-axis is sex
                     y = body_mass_g, # y-axis is body mass (g)
                     color = sex)) + # giving color to box plots based on sex
  geom_boxplot() + # Making geometry point, box plot
  facet_wrap(~species)+ # sectioning for species (smaller plots that display different subsets of the data)
  labs(title = "Body Mass (g) vs Sex", # Adding title for Palmer Penguin box plot
       subtitle = "Body Mass by Sex for Adelie, Chinstrap, and Gentroo Penguins", # Adding subtitle 
       y = "Body mass(g)", # changing axes titles (x-axis)
       x = "Sex", # changing axes titles (y-axis)
       caption = "Source: Palmer Station LTER / palmerpenguins package",) + # Adding caption for the source used for data
  theme(title = element_text(size = 18, color = "dodgerblue")) + # changing title color to dodgerblue
  guides(color = FALSE) # Removing color legend
ggsave(here("Week_3b", "Output", "penguinlab.png"), # saving box plot to Week3b Output folder 
       width = 7, height = 5) # in inches

#####################################################################################################################
  