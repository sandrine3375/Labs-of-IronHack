-- 1. From the order_items table, find the price of the highest priced order and lowest price order.
SELECT * FROM olist.customers;
SELECT price, order_item_id, order_id FROM olist.order_items
ORDER by price desc
limit 1; -- 6735
SELECT price, order_item_id, order_id FROM olist.order_items
ORDER by price asc
limit 1;  -- 0.85

-- 2. From the order_items table, what is range of the shipping_limit_date of the orders?
SELECT min(shipping_limit_date), max(shipping_limit_date) FROM olist.order_items;

-- 3. From the customers table, find the states with the greatest number of customers.
SELECT customer_state, count(customer_unique_id) FROM olist.customers
group by customer_state
order by count(customer_unique_id) desc;

-- 4. From the customers table, within the state with the greatest number of customers, find the cities with the greatest number of customers.
SELECT customer_state, count(customer_id) as total_custumer FROM olist.customers
group by customer_state
limit 1 ;
SELECT customer_city, count(customer_id) as total_customer FROM olist.customers
where customer_state = "SP"
order by total_customer;


-- 5. From the closed_deals table, how many distinct business segments are there (not including null)?
SELECT count(distinct (business_segment))   FROM olist.closed_deals;
 
  
  -- 6. From the closed_deals table, sum the declared_monthly_revenue for duplicate row values in business_segment and find the 3 business segments with the highest declared monthly revenue (of those that declared revenue).
SELECT sum(declared_monthly_revenue)  FROM olist.closed_deals;
  

-- 7. From the order_reviews table, find the total number of distinct review score values.
Select count(distinct review_score) from olist.order_reviews;

-- 8. In the order_reviews table, create a new column with a description that corresponds to each number category for each review score from 1 - 5, then find the review score and category occurring most frequently in the table.
select * from olist.order_reviews;
alter table olist.order_reviews ADD column category_review char(50);
SELECT review_score, count(review_score),
   CASE review_score
      WHEN 1 THEN ‘Bad’
      WHEN 2 THEN ‘Poor’
      WHEN 3 THEN ‘Satisfactory’
	WHEN 4 THEN ‘Good’
      WHEN 5 THEN ‘Perfect’
   END AS review_categ
 FROM olist.order_reviews group by review_categ order by count(review_score) desc;
 
-- 9. From the order_reviews table, find the review value occurring most frequently and how many times it occurs.
select  review_score, count(review_score) as reviews
from olist.order_reviews
group by review_score
order by reviews desc limit 1;
