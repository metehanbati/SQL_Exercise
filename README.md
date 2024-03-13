# SQL Rollup Table Exercise

This repository contains SQL queries for creating rollup tables using Mode Analytics. The exercises focus on manipulating and joining tables to generate various rollup reports based on orders data.

## Setup

To complete these exercises, you'll need access to a SQL database via Mode Analytics. Make sure you have the necessary permissions to create and run queries.

## Exercise Overview

The exercises are designed to progressively build a rollup table for analyzing order data. Each exercise introduces new concepts and challenges in SQL query writing.

1. **Create a Subtable of Orders per Day**: Count the number of orders and items per day.
2. **Check Your Joins**: Join the subtable from Exercise 1 with a dates rollup table to ensure every date has a corresponding row.
3. **Clean Up Your Columns**: Specify the columns to return and perform any necessary aggregations for counting orders per day.
4. **Weekly Rollup**: Adjust the join condition to create a rolling 7-day order table.
5. **Column Cleanup**: Finalize the weekly rolling orders table by performing aggregation steps and naming columns appropriately.

## Running the Queries

Each exercise provides a SQL query along with instructions for running it in Mode Analytics. Make sure to follow the provided steps for each exercise to build the rollup table successfully.

## Files

- `exercise.sql`: Contains SQL queries for each exercise.
- `README.md`: This file, providing an overview of the exercises and instructions for running the queries.

## Feedback and Contributions

If you encounter any issues with the exercises or have suggestions for improvement, feel free to open an issue or submit a pull request. Your feedback is valuable in enhancing the learning experience for others.

## Acknowledgments

These exercises were adapted from a learning resource on Mode Analytics. Special thanks to the creators for providing this valuable learning material.

Happy querying!

