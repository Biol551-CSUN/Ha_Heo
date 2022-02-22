#### Today we are going to practice tidy with biogeochemistry data from Hawaii ####
#### Created by: Sally Heo ####
#### Updated on: 2022-02-17 ####

#### Load Libaries needed to code ####
library(tidyverse) # Loading tidyverse
library(here) # Loading here

### Load Data ####
ChemData<-read_csv(here("Week_4", "Data", "chemicaldata_maunalua.csv")) # Load the ChemData used 
View(ChemData) #View ChemData
glimpse(ChemData) #View ChemData

#### Data Analysis ####

### Another way to remove all the NAs ###
ChemData_clean <-ChemData %>% # ChemData data frame
  filter(complete.cases(.)) %>% #filters out everything that is not a complete ro 
  separate(col = Tide_time, # Choosing the tide time col
           into = c("Tide", "Time"), # Separate it into two columns tide and time
           sep = "_", # Separate by _
           remove = FALSE) %>% # Keep the original tide_time column
  unite(col = "Site_Zone", # The name of the new column
        c(Site,Zone), # the columns to unite
        sep = ".", # Lets put a. in the middle
        remove = FALSE) # Keep the original 

head(ChemData_clean)

#### Pivoting the dataset between wide and long ####
#### Pivot_longer() ################################
ChemData_long <- ChemData_clean %>% # Starting with chemdata_clean dataframe
  pivot_longer(cols = Temp_in:percent_sgd,# The columns you want to pivot. This says select the temp to percent SGD columns
               names_to = "Variables", # the names of the new cols with all the column names
               values_to = "Values") # names of the new column with all the values
View(ChemData_long)

ChemData_long %>% 
  group_by(Variables, Site) %>% # group by everything we want 
  summarise(Param_means = mean(Values, na.rm = TRUE), # Get mean
            Param_vars = var(Values, na.rm = TRUE)) # Get variance

#### calculate the mean, variance, and standard deviation for all variables by site, zone, and tide ####
ChemData_long %>% 
  group_by(Variables, Site) %>% # group by everything we want
  summarise(Param_means = mean(Values, na.rm = TRUE), # Get mean
            Param_vars = var(Values, na.rm = TRUE), # Get variance
            Param_sd = sd(Values, na.rm = TRUE)) # Get standard deviation

#### Example using facet_wrap with long data ####
#### create boxplots of every parameter by site, fix the axes ####
ChemData_long %>% 
  ggplot(aes(x = Site, y = Values))+
  geom_boxplot()+
  facet_wrap(~Variables, scales = "free") # scales "free" releases both the x and y axes

#### Practicing to pivot_wider() - Long data to wide ######
ChemData_wide<-ChemData_long %>% 
  pivot_wider(names_from = Variables, # column with the names for the new columns
              values_from = Values) # column with the values
View(ChemData_wide)

#### Starting from beginning: calculate summary statistics and export the csv file #####
ChemData_clean<-ChemData %>% 
  filter(complete.cases(.)) %>% # filters out everything that is not a complete row
  separate(col = Tide_time, # choose the tide time col
           into = c("Tide","Time"), # separate it into two columns Tide and Time
           sep = "_", # separate by _
           remove = FALSE) %>% 
  pivot_longer(cols = Temp_in:percent_sgd, # the cols you want to pivot. This says select the temp to percent SGD columns
               names_to = "Variables", # the names of the new columns with all the column names
               values_to = "Values") %>% # names of the new column with all the values
  group_by(Variables, Site, Time) %>% 
  summarise(mean_vals = mean(Values, na.rm = TRUE)) %>% 
  pivot_wider(names_from = Variables,
              values_from = mean_vals) %>% # notice it is now mean_vals as the column name
  write_csv(here("Week_4", "Outputs", "summary.csv")) # export as a csv to the right folder
###############################################################################################################















