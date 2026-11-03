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



Select SUM(Sale_Amount) AS Total_Revenue,Min(Transaction_Date) AS Start_Date,Max(Transaction_Date) AS End_Date
FROM Store_Sales JOIN Store_Locations ON Store_Sales.Store_ID= Store_Locations.StoreId
WHERE Store_Locations.State='Texas';



SELECT YEAR(Transaction_Date) AS Year, MONTH(Transaction_Date) AS Month, SUM(Sale_Amount) AS Total_Revenue
FROM Store_Sales JOIN Store_Locations ON Store_Sales.Store_ID=Store_Locations.StoreId
WHERE Store_Locations.State='Texas'
GROUP BY YEAR(Transaction_Date), MONTH(Transaction_Date)
ORDER BY 1 ASC, 2 ASC;

Question 3: Compare Texas revenue with South region revenue;

SELECT Management.State,Sum(Sale_Amount) As Total_Revenue
FROM Store_Sales JOIN Store_Locations ON Store_Sales.Store_ID=Store_Locations.StoreId JOIN Management ON Store_Locations.State= Management.State
WHERE Management.Region='South'
Group by Management.State
Order by 2 DESC;

SELECT Management.Region,Sum(Sale_Amount) As Total_Revenue
FROM Store_Sales JOIN Store_Locations ON Store_Sales.Store_ID=Store_Locations.StoreId JOIN Management ON Store_Locations.State= Management.State
WHERE Management.Region='South'
Order by 2 DESC;


Select YEAR(Transaction_Date) As Year ,Month(Transaction_Date) As Month, Count(Transaction_Date) As Total_per_month
From Store_Sales JOIN Store_Locations ON Store_Sales.Store_ID= Store_Locations.StoreId
WHERE Store_Locations.State='Texas'
Group by YEAR(Transaction_Date),MONTH(Transaction_Date);

SELECT Inventory_Categories.Category, AVG(Sale_Amount) AS Average_Sale
FROM Inventory_Categories JOIN Products ON Inventory_Categories.Categoryid=Products.Categoryid JOIN Store_Sales ON Products.ProdNum= Store_Sales.Prod_Num
JOIN Store_Locations ON Store_Sales.Store_ID= Store_Locations.StoreId
WHERE Store_Locations.State='Texas'
GROUP BY Inventory_Categories.Category










