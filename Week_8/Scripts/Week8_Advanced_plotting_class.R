#### Today we are going to learn some advanced plotting ####
#### Created by: Sally Heo ####
#### Updated on: 2022-03-15 ####

#### Install new packages ####
install.packages("patchwork")#For bringing plots together
install.packages("ggrepel")#For repelling labels
install.packages("gganimate")#Animations
install.packages("magick") #For images==

#### Load libraries needed to code ####
library(tidyverse) #Load tidyverse
library(here) #Load here
library(patchwork)#Load patchwork
library(ggrepel) #Load ggrepel
library(gganimate) #Load gganimate
library(magick) #Load magick
library(palmerpenguins) #Load Palmerpenguins

#### Patchwork ####
#### Let's start with two simple plots from the Palmer Penguins dataset ####
#### Plot 1 ####
p1 <- penguins %>% #Giving object p1 from penguins dataframe
  ggplot(aes(x = body_mass_g,#Plot x-axis as body_mass_g
             y = bill_length_mm,#Plot y-axis as bill_length_mm
             color = species))+ #Give color to the species
  geom_point() #Assigning geometry geom point
p1
#### Plot 2 ####
p2 <- penguins %>% #Giving object p2 from penguins dataframe
  ggplot(aes(x = sex,#Plot x-axis as sex
             y = body_mass_g,#Plot y-axis as body_mass_g
             color = species)) + #Give color to the species
  geom_jitter(width = 0.2) #Assigning geometry geom jitter
p2
p1+p2 + #Bring the plots together using simple operations
  plot_layout(guides = 'collect') + #Group the legends
  plot_annotation(tag_levels = 'A')#Add labels (A,B)
p1/p2 + #Put one plot on top of the other
  plot_layout(guides = 'collect')+ #Group the legend into one
  plot_annotation(tag_levels = 'A') #Add labels (A,B)

#### gganimate ####
penguins %>% #Static penguin plot
  ggplot(aes(x = body_mass_g, #Plot x-axis as body_mass_g
             y = bill_depth_mm, #Plot y-axis as bill_depth_mm
             color = species)) + #Give color to the species
  geom_point() +#Assign geometry point
  transition_states(
    year,# what are we animating by
    transition_length = 2, # The relative length of the transition
    state_length = 1 # The length of the pause between transitions
  )+
  ease_aes("bounce-in-out") + #change the ease aesthetics
  ggtitle('Year: {cloest_state}') + #Add a transition title
  anim_save(here("Week_8", "Output", "mypenguingif.gif")) #Save it as a gif

#### Magick ####
#### Put a penguin in it ####
penguin <- image_read("https://pngimg.com/uploads/penguin/pinguin_PNG9.png")#Read in an image of a penguin - can be on your computer or the internet
penguin
penguins %>% #Penguin dataframe
ggplot(aes(x = body_mass_g,#Plot x-axis body_mass_g
           y = bill_depth_mm, #Plot y-axis bill_depth_mm
           color = species)) + #Add color to species
  geom_point() #Add geometry point
ggsave(here("Week_8","Output","penguinplot.png"))#To put Magick on plot, need to save plot as an image first
penplot <- image_read(here("Week_8", "Output","penguinplot.png"))#Read in this plot as a magick image
out <- image_composite(penplot, penguin, offset = "+70+30")#Making composite plot with image
out

# Read in a penguin gif
pengif <- image_read("https://media3.giphy.com/media/H4uE6w9G1uK4M/giphy.gif")
outgif <- image_composite(penplot, pengif, gravity = "center")
animation <- image_animate(outgif, fps = 10, optimize = "TRUE")
animation
###############################################################################


