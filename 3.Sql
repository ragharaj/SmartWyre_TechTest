-- Creating a view

CREATE VIEW example3.valid_product_prices AS
SELECT
  p.id,
  p.name,
  p.unit_of_measure,
  pp.valid_product_price,
  pp.published_date
FROM
  example3.product p
INNER JOIN
  example3.product_prices pp 
ON
  p.id = pp.product_id
AND
  p.unit_of_measure = pp.unit_of_measure

-- Usage

SELECT * FROM example3.valid_product_prices
  
  
