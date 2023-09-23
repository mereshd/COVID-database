<h1 align="center" id="title">COVID Database & Analytics</h1>

## Description
We sourced publicly available datasets from the city of Chicago, focusing on case, death, and vaccination statistics. Our investigation also delved into the intricate relationships between these metrics and additional variables, such as vaccination and testing site densities categorized by zip code and age group. Following a comprehensive data cleansing process in Excel, we migrated the data into a MySQL database, where we constructed a dimensional model. Leveraging Tableau, we then harnessed the resulting schema to craft a series of compelling visualizations, rendering our findings more accessible and impactful.

## Project Breakdown
1) The Clean and Raw data along with the Source-to-Target Mapping(STM) spreadsheet can be found in the `COVID-database/Data/` directory
2) The SQL code with the DDL, DML, and some functionality/business-oriented commands can be found in the `COVID-database/SQL Code/` directory
3) The in-depth documentation of the project's progression, presentation, and video demo can be found in the `http://coviddatabase/Document&Slides&Video/` directory
4) The Tableau visualizations are in the `COVID-database/Tableau Visualizations/` directory
5) The final Entity-Relationship Diagram(ERD) is in the `COVID-database/Model/` directory. Its image can be found below:
   ![Entity-Relationship Diagram](COVID-database/Model/Final_Model.png)

## Tech Stack
- Excel (Data Cleaning and Aggregation)
- MySQL (DDL(Data Definition Language) and DML(Data Manipulation Language) tasks, Data Modeling)
- Tableau (Vizualization) 
