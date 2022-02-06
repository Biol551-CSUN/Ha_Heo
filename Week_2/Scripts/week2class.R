## This is my first script. I am learning how to import data
## created by: Sally Heo
## created on: 2022-02-03
#########################################################

### load libraries ###
library(tidyverse) #Do this every time and be sure you are in the line and hit run
library(here) #Do this everyt time and be sure you are in the line and hit run


### Read in data #####
weightData <- read_csv(here("Week_2","Data","weightdata.csv")) #weight data

# Data analysis #####
head(weightData) # Look at the top 6 lines of the dataframe
tail(weightData) # Look at the bottom 6 lines of the dataframe
View(weightData) # Shows the whole data set, and this opens a new window



