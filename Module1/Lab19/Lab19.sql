use olist;
select * from order_items;
#1. Maximum value of price order 6735
select max(price), product_id from order_items
group by product_id
order by max(price) desc
limit 1; 
#1. Lowest value of price order 0.85
select min(price), product_id from order_items
group by product_id
order by min(price) asc
limit 1;
#2. Range of the shipping limit date
select max(shipping_limit_date), min(shipping_limit_date) from order_items; 
#3. Find the states with the greatest number of customers
select customer_state, count(customer_id) as "Number of Customers" from customers
group by customer_state; 
#4. Within the state with the greatest number of customers, find the cities with the greatest number of customers.
select customer_city, count(customer_id) as "Number of Customers" from customers
where customer_state = 'SP' 
group by customer_city 
order by count(customer_id) desc;
#5. How many distinct business segments are there (not including null)
select count(business_segment) as "Number of distinct business" from closed_deals
where business_segment is not NULL; 
#6. 
select count(business_segment) as "Number of distinct business", business_segment from closed_deals 
group by business_segment
having count(mql_id) > 1 
order by sum(declared_monthly_revenue)
desc limit 3;
#7.
select count(distinct(review_score)) from order_reviews;
#8.Não funciona. Now it works removing select all on the count(review_score)
create table new_column2 as
SELECT count(review_score),
CASE WHEN review_score = '1' THEN 'Terrible'
WHEN review_score = '2' THEN 'Bad'
WHEN review_score = '3' THEN 'Acceptable'
WHEN review_score = '4' THEN 'Good'
ELSE 'Very Good!'
END AS Description_review
FROM olist.order_reviews
GROUP BY review_score
ORDER BY count(review_score) DESC;
select * from new_column2;
#9.
select review_score, count(review_id) from order_reviews
group by review_score
order by review_score;


