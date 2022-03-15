##### Week 4 Homework Practice with dplyr (Part 1) ####
##### Created by: Sally Heo ####
##### Updated on: 2022-02-15 ##########################

## Load libraries needed for code ####
library(palmerpenguins) # Load the Palmer Penguins data set
library(tidyverse) # Loading tidyverse
library(here) # Loading here

#### Load data ###
# The data is part of the package and is called penguins
glimpse(penguins) # Glimpse allows us to look at penguins data

#### Data analysis ### 

#### Part 1 ##########

data <- penguins %>% # Using the penguin dataframe
  drop_na(sex) %>% # Dropping rows with NAs from a specific column
  group_by(species, island, sex) %>% # Group by species, island, and sex
  summarise(mean_body_mass = mean(body_mass_g, na.rm =TRUE), # Calculating the mean of body mass
            variance_body_mass = var(body_mass_g, na.rm=TRUE)) # Calculating the variance of body mass
View(data) # Viewing the data of calculated mean, variance of body mass by species, island, sex without any NAs

#### Part 2 ###########

penguins %>% # Plot and using penguins dataframe
  filter(sex != "male") %>% # Filter out male penguins
  mutate(log_mass = log(body_mass_g)) %>% # Mutate: Adding a new column with log body_mass, and to calculate log body mass
  select(species, island, sex, log_mass) %>% # Select only the columns for species, island, sex, and log body mass
  ggplot(aes(x = species, # Making a plot using the data above, x-axis species
             y= log_mass, # y-axis is log_mass
             color = species, # Mapped to color for the species
             shape = island))+ # Mapped to a different variable than color, which in this case is island
  geom_point(position = position_jitterdodge()) + # Using point geometry with jitterdodge
  labs(title = "Log of Palmer Female Penguin Body Mass vs Species",  # Adding title for plot
       caption = "Source: Palmer Station LTER / palmerpenguins package", # Adding the source
       y = "Log of Body Mass (g)", # Changing label for y-axis
       x = "Species",# Changing label for x-axis
       color = "Species") + # Changing label for Species
  theme_bw() +# theme is black and white
  theme(title = element_text(size = 20, color = "darkorchid")) # Element_text() sets the font size, color, and face of the text elements like plot.title
 


ggsave(here("Week_4b","Outputs","Homework4lab.pdf"), # Save in Outputs Folder of Week4
       width = 7, height = 5)

