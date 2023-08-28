-- Query to return id, product_id, transaction_type, unit_of_measure

SELECT
    id, product_id, transaction_type, unit_of_measure
FROM
    example_2.transactions
WHERE
    product_id = 50
    AND MONTH (ship_date) = 6;
