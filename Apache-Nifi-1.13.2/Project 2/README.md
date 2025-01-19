# Project Overview:
The Youtube_Data project is designed to automate the process of retrieving, transforming, and storing video metadata from YouTube into a structured database (MySQL). Using YouTube Data API in combination with Apache NiFi, this project aims to provide an efficient pipeline for extracting data at scale. The stored data will then be used to analyze trends, video performance, and audience engagement on YouTube, providing valuable insights for businesses, content creators, or marketers. The goal is to create a system that continuously pulls data from YouTube and makes it easily accessible for reporting and analysis.

# Key Components:
YouTube Data API: This API provides access to YouTube's data, such as video details, statistics, playlists, and channel information. It allows us to fetch metadata in a structured format.
Apache NiFi: NiFi is used to manage the automated data flow and processing pipeline. NiFi will handle the extraction, transformation, and loading (ETL) of the raw YouTube data into the MySQL database.
MySQL Database: The data from the YouTube API will be stored in MySQL, a relational database management system, ensuring that the data is structured, easy to query, and scalable.
Detailed Project Goals:
Automate Data Retrieval:

Set up a process that automatically pulls video metadata from YouTube using the YouTube Data API.
The system will regularly pull new data to ensure the latest video performance statistics and trends are captured.
# Data Transformation:

Transform the raw JSON data returned by the API into a structured format that can be efficiently stored in a relational database.
The metadata transformation process will include parsing JSON data into distinct fields, such as video ID, title, description, view count, like count, and more.
Storage in a MySQL Database:

Design and implement a MySQL database schema to store the video metadata in an organized manner.
Ensure that data is normalized, reducing redundancy and enhancing query performance.
Efficient Data Management:

Create a system that efficiently manages the data, allowing for easy insertion, updating, and deletion of records.
Implement error handling and data validation to ensure data integrity.
Real-Time Data Updates:

Set up a schedule within NiFi to update the database periodically, ensuring that new metadata from YouTube videos is continuously added to the system.
Enable the pipeline to handle real-time updates to track new videos, views, likes, and other metrics.
# Scalability:

Ensure the solution is scalable and capable of handling a growing dataset. As YouTube data continues to expand, the pipeline should be able to scale to accommodate more data sources, such as additional video channels or categories.
Project Contribution:
Automated Data Flow:

The primary contribution of the project is automating the entire data collection process. Manual extraction of YouTube video metadata is tedious and time-consuming, but the integration of NiFi and the YouTube Data API streamlines this process, allowing for faster, more efficient data retrieval.
Structured Data for Analysis:

By transforming raw data into a structured format and storing it in MySQL, the project makes it possible to easily run SQL queries to analyze video performance. This structured approach allows for deeper insights into trends and patterns that are otherwise difficult to uncover from unprocessed data.
Scalability and Performance:

The use of Apache NiFi ensures that the system can handle large amounts of data in a scalable and efficient way. As the amount of YouTube data grows, the system can be configured to scale up accordingly, accommodating more videos, more channels, and more data sources.
Real-Time Access to Video Insights:

With the system continuously fetching new data, stakeholders will have access to up-to-date video statistics, enabling them to make timely decisions based on real-time data. This is especially valuable for content creators or marketers who need to adjust their strategies based on current performance metrics.
Enhanced Decision-Making:

By having structured, regularly updated YouTube video data, content creators, marketers, or business analysts will be able to make better-informed decisions. This could include optimizing video content, increasing engagement strategies, or identifying trending topics and popular videos.
Data-Driven Insights:

The database allows users to query and extract meaningful insights from the data. Users can create reports on video performance metrics (e.g., view counts, likes/dislikes ratio, audience demographics) and use this information to optimize YouTube strategies.
# Detailed Steps to Implement the Project:
1. Setup YouTube Data API:
Register for an API Key: Sign up for a Google Cloud account and create a project to obtain the YouTube Data API v3 key.
API Endpoints: Use the API to access video details (e.g., title, description, view count, like count) and channel statistics. The Videos and Channels endpoints will be used to fetch video-specific data.
API Query Examples: Write basic queries to retrieve metadata for a list of YouTube videos, ensuring the correct API parameters are set for video IDs and channels.
2. Set Up Apache NiFi for Data Flow:
Data Flow Design: Create a NiFi data flow that schedules API calls to YouTube and processes incoming data. This can be achieved by using NiFi processors such as InvokeHTTP, ExtractText, and PutDatabaseRecord.
Data Extraction: Use InvokeHTTP to pull JSON data from YouTube's API and configure the response to be passed to downstream processors.
Data Transformation: Use NiFi processors like JoltTransformJSON or ExtractText to parse and structure the raw JSON data into individual attributes (video ID, title, view count, etc.).
Error Handling: Implement error handling in NiFi using the LogMessage processor to log failures and retries.
3. Design MySQL Schema for Storage:
Database Schema: Design a schema to store the transformed data. Key tables might include:
videos: stores metadata like video ID, title, description, view count, like count, etc.
channels: stores channel-level data like channel ID, name, subscriber count, etc.
video_stats: stores time-series data for video performance metrics (e.g., daily views).
SQL Data Types: Ensure that appropriate SQL data types are selected for each column. Use VARCHAR for text data, INT for numerical data, DATETIME for timestamps, and FLOAT for metrics like view counts.
4. Insert Transformed Data into MySQL:
NiFi Processors for Insertion: Use NiFi processors like PutDatabaseRecord to insert the structured data into MySQL. This processor can map NiFi flowfile attributes directly to database fields.
Database Connectivity: Ensure that NiFi has the necessary database connection details, such as host, username, password, and table schema, for inserting data.
5. Automate Data Updates:
NiFi Scheduling: Schedule the NiFi data flow to run periodically, ensuring that new YouTube video metadata is continuously pulled into the database.
Incremental Updates: Implement logic to update only the new videos or changed video statistics, avoiding duplicate entries in the database.
6. Data Analysis and Reporting:
Once the data is stored in MySQL, use SQL queries to perform analysis, such as:
Trend analysis of views and likes over time.
Comparison of video performance across different channels.
Audience engagement metrics for videos.
You can also create reports or dashboards for visualization (using tools like Tableau or Power BI).
Expected Results:
Fully Automated Data Pipeline: The system will automatically retrieve, transform, and store YouTube metadata at regular intervals.
Easily Accessible Data: The metadata stored in MySQL will be easy to query, allowing users to gain valuable insights into video performance and trends.
Real-Time Data: The database will always contain up-to-date information about YouTube videos, channels, and performance metrics.
Improved Decision-Making: With real-time and structured data, businesses and content creators will be able to adjust strategies based on insights from their YouTube content performance.
![image](https://github.com/user-attachments/assets/1ed7978f-d871-4fa6-93d2-b6623fa44dd3)
