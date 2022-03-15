<<<<<<< HEAD
### Today we are going to learn how to convert and manipulate dates and times using {lubridate} package ####
### Created by: Sally Heo #####
### Updated on: 2022-02-24 ####

### Install package lubridate ####
install.packages("lubridate") # package to deal with dates and times

### Load libraries needed to code ####
library(tidyverse) # Load tidyverse
library(here) # Load here
library(lubridate) # Load lubridate 

### Load data ####
CondData<-read_csv(here("Week_5", "Data","CondData.csv")) # A

#### Data analysis ####
now() # Know the time right now
now(tzone = "EST") # Asking the time in other time zones (ie time it is on the east coast)
now(tzone = "GMT") # what time in GMT
today() # Only getting the date and not the time
today(tzone = "GMT") # getting the date in the GMT zone only
am(now()) # Asking is it morning right now?
leap_year(now()) # Is it a leap year?

# Date specifications for lubridate - These will all produce the same results as ISO dates #
ymd("2021-02-24") # ymd()
mdy("02/24/2021") # mdy()
mdy("February 24 2021") # mdy()
dmy("24/02/2021") # dmy()

# Date and Time specifications with lubridate #
ymd_hms("2021-02-24 10:22:20 PM") # ymd_hms()
mdy_hms("02/24/2021 22:22:20") # mdy_hms()
mdy_hm("February 24 2021 10:22 PM") # mdy_hm()

# Extracting specific date or time elements from datetimes #
# Make a vector of dates
# Make a character string
datetimes<-c("02/24/2021 22:22:20",
             "02/25/2021 11:21:10",
             "02/26/2-21 08:01:52")
# Convert to datetimes #
datetimes <- mdy_hms(datetimes)
month(datetimes) # extract the months from the character string
month(datetimes, label = TRUE, abbr = FALSE) # Spelling out the months, save it as the month name
day(datetimes) # extract day
wday(datetimes, label = TRUE)# extract day of week
hour(datetimes)# extract hour
minute(datetimes)# extract minutes
second(datetimes)# extract second
datetimes + hours(4)# this adds 4 hours
datetimes + days(2) # this adds 2 days
round_date(datetimes, "minute") # round to nearest minute
round_date(datetimes, "5 mins") # round to nearest 5 minute

# Think Pair Share #
# convert the date column to a datetime #
CondData <- read_csv(here("Week_5", "Data", "CondData.csv")) %>% 
  mutate(datetime = mdy_hms(depth)) %>% 
  drop_na()
View(CondData)

################################################################################################
=======
### Today we are going to learn how to convert and manipulate dates and times using {lubridate} package ####
### Created by: Sally Heo #####
### Updated on: 2022-02-24 ####

### Install package lubridate ####
install.packages("lubridate") # package to deal with dates and times

### Load libraries needed to code ####
library(tidyverse) # Load tidyverse
library(here) # Load here
library(lubridate) # Load lubridate 

### Load data ####
CondData<-read_csv(here("Week_5", "Data","CondData.csv")) # A

#### Data analysis ####
now() # Know the time right now
now(tzone = "EST") # Asking the time in other time zones (ie time it is on the east coast)
now(tzone = "GMT") # what time in GMT
today() # Only getting the date and not the time
today(tzone = "GMT") # getting the date in the GMT zone only
am(now()) # Asking is it morning right now?
leap_year(now()) # Is it a leap year?

# Date specifications for lubridate - These will all produce the same results as ISO dates #
ymd("2021-02-24") # ymd()
mdy("02/24/2021") # mdy()
mdy("February 24 2021") # mdy()
dmy("24/02/2021") # dmy()

# Date and Time specifications with lubridate #
ymd_hms("2021-02-24 10:22:20 PM") # ymd_hms()
mdy_hms("02/24/2021 22:22:20") # mdy_hms()
mdy_hm("February 24 2021 10:22 PM") # mdy_hm()

# Extracting specific date or time elements from datetimes #
# Make a vector of dates
# Make a character string
datetimes<-c("02/24/2021 22:22:20",
             "02/25/2021 11:21:10",
             "02/26/2-21 08:01:52")
# Convert to datetimes #
datetimes <- mdy_hms(datetimes)
month(datetimes) # extract the months from the character string
month(datetimes, label = TRUE, abbr = FALSE) # Spelling out the months, save it as the month name
day(datetimes) # extract day
wday(datetimes, label = TRUE)# extract day of week
hour(datetimes)# extract hour
minute(datetimes)# extract minutes
second(datetimes)# extract second
datetimes + hours(4)# this adds 4 hours
datetimes + days(2) # this adds 2 days
round_date(datetimes, "minute") # round to nearest minute
round_date(datetimes, "5 mins") # round to nearest 5 minute

# Think Pair Share #
# convert the date column to a datetime #
CondData <- read_csv(here("Week_5", "Data", "CondData.csv")) %>% 
  mutate(datetime = mdy_hms(depth)) %>% 
  drop_na()
View(CondData)

################################################################################################
>>>>>>> 0637edba3d05df5a14b7b74aa7151407f9d54e07
