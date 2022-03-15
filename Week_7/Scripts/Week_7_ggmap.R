#### Today we will be working with maps ####
#### Created by: Sally Heo #####
#### Updated on: 2022-03-10 ####

# Install ggmaps and ggsn #
install.packages("ggmap")#Install packages ggmap - for ggmaps
install.packages("ggsn") #Install packages ggsn - to add scale bars and compass arrows

# Load Libraries needed to code #
library(ggmap)#Load ggmap
library(tidyverse)#Load tidyverse
library(here)#Load here
library(ggsn)#Load ggsn

# IMPORTANT don't put your key to github!! Save in a text file and import it each time
register_google(key = "YOUR KEY HERE", write = TRUE)
#Setting write = TRUE will write the API key to your R environment so that you do not have to re register it each time

# Load Data #
ChemData<-read_csv(here("Week_7","Data","chemicaldata_maunalua.csv"))#Load Maunalua Chemistry data 
glimpse(ChemData)#View ChemData

# Data Analysis #

# Get base maps from ggmap #
Oahu <- get_map("Oahu")#Location as a string
ggmap(Oahu)#Use ggmap to plot the base layer
#Make a data frame of lon and lat coordinates
WP <- data.frame(lon = -157.7621, lat = 21.27427)#coordinates for Wailupe on Oahu
Map1 <- get_map(WP)#Get base layer
ggmap(Map1)#plot it

# Zoom in on a location #
Map1 <- get_map(WP,zoom = 17)#Zoom argument, integer from 3 to 20; 3 = continent level, 20 = single building level 
ggmap(Map1)
Map1 <- get_map(WP,zoom = 17, maptype = "satellite")#change map type to satellite
ggmap(Map1)
Map1 <- get_map(WP,zoom = 17, maptype = "watercolor")#change map type to watercolor
ggmap(Map1)

# You can use the ggmap base layer in any ggplot #
Map1 <- get_map(WP,zoom = 17, maptype = "satellite")#change map type to satellite
ggmap(Map1)+
  geom_point(data = ChemData,#Using chemData
             aes(x = Long, y = Lat, color = Salinity),#Plotting x-axis, y-axis, color to Salinity
             size = 4)+ #Adjusting size
  scale_color_viridis_c()#color palette

# Adding a scale bar #
ggmap(Map1)+
  geom_point(data = ChemData, #Assigning geometry point and using ChemData
             aes(x = Long, y = Lat, color = Salinity),#Plotting x-axis long, y-axis lat, color to Salinity
             size = 4) + #Adjusting size to 4
  scale_color_viridis_c()+ #color palette
  scalebar(x.min = -157.766, x.max = -157.758,#Adjusting xmin, xmax
           y.min = 21.2715, y.max = 21.2785, #Adjusting scale ymin, ymax
           dist = 250, dist_unit = "m", model = "WGS84",# Adjusting distance, distance unit, and model
           transform = TRUE, st.color = "white",
           box.fill = c("yellow", "white"))
geocode("the white house")#To get exact locations that we can use in maps
geocode("California State University, Northridge")#Get exact location of CSUN

###################################################################################3
