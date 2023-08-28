-- Create a nonclustered index called IX_published_date   
CREATE NONCLUSTERED INDEX IX_published_date   
    ON example_1.product_prices (published_date);

-- Query to return Product Name, Product Price, Published Date
WITH cte as (
  SELECT 
      product_id, max(published_date) as max_pub_date
  FROM 
      example_1.product_prices
  WHERE 
      product_id in (100,200,300,400)
      AND published_date <= '2022-06-10'
  GROUP BY 
      product_id
)

SELECT
    p.name AS product_name,
    pp.product_price,
    pp.published_date
FROM
    example_1.products p
JOIN 
    example_1.product_prices pp ON p.id = pp.product_id
JOIN
    cte c ON p.id = c.product_id
    AND pp.published_date = c.max_pub_date
WHERE
    p.id IN (100,200,300,400)
    
