## ggplot for Palmer Penguins (Introduction to ggplot)
## Created by: Sally Heo
## Created on: 02-08-22
## Last edited: 02-08-22
#############################################

### Load libraries needed for code to run ###
install.packages("palmerpenguins") # Data for Palmer Penguins
library(tidyverse) # Do this before we run any ggplot and before we start
library(here) # Do this every time and be sure you are in the line and click run
library(palmerpenguins) # Do this every time and make sure you are in the line and click run

### Function ###
glimpse(penguins) # Without loading tidyverse first, this function won't work 

### Data ### 
library(palmerpenguins) # Data: Palmer Penguins

#### Visualize Palmer Penguins Data with Mapping ####

ggplot(data=penguins, # Penguin Dataframe
       mapping = aes(x = bill_depth_mm, # Map bill_depth_mm on x-axis
                     y = bill_length_mm, # Map bill_length_mm on y-axis
                     color = species, # Mapping species to the color of each point
                     shape = species, 
                     size = body_mass_g,
                     alpha = flipper_length_mm)) + # Alpha (transparency)
  geom_point()+ # Represent each observation with a point (Each plot uses a different visual object to present the data)
  labs(title = "Bill depth and length", # Title of the plot
       subtitle ="Dimensions for Adelie, Chinstrap, and Gentoo Penguins", # Subtitle of the plot
      x = "Bill depth (mm)", y = "Bill length (mm)",# Labeling the x-axis and y-axis on the plot
      color = "Species", # Labeling the legend species
      caption = "Source: Palmer Station LTER / palmerpenguins package")+ # caption for the source of the data
  scale_color_viridis_d() # Adding a discrete color scale 


### Visualize data with Setting ###

ggplot(data=penguins, 
       mapping = aes(x = bill_depth_mm,
                     y = bill_length_mm)) + 
geom_point(size = 2, alpha = 0.5)

### Faceting ###
## Note: Make sure to always label your plots with proper titles and axis labels
ggplot(penguins,
       aes(x = bill_depth_mm,
           y = bill_length_mm,
           color = species,)) +
  geom_point()+
  scale_color_viridis_d()+
  facet_grid(species~sex)+ # ~ tilda; species as a function of sex
  guides(color = FALSE)
                     




