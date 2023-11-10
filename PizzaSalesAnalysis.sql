Select * From pizza_sales

--Total Revenue
Select SUM(total_price) AS TotalRevenue from pizza_sales

--Average Order Value
Select SUM(total_price) / COUNT(DISTINCT order_id) as AverageOrderValue from pizza_sales

--Total Pizza Sold
Select SUM(quantity) as TotalPizzaSold from pizza_sales

--Total Order
Select COUNT(DISTINCT order_id) as Total_Order from pizza_sales

--Average Pizza per Order
Select CAST(CAST(SUM(quantity) as DECIMAL (10,2)) / 
CAST(COUNT(DISTINCT order_id) as DECIMAL (10,2)) as DECIMAL (10,2))
as AveragePizzaPerOrder from pizza_sales

--Daily Trend of Total Order
Select DATENAME(DW, order_date) as Order_Day, COUNT(DISTINCT order_id) as Total_Orders
From pizza_sales
Group By DATENAME(DW, order_date)

--Hourly Trend of Total Order
Select Datepart(Hour, order_time) as Order_Hours, COUNT(DISTINCT order_id) as Total_Orders
From pizza_sales
Group By Datepart(Hour, order_time)
Order By Datepart(Hour, order_time)