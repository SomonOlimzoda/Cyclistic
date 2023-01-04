
## Analyze ##

# The purpose of this script is to consolidate downloaded Divvy data into a single data frame and then conduct simple analysis to help answer the key question:
“In what ways do members and casual riders use Divvy bikes differently?”

# (Setting up my work environment on R and upload the dataset)

# Load required packages

```
library(tidyverse)  #helps wrangle data
library(lubridate)  #helps wrangle date attributes
library(ggplot2)    #helps visualize data
library(dplyr)      #helps to filter, mutate, summarize, and arrange data
library(janitor)    #helps cleaning dirty data
getwd()             #displays your working directory
setwd("/Users/Administrator/Desktop/cyclistic/csv") #sets your working directory to simplify calls to data 
```

#Step 1. Collect Data

Cyclist data from 04/2020 until 03/2021 were imported and read as csv. files
# Upload Divvy datasets (csv files) here

```
january <- read_csv("january.csv")
february <- read_csv("february.csv")
march <- read_csv("march.csv")
april <- read_csv("april.csv")
may <- read_csv("may.csv")
june <- read_csv("june.csv")
july <- read_csv("july.csv")
august <- read_csv("august.csv")
september <- read_csv("september.csv")
october <- read_csv("october.csv")
november <- read_csv("november.csv")
december <- read_csv("december.csv")
```

#Step 2. Wrangle data and combine into one a single file

# Compare column names each of the files
Compare column names each of the files. While the names don't have to be in the same order, they DO need to match perfectly before they are  joined  into one file

```
colnames(january)
colnames(february)
colnames(march)
colnames(april)
colnames(may)  
colnames(june)
colnames(july)
colnames(august)
colnames(september)
colnames(october)
colnames(november)
colnames(december)
```

# Inspect the dataframes and look for incongruencies

```
str(january)
str(february)
str(march)
str(april)
str(may)  
str(june)
str(july)
str(august)
str(september)
str(october)
str(november)
str(december)
```

# After inspecting our dataframes following were noticed:
files january, february, march, and december contain wrong data types. Start_station_id and end_station_id should be converted to numeric

```
january <-  mutate(january, start_station_id   = as.numeric(start_station_id)
                   ,end_station_id  = as.numeric(end_station_id ))
february <-  mutate(february, start_station_id  = as.numeric(start_station_id )
                   ,end_station_id = as.numeric(end_station_id)) 
march <-  mutate(march, start_station_id   = as.numeric(start_station_id)
                   ,end_station_id  = as.numeric(end_station_id ))
december <-  mutate(december, start_station_name  = as.character(start_station_name)
                   ,end_station_name = as.character(end_station_name)) 
```

# Combining all datasets into one data frame

```
all_trips <- rbind(january, february, march, april, may, june, july, august, september, october, november, december)
```
or alternatively we can use following function:
```
all_trips <- bind_rows(january, february, march, april, may, june, july, august, september, october, november, december)
```

It was determined that for the purpose of this analysis the columns start_lat, start_lng, end_lat and end_lng were not required

```
all_trips <- all_trips %>%  
  select(-c(start_lat, start_lng, end_lat, end_lng))
```

# To find in which columns the missing values are:

```
colSums(is.na(all_trips))
```

# All missing values reside in the start_station_name/end_station_name and  start_station_id and  end_station_id columns


# Inspect the new table that has been created

```
colnames(all_trips)  #List of column names
nrow(all_trips)      #How many rows are in data frame
dim(all_trips)       #Dimensions of the data frame
head(all_trips)      #See the first 6 rows of data frame  
str(all_trips)       #See list of columns and data types (numeric, character, etc)
summary(all_trips)   #Statistical summary of data. Mainly for numerics
glimpse(all_trips)   #To get a brief look at data 
```

# This function produce summaries without the spark graphs

```
skimr::skim_without_charts(all_trips)
```

# Begin by seeing how many observations fall under each usertype

```
table(all_trips$member_casual)
table(all_trips$day_of_week)

```

# Now, it is time to add columns that list the date, month, day, and year of each ride. This will allow us to aggregate ride data for each month, day, or year

```
all_trips$date <- as.Date(all_trips$started_at) #The default format is yyyy-mm-dd
all_trips$month <- format(as.Date(all_trips$date), "%m")
all_trips$day <- format(as.Date(all_trips$date), "%d")
all_trips$year <- format(as.Date(all_trips$date), "%Y")
all_trips$day_of_week <- format(as.Date(all_trips$date), "%A")
```

# Add a "ride_length" calculation to all_trips in seconds and in minutes (2 new columns)

```
all_trips$ride_length <- difftime(all_trips$ended_at,all_trips$started_at) #in seconds
all_trips$ride_length_m <- (difftime(all_trips$ended_at,all_trips$started_at))/60 #in minutes
```

# Inspect the structure of the columns

```
str(all_trips)
```

# Convert (ride_length, ride_length_m, day and month) to numeric so that calculation can be executed

```
all_trips$ride_length <- as.numeric(as.character(all_trips$ride_length))
all_trips$ride_length_m <- as.numeric(as.character(all_trips$ride_length_m))
all_trips$month <- as.numeric(all_trips$month)
all_trips$day <- as.numeric(all_trips$day)
```

# Check the data to confirm is has been converted

```
is.numeric(all_trips$ride_length)
is.numeric(all_trips$ride_length_m)
is.numeric(all_trips$month)
is.numeric(all_trips$day)
```

# After converting and inspecting data, it was found column (ride_length) has some negative values. It might be because of start_time and end_time 
were swapped for these rides, or system simply registere bike rides incorrectly. Well, negative resultes should be deleted.

```
all_trips_v1 <- all_trips[!( all_trips$ride_length < 0),]
```

# 10,084 negative values were deleted. Now, we can see our summary:

```
skimr::skim_without_charts(all_trips_v1)
```

# number of rows 3479196 and total of 16 columns.


#Step 4. Organize descriptive analysis  

# A descriptive analysis both on ride length (in minutes and seconds) has been performed 

```
all_trips_v1 %>% 
  summarise(max(ride_length),min(ride_length),mean(ride_length),median(ride_length))
all_trips_v1 %>% 
  summarise(max(ride_length_m),min(ride_length_m),mean(ride_length_m),median(ride_length_m))
```

Total mean ride length is 27.9 minutes or 1677 in seconds
Total median ride length is 14.6 minutes or 874 in seconds

# Compare average ride length in minutes both for members and casual users 

```
aggregate(all_trips_v1$ride_length_m ~ all_trips_v1$member_casual, FUN = mean)
aggregate(all_trips_v1$ride_length_m ~ all_trips_v1$member_casual, FUN = median)
```

Total mean ride length for casual riders is 44.9 minutes and 16.1 minutes for members
Total mean ride length for casual riders is 21.2 minutes and 11.4 minutes for members

# Before we run the average ride time by each day for members vs casual users it was noticed that the days of the week are out of order

```
all_trips_v1$day_of_week <- ordered(all_trips_v1$day_of_week, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))
```

```
 aggregate(all_trips_v1$ride_length_m ~ all_trips_v1$member_casual + all_trips_v1$day_of_week, FUN = mean)
```

# See the average ride time by each month for members vs casual users

```
aggregate(all_trips_v1$ride_length_m ~ all_trips_v1$member_casual + all_trips_v1$month, FUN = mean)
```

# Analyze ridership data by type and weekday

```
all_trips_v1 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>%  #creates weekday field using wday()
  group_by(member_casual, weekday) %>%                  #groups by usertype and weekday
  summarise(number_of_rides = n()							          #calculates the number of rides and average duration 
  ,average_duration = mean(ride_length_m)) %>% 		      # calculates the average duration
  arrange(member_casual, weekday)								        # sorts
```

# Analyze ridership data by type and month

```
all_trips_v1 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>%  
  group_by(member_casual, month) %>%  
  summarise(number_of_rides = n() 
            ,average_duration = mean(ride_length_m)) %>% 		
  arrange(member_casual, month)		
```

# Visualize the number of rides by rider type

```
all_trips_v1 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday)  %>% 
  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +
  geom_col(position = "dodge")
```

# Visualization for average duration

```
all_trips_v1 %>% 
  mutate(weekday = wday(started_at, label = TRUE)) %>% 
  group_by(member_casual, weekday) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(ride_length)) %>% 
  arrange(member_casual, weekday)  %>% 
  ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) +
  geom_col(position = "dodge")
```

#  Visualize an average ride length depending on rider type and number of each rider type

```
all_trips_v1 %>%
  group_by(member_casual) %>%
  summarise(max(ride_length_m), min(ride_length_m),avg_ride_length = mean(ride_length_m)) %>% 
  ggplot(aes(x = member_casual, y = avg_ride_length,fill=member_casual)) +
  geom_col()+ scale_y_continuous(breaks = seq(0, 50, by = 5))
```

# The visualization shows that casual riders tend to rent bikes for longer mean durations (45 min to 16.1 min) than members.
# It means that casual riders use to ride bikes far more(2.7 to 3x more) despite the fewer rides. Whereas members use bikes far less but consistently over a year

#Step5. Export summary file for further analysis

# Create a csv file that we will visualize in Excel, Tableau, or my presentation software

```
vizs_1 <- aggregate(all_trips_v1$ride_length_m ~ all_trips_v1$member_casual + all_trips_v1$day_of_week, FUN = mean)
vizs_2 <- aggregate(all_trips_v1$ride_length_m ~ all_trips_v1$member_casual + all_trips_v1$rideable_type, FUN = mean)
vizs_3 <- aggregate(all_trips_v1$ride_length_m ~ all_trips_v1$member_casual + all_trips_v1$month, FUN = mean)
vizs_4 <- table(all_trips$member_casual)
vizs_5 <- table(all_trips$day_of_week)
vizs_6 <- table(all_trips_v1$rideable_type)
vizs_7 <- table(all_trips_v1$month)
```

```
write.csv(vizs_1, file = '/Users/Administrator/Desktop/cyclistic.csv')
write.csv(vizs_2, file = '/Users/Administrator/Desktop/cyclistic.csv') 
write.csv(vizs_3, file = '/Users/Administrator/Desktop/cyclistic.csv') 
write.csv(vizs_4, file = '/Users/Administrator/Desktop/cyclistic.csv') 
write.csv(vizs_5, file = '/Users/Administrator/Desktop/cyclistic.csv') 
write.csv(vizs_6, file = '/Users/Administrator/Desktop/cyclistic.csv') 
write.csv(vizs_7, file = '/Users/Administrator/Desktop/cyclistic.csv') 
```

#We are done!
