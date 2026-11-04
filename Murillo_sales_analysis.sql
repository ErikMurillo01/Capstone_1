-- Capstone 1: Data Storytelling, Excel & SQL
-- Sales Territory: Texas
-- Region: South
-- Regional Director: Andy Gisselquist
-- Sales Manager: Jeff "Howdy" Richards
-- Sales Channel: In-store

USE sample_sales;
-- Question 1: Total revenue and data date range
-- Question 2: Revenue by year and month
-- Question 3: Compare Texas revenue with South region revenue
-- Question 4: Monthly transactions and average transaction
-- amount by product category
-- Question 5: Rank stores by sales performance in Texas
-- Question 6: Recommendation for next quarter


-- Question 1: Total revenue and data date range
Select SUM(Sale_Amount) AS Total_Revenue,Min(Transaction_Date) AS Start_Date,Max(Transaction_Date) AS End_Date
FROM Store_Sales JOIN Store_Locations ON Store_Sales.Store_ID= Store_Locations.StoreId
WHERE Store_Locations.State='Texas';


-- Question 2: Revenue by year and month
SELECT YEAR(Transaction_Date) AS Year, MONTH(Transaction_Date) AS Month, SUM(Sale_Amount) AS Total_Revenue
FROM Store_Sales JOIN Store_Locations ON Store_Sales.Store_ID=Store_Locations.StoreId
WHERE Store_Locations.State='Texas'
GROUP BY YEAR(Transaction_Date), MONTH(Transaction_Date)
ORDER BY 1 ASC, 2 ASC;

-- Question 3: Compare Texas revenue with South region revenue;

SELECT Management.State,Sum(Sale_Amount) As Total_Revenue
FROM Store_Sales JOIN Store_Locations ON Store_Sales.Store_ID=Store_Locations.StoreId JOIN Management ON Store_Locations.State= Management.State
WHERE Management.State='Texas'
Group by Management.State
Order by 2 DESC;

SELECT Management.Region,Sum(Sale_Amount) As Total_Revenue
FROM Store_Sales JOIN Store_Locations ON Store_Sales.Store_ID=Store_Locations.StoreId JOIN Management ON Store_Locations.State= Management.State
WHERE Management.Region='South'
GROUP BY Management.Region;


-- Question 4: Monthly transactions and average transaction
Select YEAR(Transaction_Date) As Year ,Month(Transaction_Date) As Month, Count(Transaction_Date) As Total_per_month
From Store_Sales JOIN Store_Locations ON Store_Sales.Store_ID= Store_Locations.StoreId
WHERE Store_Locations.State='Texas'
Group by YEAR(Transaction_Date),MONTH(Transaction_Date)
Order by 1 ASC, 2 ASC;

SELECT Inventory_Categories.Category, AVG(Sale_Amount) AS Average_Sale
FROM Inventory_Categories JOIN Products ON Inventory_Categories.Categoryid=Products.Categoryid JOIN Store_Sales ON Products.ProdNum= Store_Sales.Prod_Num
JOIN Store_Locations ON Store_Sales.Store_ID= Store_Locations.StoreId
WHERE Store_Locations.State='Texas'
GROUP BY Inventory_Categories.Category;

-- Question 5: Rank stores by sales performance in Texas
SELECT State, StoreLocation, SUM(Sale_Amount) AS TotalSales_Performance
FROM Store_Locations JOIN Store_Sales ON Store_Locations.StoreId= Store_Sales.Store_ID
WHERE State='Texas'
GROUP BY State, StoreLocation
ORDER BY 3 DESC;

-- Question 6: Recommendation for Next Quarter
-- Technology & Accessories generated the highest total revenue
-- in Texas at $2,445,117.66 across the available dataset.
-- I recommend prioritizing this category next quarter by
-- maintaining product availability and focusing marketing efforts
-- on these products. I would also monitor monthly sales trends
-- before making further inventory decisions.

SELECT Category, SUM(Sale_Amount) As Total_revenue
FROM Store_Locations JOIN Store_Sales ON Store_Locations.StoreId= Store_Sales.Store_ID JOIN Products ON Store_Sales.Prod_Num= Products.ProdNum JOIN Inventory_Categories
ON Products.Categoryid= Inventory_Categories.Categoryid
WHERE State='Texas'
Group BY Category
ORDER BY 2 DESC;















