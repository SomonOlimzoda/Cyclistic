---
title: "Google Data Analytics Capstone Project #1"
subtitle: "Cyclistic Case Study"
author: "Somon Olimzoda"
date: "23/12/2022"
output: html_document
editor_options: 
  chunk_output_type: console
---

### Introdution

For the capstone project of the Google Data Analytics certificate, I have chosen the Cyclistic bike share data to work on. For the case study, I will perform real-world tasks of a junior data analyst for the marketing team at Cyclistic, a fictional bike-share company in Chicago.
To answer key business questions, I will follow the six steps of the data analysis process : Ask, Prepare, Process, Analyze, Share and Act.


### The scenario

The director of marketing of Cyclistic, Lily Moreno, believes that the company’s future growth depends on maximizing the number of annual memberships. Hence, the marketing analyst team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, the analytics team could be able to design a new marketing strategy to convert casual riders into annual members. 

Three questions will guide the future marketing campaign:

1.How do annual members and casual riders use Cyclistic bikes differently?

2.Why would casual riders buy Cyclistic annual memberships?

3.How can Cyclistic use digital media to influence casual riders to become members?

I have been assigned by Moreno the first question. 


### The Ask phase

* A statement of the business task: 

Cyclistic has concluded that annual members are much more profitable than casual riders. So, we want to design a marketing strategies and a campaign that helps us converting casual riders into annual members. 

* My key stakeholders are: 

1-Lily Moreno: The director of marketing and my manager. Moreno has initiated   this  strategy. The first stakeholder to deliver to. 

2-The executive team: For Moreno´s idea to work, the executive team must approve our recommendations, so so they must be backed up with compelling data insights and professional data visualizations.


### The Prepare phase

Data Source: 
Past 12 month of original bike share data set from 01/01/2021 to 31/12/2021 was extracted as 12 zipped .csv [files](https://divvy-tripdata.s3.amazonaws.com/index.html). The data is made available and licensed by Motivate International Inc under this [license](https://ride.divvybikes.com/data-license-agreement).

Data Organization & Description:

File naming convention: YYYY_MM

File Type:  csv  format 

File Content: Each csv file consist of 13 columns which contain information related to ride id, rider type, ride start and end time, start and end location  etc. Number of rows varies between 49k to 531k from different excel files.


Data credibility: 

The data set is reliable, the data is complete and accurate for the chosen time window.

The data is original, it is a first arty information.

The data is comprehensive, the data set contains all information needed to answer the question.

The data is current, rider data of the last 12 months was used.

The data is cited and vetted by Chicago department of transportation.


Data Security: Riders’ personal identifiable information is hidden through tokenization.

Original files are backed up in a separate folder.


Data Limitations: As riders’ personal identifiable information is hidden, thus will not be able to connect pass purchases to credit cards numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes.


