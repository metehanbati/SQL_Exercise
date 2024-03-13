--Create a Rollup Table
--Log onto Mode Analytics and from the home page, create a new report by clicking on the green
--plus sign button in the upper right-hand corner. Enter the starter code where provided for each
--exercise. You may want to create a new tab for each exercise.
--Please use the discussion forum for any questions and/or comments you might have. Once you
--have tried the exercises, feel free to watch the solutions video. Good luck with your practice!
--Note: When querying a table, remember to prepend dsv1069, which is the schema, or folder
--that contains the course data.
--
--Exercise 1: Create a subtable of orders per day. Make sure you decide whether you are
--counting invoices or line items.

SELECT 
      DATE(created_at)              AS Order_date, 
      COUNT(DISTINCT invoice_id)    AS Order_Number, 
      COUNT(DISTINCT line_item_id)  AS Order_item
FROM 
  dsv1069.orders
GROUP BY 
  Order_date 
ORDER BY 
  Order_date DESC



--Exercise 2: “Check your joins”. We are still trying to count orders per day. In this step join the
--sub table from the previous exercise to the dates rollup table so we can get a row for every
--date. Check that the join works by just running a “select *” query

SELECT *
FROM 
  dsv1069.dates_rollup
LEFT OUTER JOIN 
  (SELECT 
        DATE(created_at)              AS order_date, 
        COUNT(DISTINCT invoice_id)    AS order_Number, 
        COUNT(DISTINCT line_item_id)  AS order_item
  FROM 
    dsv1069.orders
  GROUP BY 
    Order_date 
  ORDER BY 
    Order_date DESC) daily_orders
ON 
  daily_orders.order_date = dates_rollup.date 




--Exercise 3: “Clean up your Columns” In this step be sure to specify the columns you actually
--want to return, and if necessary do any aggregation needed to get a count of the orders made
--per day.

SELECT 
  dates_rollup.date, 
  COALESCE(SUM(order_number),0) AS orders,
  COALESCE(SUM(order_item),0)   AS item_orders
FROM 
  dsv1069.dates_rollup
LEFT OUTER JOIN 
  (SELECT 
        DATE(created_at)              AS order_date, 
        COUNT(DISTINCT invoice_id)    AS order_Number, 
        COUNT(DISTINCT line_item_id)  AS order_item
  FROM 
    dsv1069.orders
  GROUP BY 
    Order_date 
  ORDER BY 
    Order_date DESC) daily_orders
ON 
  daily_orders.order_date = dates_rollup.date 
GROUP BY 
  dates_rollup.date


--Exercise 4: Weekly Rollup. Figure out which parts of the JOIN condition need to be edited
--create 7 day rolling orders table.


SELECT *
FROM 
  dsv1069.dates_rollup
LEFT OUTER JOIN 
  (SELECT 
        DATE(created_at)              AS order_date, 
        COUNT(DISTINCT invoice_id)    AS order_Number, 
        COUNT(DISTINCT line_item_id)  AS order_item
  FROM 
    dsv1069.orders
  GROUP BY 
    Order_date 
  ORDER BY 
    Order_date DESC) daily_orders
ON 
  dates_rollup.date >= daily_orders.order_date
AND 
  dates_rollup.d7_ago  < daily_orders.order_date



--Exercise 5: Column Cleanup. Finish creating the weekly rolling orders table, by performing
--any aggregation steps and naming your columns appropriately.

SELECT 
  dates_rollup.date, 
  COALESCE(SUM(order_number),0) AS orders,
  COALESCE(SUM(order_item),0)   AS item_orders
FROM 
  dsv1069.dates_rollup
LEFT OUTER JOIN 
  (SELECT 
        DATE(created_at)              AS order_date, 
        COUNT(DISTINCT invoice_id)    AS order_Number, 
        COUNT(DISTINCT line_item_id)  AS order_item
  FROM 
    dsv1069.orders
  GROUP BY 
    Order_date 
  ORDER BY 
    Order_date DESC) daily_orders
ON 
  dates_rollup.date >= daily_orders.order_date
AND 
  dates_rollup.d7_ago  < daily_orders.order_date
GROUP BY 
  dates_rollup.date