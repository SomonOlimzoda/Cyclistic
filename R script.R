
## Analyze ##
The purpose of this script is to consolidate downloaded Divvy data into a single data frame and then conduct simple analysis to help answer the key question:
“In what ways do members and casual riders use Divvy bikes differently?”

##  (Setting up my work environment on R and upload the dataset)  ##

# Load required packages
```{r libraries, echo=TRUE, eval=TRUE}
library(tidyverse)  #helps wrangle data
library(lubridate)  #helps wrangle date attributes
library(ggplot2)  #helps visualize data
library(dplyr)  #helps to filter, mutate, summarize, and arrange data
library(janitor) #helps cleaning dirty data
getwd() #displays your working directory
setwd("/Users/Administrator/Desktop/cyclistic/csv") #sets your working directory to simplify calls to data 
```
#Step 1. Collect Data
Cyclist data from 04/2020 until 05/2021 were imported and read as csv. files

# Upload Divvy datasets (csv files) here
```{r csv data collection, echo=TRUE, eval=FALSE}
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
```{r colname inspection, echo=TRUE, eval=TRUE}
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
#combining all datasets into one data frame
all_trips <- rbind(january, february, march, april, may, june, july, august, september, october, november, december)



















