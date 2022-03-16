#### Today we are going to learn some advanced plotting ####
#### Created by: Sally Heo ####
#### Updated on: 2022-03-15 ####

#### Install new packages ####
install.packages("patchwork")#For bringing plots together
install.packages("ggrepel")#For repelling labels
install.packages("gganimate")#Animations
install.packages("magick") #For images

#### Load libraries needed to code ####
library(tidyverse)
library(here)
library(patchwork)
library(ggrepel)
library(gganimate)
library(magick)
library(palmerpenguins)

#### Patchwork ####
p1 <- penguins %>% 
  ggplot(aes(x = body_mass_g,
             y = bill_length_mm,
             color = species))+
  geom_point()
p1

p2 <- penguins %>% 
  ggplot(aes(x = sex,
             y = body_mass_g,
             color = species)) +
  geom_jitter(width = 0.2)
p2

p1+p2 +
  plot_layout(guides = 'collect')+
  plot_annotation(tag_levels = 'A')
p1/p2 +
  plot_layout(guides = 'collect')+
  plot_annotation(tag_levels = 'A')


View(mtcars)
