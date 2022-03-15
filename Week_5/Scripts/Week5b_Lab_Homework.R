<<<<<<< HEAD
#### Week 5b Lab Homework with Conductivity and depth data ####
#### Created by: Sally Heo ####
#### Updated on: 2022-02-24 ####

#### Load libraries needed to code ####
library(tidyverse) # Load tidyverse
library(here) # Load here
library(lubridate) # Load package lubridate - deal with dates and times

### Load data ####
CondData<-read_csv(here("Week_5", "Data", "Conddata.csv")) # Read conductivity data frame
DepthData<-read_csv(here("Week_5", "Data", "DepthData.csv")) # Read DepthData data frame
View(CondData) # View conddata
View(DepthData) # View DepthData

#### Data analysis ####
CondData <- CondData %>% # Bringing the conddata over using pipe 
  mutate(datetime = mdy_hms(depth)) %>% # Add new column datetime in ISO format, but original column was mdy_hms(depth)
  drop_na() %>% # Dropping NAs
  mutate(datetime = round_date(datetime, "10 seconds"))# Rounding the conductivity data to the nearest 10 seconds to match with DepthData
View(CondData)

DepthData <- DepthData %>% 
  mutate(datetime = mdy_hm(date)) %>% # Add new column datetime from date column
  drop_na() # Dropping all NAs
View(DepthData)

CondDepthData <- CondData %>%  
  inner_join(DepthData, by = "datetime") %>% # Keeping the data that is complete in both datas
  mutate(hours = hour(datetime)) %>% # Making the dates into datetime in a new column, extracting hour into a new column
  mutate(minutes = minute(datetime)) %>% # Extracting minutes into a new column
  unite(col = "Hours_Mins",# combining minute and hour into a new column called Hours_Mins
        c(hours, minutes), # The two columns we are combining (hours and minutes)
        sep = ":",
        remove = TRUE) %>% 
  select(datetime, Depth, TempInSitu, SalinityInSitu_1pCal, Hours_Mins) %>% 
  group_by(Hours_Mins) %>% 
  summarise_at(.vars = c('Depth', 'TempInSitu', 'SalinityInSitu_1pCal', 'datetime'), mean, na.rm = T) %>% # Taking mean of date, depth, temperature, and salinity by minute
write_csv(here("Week_5", "Output", "Homework_Lab5_summary.csv"))# Saving .csv file to Output Folder
View(CondDepthData)

# Plot using the averaged data #
CondDepthData %>% 
  ggplot(aes(x = SalinityInSitu_1pCal, # Plotting x-axis
             y = Depth, # Plotting Depth
             color = TempInSitu)) + # Mapping the temperature to color
  geom_point() + # Point geometry 
  labs(title = "Depth vs Salinity in Situ by Temperature", # Giving plot title
       x = "Salinity In Situ 1 p Cal", # Labeling x-axis
       color = "Temperature (°C)") + # changing the legend title 
theme_bw() + # theme bw
theme(title = element_text(size = 20, color = "darkorchid")) # changing text size and color
ggsave(here("Week_5", "Output", "HomeworkLab5b.png"), # Saving file to this directory
       width = 7, height = 5)# Dimensions in inches

  
=======
#### Week 5b Lab Homework with Conductivity and depth data ####
#### Created by: Sally Heo ####
#### Updated on: 2022-02-24 ####

#### Load libraries needed to code ####
library(tidyverse) # Load tidyverse
library(here) # Load here
library(lubridate) # Load package lubridate - deal with dates and times

### Load data ####
CondData<-read_csv(here("Week_5", "Data", "Conddata.csv")) # Read conductivity data frame
DepthData<-read_csv(here("Week_5", "Data", "DepthData.csv")) # Read DepthData data frame
View(CondData) # View conddata
View(DepthData) # View DepthData

#### Data analysis ####
CondData <- CondData %>% # Bringing the conddata over using pipe 
  mutate(datetime = mdy_hms(depth)) %>% # Add new column datetime in ISO format, but original column was mdy_hms(depth)
  drop_na() %>% # Dropping NAs
  mutate(datetime = round_date(datetime, "10 seconds"))# Rounding the conductivity data to the nearest 10 seconds to match with DepthData
View(CondData)

DepthData <- DepthData %>% 
  mutate(datetime = mdy_hm(date)) %>% # Add new column datetime from date column
  drop_na() # Dropping all NAs
View(DepthData)

CondDepthData <- CondData %>%  
  inner_join(DepthData, by = "datetime") %>% # Keeping the data that is complete in both datas
  mutate(hours = hour(datetime)) %>% # Making the dates into datetime in a new column, extracting hour into a new column
  mutate(minutes = minute(datetime)) %>% # Extracting minutes into a new column
  unite(col = "Hours_Mins",# combining minute and hour into a new column called Hours_Mins
        c(hours, minutes), # The two columns we are combining (hours and minutes)
        sep = ":",
        remove = TRUE) %>% 
  select(datetime, Depth, TempInSitu, SalinityInSitu_1pCal, Hours_Mins) %>% 
  group_by(Hours_Mins) %>% 
  summarise_at(.vars = c('Depth', 'TempInSitu', 'SalinityInSitu_1pCal', 'datetime'), mean, na.rm = T) %>% # Taking mean of date, depth, temperature, and salinity by minute
write_csv(here("Week_5", "Output", "Homework_Lab5_summary.csv"))# Saving .csv file to Output Folder
View(CondDepthData)

# Plot using the averaged data #
CondDepthData %>% 
  ggplot(aes(x = SalinityInSitu_1pCal, # Plotting x-axis
             y = Depth, # Plotting Depth
             color = TempInSitu)) + # Mapping the temperature to color
  geom_point() + # Point geometry 
  labs(title = "Depth vs Salinity in Situ by Temperature", # Giving plot title
       x = "Salinity In Situ 1 p Cal", # Labeling x-axis
       color = "Temperature (°C)") + # changing the legend title 
theme_bw() + # theme bw
theme(title = element_text(size = 20, color = "darkorchid")) # changing text size and color
ggsave(here("Week_5", "Output", "HomeworkLab5b.png"), # Saving file to this directory
       width = 7, height = 5)# Dimensions in inches

  
>>>>>>> 0637edba3d05df5a14b7b74aa7151407f9d54e07
