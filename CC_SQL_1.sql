#ASSIGNMENT-01SQL
#Develop a SQL query that will find out two Products for each product category that are most 
#popular in last 30 days. Popularity is based on maximum quantity sold in a particular category.

SELECT Cat_Id,Product_Id,ROW_NUMBER() OVER(PARTITION BY Cat_Id) AS Trending 
FROM (
  SELECT p.Cat_Id,p.Product_Id,o.Sale_Qty,
         ROW_NUMBER() OVER (PARTITION BY p.Cat_Id ORDER BY o.Sale_Qty DESC) rn
  FROM product_catalogue p INNER JOIN purchase_history o
  ON o.Product_Id = p.Product_Id
  GROUP BY p.Product_Id 
) t
WHERE rn <= 2 and Cat_Id != 3
ORDER BY Product_Id;