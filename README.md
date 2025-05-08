# SQL Concerts Database Project

This project implements a relational database for managing concert-related information such as artists, events, venues, and ticket sales. It is structured using normalised SQL schema design principles and includes full data population scripts.

Features
  -Schema Definition (modified_concerts_schema.sql / code.sql):
  -Defines tables for Artists, Concerts, Venues, Tickets, and related entities.
  -Applies primary and foreign key constraints for data integrity.
  -Includes necessary data types, indexing, and constraints for efficient querying.
  -Data Population (data.sql):
    -Populates tables with representative sample data for testing and analysis.
    -Ensures referential integrity is maintained during insertion.

Technologies:
  -SQL (PostgreSQL / MySQL-compatible syntax assumed)
  -Compatible with most relational DBMS systems (may require minor adjustments)
  
Usage:
  -Run the schema file to create the database structure:
  (source modified_concerts_schema.sql;)
  -Load the data:
  (source data.sql;)
  
This database is suitable for analysis, reporting, or application integration involving event and ticket management.
