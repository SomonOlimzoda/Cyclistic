
## Cyclistic: Bike Share Analysis 

### Scenario

As a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore, your team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, your team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve your recommendations, so they must be backed up with compelling data insights and professional data visualizations.

### About the company

In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members. 

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. The director of marketing believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs. 

To design new marketing strategies, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics.

In order to answer the key business questions, I will follow the steps of the data analysis process: **ask, prepare, process, analyze, share,** and **act.**

### Product background
* 5,824 bicycles and 692 docking stations
* majority of riders opt for traditional bikes
* 8% of riders use the assistive options
* users are more likely to ride for leisure
* 30% of riders use to commute to work each day
* casual riders have chosen Cyclistic for their mobility needs

## 1. Ask

Three questions will guide the future marketing campaign:

  1. How do annual members and casual riders use Cyclistic bikes differently?
  2. Why would casual riders buy Cyclistic annual memberships?
  3. How can Cyclistic use digital media to influence casual riders to become members?

Moreno has assigned to find answer: 
**How do annual members and casual riders use Cyclistic bikes differently?**

#### 1. Identify the business task
What is the reason annual members and casual riders use rental bikes differently? By design a marketing strategy to convert casual riders into annual members. The director of marketing and finance analysts inferred that annual members are way more profitable compared to casual riders.

#### 2. Stakeholders
* Lily Moreno, Marketing Director
* Cyclistic marketing analytics team
* Cyclistic executive team

## 2. Prepare 

#### 1. Download data and store it appropriately. 
This is public data and has been downloaded from [Motivate International Inc.](https://divvy-tripdata.s3.amazonaws.com/index.html) a period of 12 months, from the start of April 2020 to the end of May 2021 under this [license](https://ride.divvybikes.com/data-license-agreement). So, I decided to store the original files in my laptop. Also, I made copies of each dataset, in case the originals need to be referenced.

#### 2. Identify how it’s organized. 
All downloaded files are saved in (CSV) format. Columns in total 13: 

ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat,  
start_lng, end_lng, member_casual

#### 3. Sort and filter the data.
Due to the large size of the dataset, data processing will be done using the R programming language and R Studio.

#### 4. Determine the credibility of the data.
 
There are no issues with bias or credibility in this data. ROCCC approach is used to determine the credibility of the data(reliable, original, comprehensive, current and cited):
* reliable - small amount of records have missing values but represents all bike rides taken in the city of Chicago
* original - the data is made available by Motivate International Inc.
* comprehensive - the data includes all information about ride details
* current - it is up-to-date as it includes data until end of May 2021
* cited - the data is cited and is available under Data License Agreement

## 3. Process

1. Check the data for errors.
2. Choose your tools.
3. Transform the data so you can work with it effectively. 
4. Document the cleaning process.

Here, I use several libraries that help reading, cleaning, organizing and analyzing the data.1. Tools: R Programming is used for its ability to handle huge datasets efficiently. Microsoft Excel is used for further analysis and visualization.

1. Tools: R Programming is used for its ability to handle huge datasets efficiently. Microsoft Excel is used for further analysis and visualization.
