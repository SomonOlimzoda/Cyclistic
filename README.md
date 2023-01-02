
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

#### Three questions will guide the future marketing campaign:

  1. How do annual members and casual riders use Cyclistic bikes differently?
  2. Why would casual riders buy Cyclistic annual memberships?
  3. How can Cyclistic use digital media to influence casual riders to become members?

Moreno has assigned to find answer: 
**How do annual members and casual riders use Cyclistic bikes differently?**

#### Identify the business task
What is the reason annual members and casual riders use rental bikes differently? By design a marketing strategy to convert casual riders into annual members. The director of marketing and finance analysts inferred that annual members are way more profitable compared to casual riders.

#### Stakeholders
* Lily Moreno, Marketing Director
* Cyclistic marketing analytics team
* Cyclistic executive team

## 2. Prepare 

#### Download data and store it appropriately 
This is public data and has been downloaded from [Motivate International Inc.](https://divvy-tripdata.s3.amazonaws.com/index.html) a period of 12 months, from the start of April 2020 to the end of May 2021 under this [license](https://ride.divvybikes.com/data-license-agreement). So, I decided to store the original files in my laptop. Also, I made copies of each dataset, in case the originals need to be referenced.

#### Identify how it’s organized 
All downloaded files are saved in (CSV) format. Columns in total 13: 

ride_id, rideable_type, started_at, ended_at, start_station_name, start_station_id, end_station_name, end_station_id, start_lat,  
start_lng, end_lng, member_casual

#### Sort and filter the data
Due to the large size of the dataset, data processing will be done using the R programming language and R Studio.

####  Determine the credibility of the data
There are no issues with bias or credibility in this data. ROCCC approach is used to determine the credibility of the data(reliable, original, comprehensive, current and cited):
* reliable - small amount of records have missing values but represents all bike rides taken in the city of Chicago
* original - the data is made available by Motivate International Inc.
* comprehensive - the data includes all information about ride details
* current - it is up-to-date as it includes data until end of May 2021
* cited - the data is cited and is available under Data License Agreement

## 3. Process

#### Tool of your choice
R Programming is used for its ability to handle huge datasets efficiently. I used R for data verification and cleaning. The 12 data sets combined will contain more than 3 million rows(3,489,748) of data. Excel worksheet limitation is 1,048,576 rows. Moreover, some csv files could not be uploaded to BigQuery for file size problems(unable to upload a file size over 100mb if there is no paid account). Thus, I use R to perform all tasks from organizing, cleaning analyzing and visualizing data.

#### Importing data 
All data sets were imported into R Studio from from 04/2020 until 05/2021 and read as .csv files. Next, stack individual each month data frames into one big data frame using function bind_rows() which is similar to union all query in SQL. Also, it was determined that for the purpose of this analysis the columns start_lat, start_lng, end_lat and end_lng were not required.

#### Clean up and add data to prepare for analysis
The contents of the datasets were inspected by using the colnames(), nrow(), dim(), head(), str() and summary() functions. The data can only be aggregated at the ride-level, which is too granular. We will want to add some additional columns of data: such as day, month, year that provide additional opportunities to aggregate the data. And we will add two new columns ride_length to the entire dataframe for consistency by calculating by using the started_at and ended_at time values. The ride_length is calculated in seconds and minutes. The day of the week that rides occurred on was also created in a new column using the weekdays() function. And we had checked to see if there were any negative values in the ride_length column as that would indicate the ride ended before it began or start_time and end_time were swapped for these rides, so negative results were excluded).

#### Conduct descriptive analysis

Descriptive analysis on ride_length: mean, median, max, and min. Using aggregate() function enables us to see the average ride time by each day for members vs casual users. We noticed that the days of the week are out of order. In order to fix that ordered() function should written. Next, analyze ridership data by type and weekday using functions: 
mutate() creates weekday field, group_by() groups by usertype and weekday, summarise() calculates the number of rides and average duration and arrage() which helps to sort. 

## 4. Analyze

Now data is stored appropriately and has been prepared for analysis, let's start putting it to work.

You can to view the R script and the summary of complete analysis process [here](https://github.com/SomonOlimzoda/MyProjects/edit/main/R%20script). 

Further analysis were carried out to perform calculations, identify trends and relationships using PivotTable and Charts in Excel. 

You can view my Excel files used for analysis process [here](https://github.com/SomonOlimzoda/MyProjects/blob/main/worksheet%20summary.xlsx).

## 5. Share
Now that I have performed analysis and gained some insights from data, where we gonna create compelling visualizations in order to effectively communicate to the executive team and share findings. As a tool I chosed to use Tableau. Tableau is a leading data visualization tool used for data analysis and business intelligence helps to create different charts and graphs, in addition to visualizing data through reports and dashboards in Tableau to derive meaningful insights. 

You can my view Tableau visualizations [here](https://public.tableau.com/app/profile/somon4257/viz/CyclisticCaseStudy_16725342985840/CyclisticCaseStudyVisualizations).

## 6. Act
Now I have finished creating all visualizations, I will start acting on key findings. Prepare the deliverables Morena asked me to create, including the three top recommendations based on analysis had been carried out.


































