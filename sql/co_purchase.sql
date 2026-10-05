-- «С этим часто покупают»
WITH pairs AS (
    SELECT o1.product_id AS a, o2.product_id AS b, COUNT(*) AS n
    FROM order_items o1
    JOIN order_items o2 ON o1.order_id = o2.order_id
                       AND o1.product_id < o2.product_id
    GROUP BY a, b
)
SELECT a, b, n
FROM pairs
WHERE a = $product_id
ORDER BY n DESC LIMIT 10;
