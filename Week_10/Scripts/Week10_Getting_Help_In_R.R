#### Today we are going to learn how to get help in R ####
#### Created by: Sally Heo ####
#### Updated on: 2022-04-05 ####

### Load libraries needed to code ####
library(tidyverse) #Load tidyverse
library(here) #Load here

#### Install packages ####
install.packages('reprex') #reproducible example
install.packages('datapasta')#copy and paste
install.packages('styler') #copy and paste in style

### Making my first reprex ###
## Example of a Reprex - This has an error ##
mpg %>% 
  ggplot(aes(x = displ, y = hwy)) %>% 
  geom_point(aes(color = class))

# This first reprex has an error; Should have used + instead of %>%
# Error: mapping must be created by aes()
# Go to Addins -> Render Reprex -> Paste to the program you want.
# Make sure to "append session info"

lat    long    star_no
33.548    -117.805    10
35.534    -121.083    1
39.503    -123.743    25
32.863    -117.24    22
33.46    -117.671    8
33.548    -117.805    3

# {datapasta} helps copy and paste snippets of your data in a reproducible way
# copy the code -> go to AddIns -> paste as tribble and name it something (ie Data)
data <- tibble::tribble(
                     ~lat....long....star_no,
                  "33.548    -117.805    10",
                   "35.534    -121.083    1",
                  "39.503    -123.743    25",
                   "32.863    -117.24    22",
                    "33.46    -117.671    8",
                   "33.548    -117.805    3"
                  )
data



