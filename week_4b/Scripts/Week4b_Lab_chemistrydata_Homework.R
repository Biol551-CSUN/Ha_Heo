#### Week4b Using Biogeochem data at sites in Hawaii: Practice with tidyr homework ####
#### Created by: Sally Heo #####
#### Updated on: 2022-02-17 ####

#### Load libraries needed to code ####
library(tidyverse) # Loading tidyverse
library(here) # Loading here

#### Load data ####
ChemData<-read_csv(here("Week_4", "Data", "chemicaldata_maunalua.csv")) # Loading chemData to use
View(ChemData) # View ChemData
glimpse(ChemData) # Glimpse - To see every Column in a data frame

#### Data analysis ####
ChemData_clean<-ChemData %>% # Assigning ChemData_clean object
  filter(complete.cases(.)) %>% # Removes all the rows with NAs
  separate(col = Tide_time, # choosing the tide time column to separate
           into = c("Tide", "Time"), # Separate into two columns: Tide and Time
           sep = "_", # Separate into columns by "_"
           remove = FALSE) %>% # Keep the original Tide_time column 
filter(Time == "Day") # Filtering time to Day only, so we can filter out night (Only Day will show)

#### Pivot_longer() ##############
ChemData_long <- ChemData_clean %>%  # Assigning ChemData_Long object
  pivot_longer(cols = Temp_in:Phosphate, # Pivoting the columns Temp_in, Salinity, and Phosphate to the long format
               names_to = "Variables", # Naming new column Variables
               values_to = "Values") %>% # Naming new column Values
  group_by(Variables, Season, Zone) %>% # Before summarise, grouping by variables, season, and zone
  summarise(mean_vals = mean(Values, na.rm = TRUE),# calculating mean
            var_vals = var(Values, na.rm = TRUE)) %>% # calculating variance
write_csv(here("Week_4b", "Outputs", "Homework4b.csv")) # Saving as a .csv
View(ChemData_clean)

ChemData_long %>% # Using data frame chemData_long
  ggplot(aes(x = Season, # Season on x-axis
             y = mean_vals, # Mean values on y-axis
             color = Season))+ # color according to season
  geom_point()+ # Setting geometry as a point
  facet_wrap(~Variables, scales = "free")+ # facet wrap by variables, "free" changes the x and y axes
  guides(color = "none")+ # Remove legend
  labs(title = "Seasons vs Mean Values During Daytime", # changing title of plot
       subtitle = "Plot of Seasons vs Mean Values for Phosphate, Salinity, and Temperature", # change subtitle
       y = "Mean values", # Editing/changing y-axis title 
       caption = "Source: Silbiger et al. 2020")+
  theme(title = element_text(size = 18, color = "blue2")) # Element_text() sets the font size, color, and face of the text elements like plot.title
ggsave(here("Week_4b", "Outputs","Homework4b.png"), # Saving the plot as a png in Outputs folder
       width = 7, height = 5) # changing the dimensions in inches

############################################################################################################################################################

       
