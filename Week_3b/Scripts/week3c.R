#### Today we are going to plot penguin data ####
### Created by: Sally Heo ###
### Created on: 02-10-2022
###########################################################################################################################

#### Load libraries needed for code to run ####
library(palmerpenguins) # Loading the Palmer Penguins Data Set
library(tidyverse) #Load this before we do any data visualization or manipulation
library(here) # Load here
library(beyonce) # Load beyonce color palettes
library(ggthemes) # Load ggplot themes

#### Load Data ####
# The data is part of the package and is called penguins
# How else besides glimpse can we inspect data #
glimpse(penguins) # Without loading tidyverse, this function won't work

#### Data Analysis ####
#plot1<-ggplot(data=penguins, # Saving your plot as an object, allow to modify plot later
ggplot(data=penguins, # creating Penguin plot
       mapping = aes(x = bill_depth_mm, # x-axis is bill depth (mm)
                     y = bill_length_mm, # y-axis is bill length (mm)
                     group = species, # group by spcies
                     color = species)) + # Adding colors by species
       geom_point()+ # Geometry point (Visual object used to represent data)
       geom_smooth(method = "lm")+ # Helps seeing patterns when overplotting, lm = linear model
         labs(x = "Bill depth (mm)", # Adding x-axis title
              y = "Bill length (mm)" #Adding y-axis title
              ) +
  scale_color_manual(values = beyonce_palette(15)) +  # Manually change color, #scale_color_viridis_d(), or beyonce palette
  # coord_flip() # flip x and y axes
  # coord_polar("x") # make them polar
  # theme_classic() # Making it theme classic (With x and y axis lines and no gridlines)
  theme_bw() + # Make it theme_bw()
  theme(axis.title = element_text(size = 20, # changing the font size for the axis labels
                                  color = "red"), # change the colors of the axis labels
        panel.background = element_rect(fill = "linen")) # change background color to linen
  # coord_fixed() # fix axes
  # scale_x_continuous(breaks = c(14,17,21), # change x breaks
                     labels = c("low", "medium", "high")) # change x break labels
  # scale_y_continuous(limits = c(0,50)) # change y scale limits (0 to 50)

### change coordinates: Transform the x-axis and y-axis(log10) (Another data) ####
ggplot(diamonds, aes(carat,price)) + # Data for price vs carat log10
  geom_point() + # Adding a geometry point 
  coord_trans(x = "log10", y = "log10") # Transform x and y-axis to log10

ggsave(here("Week_3b","output", "penguin.png"), # Saving box plot to output folders in Week_3b in my personal repository
       width = 7, height = 5) # in inches

#########################################################################################################################


 
  

                     