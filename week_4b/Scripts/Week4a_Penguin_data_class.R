#### Week 4 - Script 1 Today we are going to plot penguine data ####
#### Created by: Sally Heo #########################################
#### Updated on: 2022-02-15#########################################

#### Load Libraries needed for code to run ####
library(palmerpenguins) # Loading the Palmer Penguins data set
library(tidyverse) # Loading tidyverse
library(here) # Loading here

#### Load data ####
# The data is part of the package and is called penguins
glimpse(penguins) # Columns run down the page, and data runs across, and can see every column in data frame

#### Data analysis ####

#### Filtering ########
head(penguins) # Before filtering
filter(.data = penguins,  # Sets the Penguin frame data, sets an argument in the function
       sex == "female") # Filtering only the female penguins, == "is exactly equal to"
filter(.data = penguins,
       year == 2008) # Filtering for penguins measured in the year 2008
filter(.data = penguins,
       body_mass_g > 5000) # Filtering for body mass in (g) > 5000
filter(.data = penguins, # Filter with multiple conditions, selecting females that are also greater than 5000 g
       sex == "female",
       body_mass_g > 5000)
filter(.data = penguins, # Filter/Boolean - Penguins collected in either 2008 or 2009
       year == 2008 | year == 2009)
filter(.data = penguins, # Filter/Boolean - Penguins that are not from the island Dream
       island != "Dream")
filter(.data = penguins,
       species == "Adelie" & species == "Gentoo")
filter(.data = penguins, # Shortcut, %in% - group
       island %in% c("Dream", "Biscoe"))

#### Mutate (Add new columns) ####
data2<-mutate(.data = penguins, # Adding a new column to convert body mass in g to kg
              body_mass_kg = body_mass_g/1000)
View(data2)
data2<-mutate(.data = penguins, # convert mass to kg, and calculate the ratio of bill length to depth
              body_mass_kg = body_mass_g/1000,
              bill_length_depth = bill_length_mm/bill_depth_mm)

data2<- mutate(.data = penguins, # Mutate with ifelse()
              after_2008 = ifelse(year>2008, "After 2008", "Before 2008"))
View(data2)

data2<-mutate(.data = penguins,
              length_mass = flipper_length_mm + body_mass_g) # Adding flipper length and body mass
View(data2)

data5<-mutate(.data = penguins,
              mass_big_small = ifelse(body_mass_g > 4000, "big", "small")) # Labeling body mass greater than 4000 big and everything else is small
View(data5)

#### Introduction to The pipe %>% ######
penguins %>% # Use penguin dataframe, %>% allows the dataframe to carr over so you don't need to write it out anymore
  filter(sex == "female") %>% # Select Females
  mutate(log_mass = log(body_mass_g)) %>%  # Calculate log biomass
  #select(species, island, sex, log_mass) # Only see species, island, sex, 
  select(Species = species, island, sex, log_mass) # Can also use select() to rename columns, Renaming species to have a capital S

### Summarize ####
penguins %>% # penguin dataframe carrying over
  group_by(island, sex) %>% # group_by() by itself doesn't do anything, but is good to put before summarize; group by both island and sex
  summarise(mean_bill_length = mean(bill_length_mm, na.rm = TRUE ), # summarise and calculate the mean flipper length
            max_bill_length = max(bill_length_mm, na.rm = TRUE)) # calculate the mean and max bill length by island
## summarise() has grouped output by 'island'. You can override using the .groups argument

### remove NAs ###
penguins %>% 
  drop_na(sex) %>%# drops rows with NAs from a specific column, drops all the rows that are missing data on sex
  group_by(island, sex) %>% 
  summarise(mean_bill_length = mean(bill_length_mm, na.rm = TRUE)) # drop all the rows that are missing data on sex calculate mean bill length by sex

### Pipe into a ggplot ###
penguins %>% # Penguin dataframe
  drop_na(sex) %>% # Drops NAs from sex
  ggplot(aes(x = sex, y = flipper_length_mm)) +
  geom_boxplot() # Plot boxplots of flipper length by sex

###############################################################################################################################################################


