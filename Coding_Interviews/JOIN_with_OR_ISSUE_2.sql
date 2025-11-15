SELECT s.*, 
p.product_id, 
p.category 
FROM search_logs s 
LEFT JOIN products p 
ON s.search_term = p.product_sku OR s.search_term = p.product_name
order by p.category

SELECT s.*, 
p.product_id, 
p.category 
FROM search_logs s 
LEFT JOIN products p 
ON charindex(s.search_term, p.product_sku +'|'+ p.product_name)>0
order by p.category

SELECT s.*, 
COALESCE(p1.product_id, p2.product_id) as product_id, 
COALESCE(p1.category, p2.category) as category 
FROM search_logs s 
LEFT JOIN products p1 ON s.search_term = p1.product_sku 
LEFT JOIN products p2 ON s.search_term = p2.product_name 
AND p1.product_id IS NULL
order by category
select '*********'

SELECT s.*, 
p1.product_id, 
p1.category
FROM search_logs s 
LEFT JOIN products p1 ON s.search_term = p1.product_sku 
where p1.product_id is not null
union
SELECT s.*, 
p2.product_id, 
p2.category
FROM search_logs s 
LEFT JOIN products p2 ON s.search_term = p2.product_name 
where p2.product_id is not null
order by category