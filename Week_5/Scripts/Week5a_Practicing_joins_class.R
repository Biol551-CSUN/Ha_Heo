#### Today we are going to practice joins with data from Becker and Silbiger (2020) ####
#### Created by: Sally Heo #####
#### Updated on: 2022-02-22 ####

#### Load libraries needed to code ####
library(tidyverse) # Load tidyverse
library(here) # Load here

#### Load data #####
# Environmental data from each site
EnviroData<-read_csv(here("Week_5", "Data", "site.characteristics.data.csv"))

# Thermal performance data
TPCData<-read_csv(here("Week_5", "Data", "Topt_data.csv"))
glimpse(EnviroData) # Glimpse EnviroData
glimpse(TPCData) # Glimpse TPCData

# also use View()
View(EnviroData)
View(TPCData)

#### Data analysis ####

#### Pivot the Data #### 
EnviroData_wide <- EnviroData %>% # Convert the EnviroData to wide since TPCData is in wide format (Keep it consistent)
  pivot_wider(names_from = parameter.measured, # Pivot the data wider
              values_from = values) %>% 
  arrange(site.letter) # arrange the dataframe by site (ie A, B, C, D, E, F in order)
View(EnviroData_wide) # View the EnviroData in wide

#### left_join() ####
FullData_left<- left_join(TPCData, EnviroData_wide) #Left_join() requires a key that is identical in both dataframes, joining the two data frames
## Joining, by = "site.letter"
head(FullData_left)

### relocate ###
FullData_left<- left_join(TPCData, EnviroData_wide) %>% 
  relocate(where(is.numeric), .after = where(is.character)) # Arranging so that character columns are first, then numeric columns are second
## Joining, by = "site.letter"
head(FullData_left)

#### Think, Pair, Share ####
# calculating the mean and variance of all collected (TPC and environmental) data by site
# R knows that site.letter is the unique ID so that is what we want to join by

summary <- FullData_left %>% 
  group_by(site.letter) %>% 
  summarise_if(is.numeric, list(mean = mean, var = var), na.rm = TRUE)
View(FullData_left) 

## Pivot longer ###
FullData_mean_var <- FullData_left %>% 
  pivot_longer(cols = E:substrate.cover, # Pivoting the data from wide to longer
               names_to = "Variables",# Adding all the variables in one column
               values_to = "Values") %>% # 
  group_by(name, Variables) %>% 
  summarise(mean = mean(Values), # caluculating the mean
            variance = var(Values)) # calculating the variance
View(FullData_mean_var)

# Make 1 tibble #
T1 <- tibble(Site.ID = c("A", "B", "C", "D"), # Tibble - data frame but simpler
             Temperature = c(14.1, 16.7, 15.3, 12.8))
T1            
# Make another tibble
T2 <-tibble(Site.ID = c("A", "B", "D", "E"),
            ph = c(7.3, 7.8, 8.1, 7.9))
T2

# left_join vs right_join 
## Joining, by = "Site.ID"
left_join(T1, T2) # lose information on the right hand side
right_join(T1, T2)

# inner_join vs full_join
# inner_join only keeps the data that is complete in both data sets
# full_join keeps everything
inner_join(T1, T2)
full_join(T1, T2)

#semi_join vs anti_join
# semi_join keeps all rows from the first data set where there are matching values in the second data set, keeping just columns from the first data set
# anti_join is useful for finding unique key identifiers
semi_join(T1, T2)
anti_join(T1, T2)

##############################################################################################
