# Process Flow in NiFi
# Project: WeatherData
To build the complete flow in Apache NiFi, we use a series of processors that carry out different tasks:

GetFile Processor:

Purpose: This processor is used to fetch input files that contain a list of cities. The files are typically in CSV format.
Configuration: Configure the directory path where city files are stored.
Flow: After the file is fetched, the flow will pass to the next processor to process the list.
Weather Processor (Custom Processor in Java):

Purpose: This custom processor (created using Java) fetches weather data from the OpenWeather API for each city listed in the input file. It outputs the fetched data as FlowFile content.
Configuration: The processor requires an API key and city names as properties. It will generate the weather data as JSON.
Flow: Weather data will be passed to the next processor for further processing.
UpdateAttribute Processor:

Purpose: This processor is used to update attributes of FlowFiles. For example, we can set attributes like city_name, weather_status, response_code, etc.
Configuration: Use NiFi expression language to dynamically assign values to attributes based on the fetched weather data.
ReplaceText Processor:

Purpose: This processor is used to modify or extract text from FlowFile content. For instance, we may want to extract certain details from the JSON response (like temperature, humidity) and store them in a simplified format.
Configuration: Configure the regular expression or transformation rules to extract the relevant data.
SplitText Processor:

Purpose: This processor can be used to split the fetched weather data into smaller chunks for further processing or storage.
Flow: For example, if the weather data contains information about multiple cities, this processor can split it into individual city records.
QueryDatabaseTable Processor (SQL):

Purpose: After extracting relevant data, this processor can be used to query a database (e.g., MySQL, PostgreSQL) for additional details, such as checking if a city exists in a local database or if the weather data needs updating.
Configuration: Configure the database connection details, query SQL to fetch additional data or update records.
PutFile Processor:

Purpose: Once the data is processed, this processor is used to store the weather data (as FlowFiles) to a local file system.
Configuration: Set the directory path where the weather data should be stored, such as /output/weather_data/.
PutHDFS Processor:

Purpose: If you're working in a distributed environment, you may want to store the processed data in HDFS (Hadoop Distributed File System).
Configuration: Configure the HDFS connection details and the path where the files should be saved.
PutEmail Processor:

Purpose: This processor is used to send an email notification if an error occurs during the weather data fetching or processing.
Configuration: Configure the SMTP server details and email content. Use NiFi Expression Language to include dynamic details like error messages or city names in the email body.
PutSQL Processor:

Purpose: This processor can be used to insert the fetched weather data into a database for storage or analysis.
Configuration: Configure the database connection and SQL insert statements.
Detailed Steps in NiFi Flow
GetFile: The flow starts by fetching the CSV file containing city names.

Example: cities.csv with city names like "New York", "London", "Tokyo".
Weather Processor (Custom Java Processor): For each city, the processor fetches weather data from the OpenWeather API.

City name is passed as input to the API.
Weather data is fetched in JSON format (temperature, humidity, weather status, etc.).
UpdateAttribute: Adds attributes like city_name, temperature, humidity, weather_status based on the weather data for further processing.

ReplaceText: Modify the content or format of the weather data, such as extracting just the temperature or weather condition.

SplitText: If the response contains data for multiple cities, use this processor to split the data for each city.

QueryDatabaseTable: Use this processor to query a database if needed to update records or check if the city exists in a database.

PutFile: Store the weather data in local storage in a structured format such as JSON or CSV.

PutHDFS: If you're working in a distributed environment, use this processor to save the data in HDFS for larger-scale storage.

PutEmail: If an error occurs during the fetch or processing of weather data, use this processor to send an email notification with the error message.

PutSQL: Finally, insert the processed weather data into a relational database for analysis or reporting.

Java Code (Weather Processor)
You will write a custom NiFi processor in Java (like the WeatherProcessor shown earlier) that fetches the weather data. This processor will be compiled into a .nar file and deployed into NiFi. It interacts with NiFi through its onTrigger method and generates FlowFiles containing the weather data.

Process Flow Diagram in NiFi
GetFile Processor: Reads input file (e.g., cities.csv).
WeatherProcessor: Fetches weather data for each city.
UpdateAttribute: Adds dynamic attributes for processing.
ReplaceText: Transforms or extracts relevant weather information.
SplitText: Splits multiple city records into individual records.
QueryDatabaseTable: Queries the database for additional data or updates.
PutFile: Saves the processed data to the file system.
PutHDFS: Saves to HDFS if required.
PutEmail: Sends an email notification in case of failure.
PutSQL: Inserts the weather data into a database.
Conclusion
This project combines data fetching, transformation, storage, and notification in a seamless ETL pipeline using Apache NiFi. It shows how to build a robust system for processing weather data, including handling potential errors, querying a database, and storing results locally or in a distributed file system.
